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

    my $result = 1;

    eval { IPC::System::Simple::run($command); };
    if ($@) {
        $result = 0;
    }

    return $result;
}


1;
