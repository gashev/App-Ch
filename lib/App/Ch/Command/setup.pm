# ABSTRACT: bootstrap a basic system
package App::Ch::Command::setup;

use strict;
use warnings;
use utf8;

use base 'App::Ch::Command';

use App::Ch::Repository;
use POSIX qw/strftime/;

# VERSION

sub opt_spec {
    return (
        [
            'arch|a=s',
            'set the target architecture [--arch=i386]',
            { default => 'i386' }
        ],
        [
            'message|m=s',
            'chroot description'
        ],
        [
            'distribution|d=s',
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

    my $localtime    = strftime('%Y-%m-%d %H:%M:%S',localtime);
    my $root         = $self->get_root();
    my $arch         = $opt->arch;
    my $distribution = $opt->distribution;
    my $mirror       = $opt->mirror;
    my $message      = defined $opt->message ? $opt->message : '';
    my $name         = ${$args}[0];

    $self->worker()->run(
        "/usr/sbin/debootstrap --arch $arch $distribution $root/$name $mirror");
    $self->worker()->run("cp /etc/hosts $root/$name/etc/hosts");
    $self->worker()->run("cp /etc/resolv.conf $root/$name/etc/resolv.conf");
    $self->worker()->run("cp /proc/mounts $root/$name/etc/mtab");

    my $repository = App::Ch::Repository->new($root);
    $repository->add($name, $distribution, $localtime, $message);
}

1;
