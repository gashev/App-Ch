# ABSTRACT: execute a command via the shell.
package App::Ch::Worker;

use strict;
use warnings;
use utf8;

# VERSION

sub new {
    my $class = shift;
    my $self = {};
    bless $self, $class;
}

sub run {
    my ( $self, $command ) = @_;

    return (system($command) == 0);
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

App::Ch::Worker - execute a command via the shell.

=head1 SYNOPSIS

    use App::Ch::Worker;
    my $worker = App::Ch::Worker->new();
    return $worker->run('ls -al');

=head1 METHODS

=over 4

=item run

Execute a command via the shell. Return 1 on success, 0 otherwise.

=back

=head1 AUTHOR

Oleg Gashev <oleg@gashev.net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Oleg Gashev.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

