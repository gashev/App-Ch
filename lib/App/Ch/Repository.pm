package App::Ch::Repository;

use strict;
use warnings;
use utf8;

use YAML::Tiny;

# VERSION

sub new {
    my ( $class, $root ) = @_;

    my $configFile = "$root/.ch.yml";

    my $self = {
        root       => $root,
        configFile => $configFile,
        data       => YAML::Tiny->read($configFile),
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

    $self->{data}->write($self->{configFile});
}

sub delete {
    my ( $self, $name ) = @_;

    delete $self->{data}->[0]->{$name};

    $self->{data}->write($self->{configFile});
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
}

1;

