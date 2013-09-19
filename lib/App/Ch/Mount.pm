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
