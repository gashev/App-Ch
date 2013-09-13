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
}

1;
