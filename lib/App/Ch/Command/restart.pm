# ABSTRACT: remount the chroot
package App::Ch::Command::restart;

use strict;
use warnings;
use utf8;

use base 'App::Ch::Command';

use App::Ch::Mount;

# VERSION

sub validate_args {
    my ( $self, $opt, $args ) = @_;

    $self->check_chroot_name_argument($args);

    return 1;
}

sub execute {
    my ( $self, $opt, $args ) = @_;

    my $root = $self->get_root();
    my $name = ${$args}[0];
    my $mount = App::Ch::Mount->new();

    return $mount->remountChroot($root, $name);
}

1;

__END__

=pod

=encoding utf-8

=head1 SYNOPSIS

  ch --root=CH_REPOSITORY_ROOT restart TARGET

=head1 DESCRIPTION

Remount chroot filesystems: /dev/pts, /proc, /sys.

=head1 COMMAND ARGUMENTS

Argument is the chroot name.

=head1 AUTHOR

Oleg Gashev <oleg@gashev.net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Oleg Gashev.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

