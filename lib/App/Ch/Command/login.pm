# ABSTRACT: logs into the chroot
package App::Ch::Command::login;

use strict;
use warnings;

use base 'App::Ch::Command';

sub execute {
    my ($self, $opt, $args) = @_;

    my $root = $self->get_root();
    my $name = ${$args}[0];

    $self->command("chroot $root/$name");
}

1;
