# ABSTRACT: bootstrap a basic system.
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
    my $result       = 1;

    my @commands     = (
        "/usr/sbin/debootstrap --arch $arch $distribution $root/$name $mirror",
        "cp /etc/hosts $root/$name/etc/hosts",
        "cp /etc/resolv.conf $root/$name/etc/resolv.conf",
        "cp /proc/mounts $root/$name/etc/mtab"
    );

    for my $command (@commands) {
        $result &&= $self->worker()->run($command);
    }

    if ($result) {
        my $repository = App::Ch::Repository->new($root);
        return $repository->add($name, $distribution, $localtime, $message);
    }

    return 0;
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

App::Ch::Command::setup - bootstrap a basic system.

=head1 SYNOPSIS

  ch --root=CH_REPOSITORY_ROOT setup TARGET

=head1 DESCRIPTION

Setup command can be used to install Debian in a chroot environment.

=head1 COMMAND ARGUMENTS

TARGET is the chroot name that you want to delete.

=over 4

=item  -a --arch

Targer architecture. Default value is i386.

=item  -d --distribution

Specifies the distribution used. The supported values are the ones debootstrap
supports. Default value is sid.

=item  --mirror

Specifies  the  URL  of Debian mirror to be specified in sources.list inside
the chroot. Default value is http://ftp.us.debian.org/debian.

=item  -m --message

Chroot description. Default value is empty message.

=back

=head1 AUTHOR

Oleg Gashev <oleg@gashev.net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Oleg Gashev.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

