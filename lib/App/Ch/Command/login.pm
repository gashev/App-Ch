# ABSTRACT: logs into the chroot
package App::Ch::Command::login;

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

    $self->command("chroot /opt/chroot/$name");
}

1;
