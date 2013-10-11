# ABSTRACT: managing a chroot configurations.
package App::Ch::Repository;

use strict;
use warnings;
use utf8;

use YAML::Tiny;

# VERSION

sub new {
    my ( $class, $root ) = @_;

    my $configFile = "$root/.ch.yml";

    my $data = YAML::Tiny->read($configFile);
    if (!defined($data)) {
        $data = YAML::Tiny->new();
    }

    my $self = {
        root       => $root,
        configFile => $configFile,
        data       => $data
    };

    bless $self, $class;
}

sub add {
    my ( $self, $name, $distribution, $date, $description ) = @_;

    $self->{data}->[0]->{$name} = {
        distribution => $distribution,
        date         => $date,
        description  => $description,
    };

    return $self->{data}->write($self->{configFile});
}

sub delete {
    my ( $self, $name ) = @_;

    delete $self->{data}->[0]->{$name};

    return $self->{data}->write($self->{configFile});
}

sub list {
    my $self = shift;

    for my $key (sort keys %{$self->{data}->[0]}) {
        print sprintf(
            "%-10s\t%-10s\t%s\t%-50s\n",
            $key,
            $self->{data}->[0]->{$key}{'distribution'},
            $self->{data}->[0]->{$key}{'date'},
            $self->{data}->[0]->{$key}{'description'}
        );
    }

    return 1;
}

1;

__END__

=pod

=encoding utf-8

=head1 NAME

App::Ch::Repository - managing a chroot configurations.

=head1 DESCRIPTION

All information about available chroots stored to $CH_REPOSITORY_ROOT/.ch.yml
file. This package use to add, delete chroot configuration to repository and
display available chroots.

=head1 METHODS

=over 4

=item add

Add chroot to config file. New chroot will be stored to config file.

=item delete

Delete chroot from config file.

=item list

Display information about available chroots.

=back

=head1 AUTHOR

Oleg Gashev <oleg@gashev.net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Oleg Gashev.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

