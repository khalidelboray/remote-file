# SYNOPSIS

Fetch remote file using http.


# INSTALL

    $ panda install Sparrowdo::RemoteFile

# USAGE

    $ cat sparrowfile

    module_run 'RemoteFile' %(
        url       => 'http://somehost/somefile.tar.gz',
        location  => '/tmp/somefile.tar.gz'
    );

# Parameters

## url

Remote file url. No default value. Obligatory.

## location

A local file path where to store a downloaded file. No default value. Obligatory.
  
# Author

[Alexey Melezhik](melezhik@gmail.com)
