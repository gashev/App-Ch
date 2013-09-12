package App::Ch::Command::setup;

use strict;
use warnings;

use App::Ch -command;

sub execute {
    my ($self, $opt, $args) = @_;

    print "Test.\n";
}

1;
