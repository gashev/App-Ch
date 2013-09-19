# ABSTRACT: mount the chroot
package App::Ch::Command::start;

use strict;
use warnings;

use base 'App::Ch::Command';

our $VERSION = '0.1';

sub validate_args {
    my ( $self, $opt, $args ) = @_;

    $self->check_chroot_name_argument($args);

    return 1;
}

sub execute {
    my ( $self, $opt, $args ) = @_;

    my $root = $self->get_root();
    my $name = ${$args}[0];

    $self->command("mount pts $root/$name/dev/pts -t devpts");
    $self->command("mount proc $root/$name/proc -t proc");
    $self->command("mount sysfs $root/$name/sys -t sysfs");
}

1;
