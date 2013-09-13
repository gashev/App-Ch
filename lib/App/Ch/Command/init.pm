# ABSTRACT: create a new repository
package App::Ch::Command::init;

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
