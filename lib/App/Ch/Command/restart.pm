# ABSTRACT: remount the chroot
package App::Ch::Command::restart;

use strict;
use warnings;
use utf8;

use base 'App::Ch::Command';

use App::Ch::Mount;

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
    my $mount = App::Ch::Mount->new();

    $mount->remountChroot($root, $name);
}

1;
