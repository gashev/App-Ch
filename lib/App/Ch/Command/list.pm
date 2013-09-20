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

__END__

=pod

=encoding utf-8

=head1 SYNOPSIS

  ch --root=CH_REPOSITORY_ROOT list

=head1 DESCRIPTION

This command lists the chroots that are registered on the repository.

=head1 COMMAND ARGUMENTS

None.

=head1 AUTHOR

Oleg Gashev <oleg@gashev.net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Oleg Gashev.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

