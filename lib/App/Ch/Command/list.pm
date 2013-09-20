# ABSTRACT: show the chroots
package App::Ch::Command::list;

use strict;
use warnings;

use base 'App::Ch::Command';

use App::Ch::Repository;

# VERSION

sub execute {
    my ( $self, $opt, $args ) = @_;

    my $root = $self->get_root();

    my $repository = App::Ch::Repository->new($root);
    $repository->list();
}

1;
