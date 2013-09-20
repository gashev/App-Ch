# ABSTRACT: Chroot handler
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
