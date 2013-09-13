package App::Ch::Command;

use strict;
use warnings;

use App::Cmd::Setup -command;

sub command {
    my ($self, $command) = @_;

    exec($command) or print STDERR "couldn't exec $command: $!";
}

1;

