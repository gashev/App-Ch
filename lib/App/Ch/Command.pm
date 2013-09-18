package App::Ch::Command;

use strict;
use warnings;
use utf8;

use App::Cmd::Setup -command;

our $VERSION = '0.1'; # VERSION

sub command {
    my ($self, $command) = @_;

    exec($command) or print STDERR "couldn't exec $command: $!";
}

sub get_root {
    my $self = shift;

    my $global_opts = $self->app->global_options;

    $global_opts->{root} ||= $ENV{CH_REPOSITORY_ROOT}
        || die "Error: Must specify a repository root directory.\n";

    return $global_opts->{root};
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

App::Ch::Command - Base class for ch commands

=head1 VERSION

version 0.1

=head1 AUTHOR

Oleg Gashev <oleg@gashev.net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Oleg Gashev.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

