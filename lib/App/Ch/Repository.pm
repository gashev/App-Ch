package App::Ch::Repository;

use strict;
use warnings;
use utf8;

use YAML::Tiny;

# VERSION

sub new {
    my ( $class, $root ) = @_;
    my $self = {
        root => $root,
        data => YAML::Tiny->read("$root/.ch.yml"),
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

    $self->{data}->write("$self->{root}/.ch.yml");
}

sub delete {
    my ( $self, $name ) = @_;

    delete $self->{data}->[0]->{$name};

    $self->{data}->write("$self->{root}/.ch.yml");
}

sub list {
    my $self = shift;

    for my $key (sort keys %{$self->{data}->[0]}) {
        print sprintf(
            "%-10s\t%s\t%s\t%-50s\n",
            $key,
            $self->{data}->[0]->{$key}{'distribution'},
            $self->{data}->[0]->{$key}{'date'},
            $self->{data}->[0]->{$key}{'description'}
        );
    }
}

1;
