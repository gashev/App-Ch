# ABSTRACT: umount the chroot
package App::Ch::Command::stop;

use strict;
use warnings;

use base 'App::Ch::Command';

sub opt_spec {
    return (
        [
        ]
    );
}

sub execute {
    my ($self, $opt, $args) = @_;

    my $name = $opt->name;

    $self->command("umount /opt/chroot/$name/proc");
    $self->command("umount /opt/chroot/$name/sys");
}

1;
