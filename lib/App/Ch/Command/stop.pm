# ABSTRACT: umount the chroot
package App::Ch::Command::stop;

use strict;
use warnings;

use base 'App::Ch::Command';

# VERSION

sub validate_args {
    my ( $self, $opt, $args ) = @_;

    $self->check_chroot_name_argument($args);

    return 1;
}

sub execute {
    my ( $self, $opt, $args ) = @_;

    my $root = $self->get_root();
    my $name = ${$args}[0];

    $self->command("umount $root/$name/dev/pts");
    $self->command("umount $root/$name/proc");
    $self->command("umount $root/$name/sys");
}

1;
