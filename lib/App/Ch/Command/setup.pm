# ABSTRACT: bootstrap a basic system
package App::Ch::Command::setup;

use strict;
use warnings;

use base 'App::Ch::Command';

our $VERSION = '0.1';

sub opt_spec {
    return (
        [
            'arch=s',
            'set the target architecture [--arch=i386]',
            { default => 'i386' }
        ],
        [
            'distribution=s',
            'distribution [sid|experimental|...]',
            { default => 'sid' }
        ],
        [
            'mirror=s',
            'mirror location [http://ftp.us.debian.org/debian]',
            { default => 'http://ftp.us.debian.org/debian' }
        ],
    );
}

sub validate_args {
    my ( $self, $opt, $args ) = @_;

    $self->check_chroot_name_argument($args);

    return 1;
}

sub execute {
    my ( $self, $opt, $args ) = @_;

    my $root         = $self->get_root();
    my $arch         = $opt->arch;
    my $distribution = $opt->distribution;
    my $mirror       = $opt->mirror;
    my $name         = ${$args}[0];

    $self->command(
        "/usr/sbin/debootstrap --arch $arch $distribution $root/$name $mirror");
    $self->command("cp /etc/hosts $root/$name/etc/hosts");
    $self->command("cp /etc/resolv.conf $root/$name/etc/resolv.conf");
    $self->command("cp /proc/mounts $root/$name/etc/mtab");
}

1;
