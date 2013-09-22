# ABSTRACT: permanently remove the chroot
package App::Ch::Command::delete;

use strict;
use warnings;
use utf8;

use base 'App::Ch::Command';

use App::Ch::Repository;

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

    my $result = 1;
    if ($self->worker()->run("rm -rf $root/$name")) {
        my $repository = App::Ch::Repository->new($root);
        $result = $repository->delete($name);
    }

    return $result;
}

1;

__END__

=pod

=encoding utf-8

=head1 SYNOPSIS

  ch --root=CH_REPOSITORY_ROOT delete TARGET

=head1 DESCRIPTION

This command permanently removes chroot from the repository. Only use this
after umount filesystems directly inside the chroot. For umount filesystems see
stop command.

=head1 COMMAND ARGUMENTS

Argument is the chroot that you want to delete.

=head1 AUTHOR

Oleg Gashev <oleg@gashev.net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Oleg Gashev.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

