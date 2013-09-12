package App::Ch::Command::setup;

use strict;
use warnings;

use App::Ch -command;

sub opt_spec {
    return (
        [ 'arch',  'set the target architecture [ --arch=i386 ]' ],
        [ 'distribution', 'distribution [ sid|experimental|... ]'],
        [ 'mirror',  'mirror location [ http://ftp.us.debian.org/debian ]' ],
    );
}

sub execute {
    my ($self, $opt, $args) = @_;

    print "Test.\n";
}

1;
