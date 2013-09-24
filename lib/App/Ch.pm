# ABSTRACT: application class.
package App::Ch;

use strict;
use warnings;
use utf8;

use App::Cmd::Setup -app;

# VERSION

sub global_opt_spec {
    [ 'root|r=s' => 'Path to your repository root directory' ];
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

App::Ch - application class

=head1 DESCRIPTION

All the work of argument parsing, validation, and dispatch is taken care of by
this application class. When a new application instance is created, it loads
all of the command classes it can find, looking for modules under the Command
namespace under its own name.

=head1 AUTHOR

Oleg Gashev <oleg@gashev.net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Oleg Gashev.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

