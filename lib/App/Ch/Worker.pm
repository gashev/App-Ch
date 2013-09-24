package App::Ch::Worker;

use strict;
use warnings;
use utf8;

use IPC::System::Simple;

# VERSION

sub new {
    my $class = shift;
    my $self = {};
    bless $self, $class;
}

sub run {
    my ( $self, $command ) = @_;

    eval { IPC::System::Simple::run($command); };

    return ($@ ? 0 : 1);
}


1;
