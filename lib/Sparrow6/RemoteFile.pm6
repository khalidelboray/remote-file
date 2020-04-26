use v6;

unit module Sparrow6::RemoteFile;

use Sparrow6::DSL;

our sub tasks (%args) {

  package-install 'curl' unless %args<nodeps>;

  directory %args<location>.IO.dirname;

  my $cmd = "set -e"  ~ "\n";

  $cmd ~= 'if test -f ' ~ %args<location> ~ ' ; then ' ~ "\n";
  $cmd ~= 'echo file ' ~  %args<location> ~ ' exists, skip download' ~ "\n";
  $cmd ~= 'else' ~ "\n";

  $cmd ~= 'curl '  ~ %args<url> ~ ' -w \'%{url_effective} ==> <%{http_code}> \'' 
  ~ ' -L -s -k -f -o ' ~ %args<location>; 

  $cmd ~= ' -u' ~ %args<user> if %args<user>.defined;

  if %args<headers> {

    # -H "X-First-Name: Joe"
    for %args<headers> -> $h {
      $cmd ~= ' -H "' ~ $h ~ '"';
    }
  }


  $cmd ~= ':' ~ %args<password> if %args<password>.defined;

  $cmd ~= "\n" ~ 'fi' ~ "\n";

  $cmd ~= 'ls -lh ' ~ %args<location>;

  bash $cmd, %( description => "download remote file2", debug => 1 );

}

