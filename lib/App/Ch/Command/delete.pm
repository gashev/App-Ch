# ABSTRACT: permanently remove a chroot
package App::Ch::Command::delete;

use strict;
use warnings;

use App::Ch -command;

sub opt_spec {
    return (
        [
            'name=s',
            'name'
        ]
    );
}

sub execute {
    my ($self, $opt, $args) = @_;

    my $name = $opt->name;

    exec("rm -rf /opt/chroot/$name");
}

1;
