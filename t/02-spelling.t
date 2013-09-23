#!perl

BEGIN {
    unless ($ENV{AUTHOR_TESTING}) {
        require Test::More;
        Test::More::plan(skip_all => "Spelling tests only for authors");
    }
}

use Test::Spelling;
set_spell_cmd('aspell list -l en');
add_stopwords(<DATA>);
all_pod_files_spelling_ok('lib');

__DATA__
Gashev
Oleg
Unmount
chroots
debootstrap
sid
unmount
