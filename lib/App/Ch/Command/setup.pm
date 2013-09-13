# ABSTRACT: bootstrap a basic system
package App::Ch::Command::setup;

use strict;
use warnings;

use App::Ch -command;

sub opt_spec {
    return (
        [
            'arch=s',
            'set the target architecture [--arch=i386]',
            { default => 'i386' }
        ],
        [
            'distribution=s',
            'distribution [sid|experimental|...]' ,
            { default => 'sid' }
        ],
        [
            'mirror=s',
            'mirror location [http://ftp.us.debian.org/debian]',
            { default => 'http://ftp.us.debian.org/debian' }
        ],
        [
            'name=s',
            'name'
        ]
    );
}

sub execute {
    my ($self, $opt, $args) = @_;

    my $arch = $opt->arch;
    my $distribution = $opt->distribution;
    my $mirror = $opt->mirror;
    my $name = $opt->name;

    exec("/usr/sbin/debootstrap --arch $arch $distribution /opt/chroot/$name $mirror");
}

1;
