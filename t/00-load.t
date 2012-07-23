use strict;
use warnings;
use Test::More;

BEGIN {
    my @modules = qw(
        Games::Joypad
        Games::Joypad::Event
        Games::Joypad::Input::Keyboard
        Games::Joypad::Input::SDL
    );

    for my $module (@modules) {
        use_ok($module) or BAIL_OUT("Failed to load $module");
    }
}

diag(
    sprintf(
        'Testing Games::Joypad %f, Perl %f, %s',
        $Games::Joypad::VERSION, $], $^X
    )
);

done_testing();

