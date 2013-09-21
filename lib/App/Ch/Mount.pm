# ABSTRACT: Mount/umount filesystems for chroot
package App::Ch::Mount;

use strict;
use warnings;
use utf8;

use base 'App::Ch::Worker';

# VERSION

sub mountChroot {
    my ( $self, $root, $name) = @_;

    $self->run("mount pts $root/$name/dev/pts -t devpts");
    $self->run("mount proc $root/$name/proc -t proc");
    $self->run("mount sysfs $root/$name/sys -t sysfs");
}

sub umountChroot {
    my ( $self, $root, $name) = @_;

    $self->run("umount $root/$name/dev/pts");
    $self->run("umount $root/$name/proc");
    $self->run("umount $root/$name/sys");
}

sub remountChroot {
    my ( $self, $root, $name) = @_;

    $self->umountChroot($root, $name);
    $self->mountChroot($root, $name);
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

App::Ch::Mount - Mount/umount filesystems for chroot.

=head1 AUTHOR

Oleg Gashev <oleg@gashev.net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Oleg Gashev.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

