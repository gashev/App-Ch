# ABSTRACT: bootstrap a basic system
package App::Ch::Command::setup;

use strict;
use warnings;

use base 'App::Ch::Command';

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
    );
}

sub execute {
    my ($self, $opt, $args) = @_;

    my $arch = $opt->arch;
    my $distribution = $opt->distribution;
    my $mirror = $opt->mirror;
    my $name = ${$args}[0];

    $self->command("/usr/sbin/debootstrap --arch $arch $distribution /opt/chroot/$name $mirror");
    $self->command("cp /etc/hosts /opt/chroot/$name/etc/hosts");
    $self->command("cp /proc/mounts /opt/chroot/$name/etc/mtab");
}

1;
