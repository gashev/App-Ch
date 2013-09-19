#!perl

use Test::More tests => 10;

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
}

diag("Testing App::Ch $App::Ch::VERSION");
