# ABSTRACT: mount the chroot
package App::Ch::Command::start;

use strict;
use warnings;

use base 'App::Ch::Command';

sub execute {
    my ($self, $opt, $args) = @_;

    my $root = $self->get_root();
    my $name = ${$args}[0];

    $self->command("mount proc $root/$name/proc -t proc");
    $self->command("mount sysfs $root/$name/sys -t sysfs");
}

1;
