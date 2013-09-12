package App::Ch::Command::setup;

use strict;
use warnings;

use App::Ch -command;

sub opt_spec {
    return (
        [
            'arch=s',
            'set the target architecture [ --arch=i386 ]',
            { default => 'i386' }
        ],
        [
            'distribution=s',
            'distribution [ sid|experimental|... ]' ,
            { default => 'sid' }
        ],
        [
            'mirror=s',
            'mirror location [ http://ftp.us.debian.org/debian ]',
            { default => 'http://ftp.us.debian.org/debian' }
        ],
    );
}

sub execute {
    my ($self, $opt, $args) = @_;

    print "Test.\n";
}

1;
