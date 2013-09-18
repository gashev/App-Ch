# ABSTRACT: show the chroots
package App::Ch::Command::list;

use strict;
use warnings;

use base 'App::Ch::Command';

our $VERSION = '0.1';

sub execute {
    my ( $self, $opt, $args ) = @_;

    my $root = $self->get_root();

    $self->command("ls -1 $root");
}

1;
