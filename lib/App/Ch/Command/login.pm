# ABSTRACT: logs into the chroot
package App::Ch::Command::login;

use strict;
use warnings;

use App::Ch -command;

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
