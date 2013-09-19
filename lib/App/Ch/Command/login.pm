# ABSTRACT: logs into the chroot
package App::Ch::Command::login;

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

    $self->command("chroot $root/$name");
}

1;
