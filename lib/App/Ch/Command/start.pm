# ABSTRACT: mount the chroot
package App::Ch::Command::start;

use strict;
use warnings;

use base 'App::Ch::Command';

sub opt_spec {
    return (
        [
            'name=s',
            'name'
        ]
    );
}

sub execute {
    my ($self, $opt, $args) = @_;

    my $name = $opt->name;

    $self->command("mount proc /opt/chroot/$name/proc -t proc");
    $self->command("mount sysfs /opt/chroot/$name/sys -t sysfs");
}

1;
