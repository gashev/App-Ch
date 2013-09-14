# ABSTRACT: permanently remove the chroot
package App::Ch::Command::delete;

use strict;
use warnings;

use base 'App::Ch::Command';

sub execute {
    my ($self, $opt, $args) = @_;

    my $name = ${$args}[0];

    $self->command("rm -rf /opt/chroot/$name");
}

1;
