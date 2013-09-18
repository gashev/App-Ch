package App::Ch;

# ABSTRACT: Chroot handler

use strict;
use warnings;

use App::Cmd::Setup -app;

our $VERSION = '0.1';

sub global_opt_spec {
    ['root|r=s' => 'Path to your repository root directory'];
}


1;
