# ABSTRACT: umount the chroot
package App::Ch::Command::stop;

use strict;
use warnings;

use base 'App::Ch::Command';

sub execute {
    my ($self, $opt, $args) = @_;

    my $root = $self->get_root();
    my $name = ${$args}[0];

    $self->command("umount $root/$name/proc");
    $self->command("umount $root/$name/sys");
}

1;
