#!perl

use Test::More tests => 12;

BEGIN {
    use_ok('App::Ch');
    use_ok('App::Ch::Command');
    use_ok('App::Ch::Command::delete');
    use_ok('App::Ch::Command::init');
    use_ok('App::Ch::Command::list');
    use_ok('App::Ch::Command::login');
    use_ok('App::Ch::Command::restart');
    use_ok('App::Ch::Command::setup');
    use_ok('App::Ch::Command::start');
    use_ok('App::Ch::Command::stop');
    use_ok('App::Ch::Mount');
    use_ok('App::Ch::Worker');
}

diag("Testing App::Ch $App::Ch::VERSION");
