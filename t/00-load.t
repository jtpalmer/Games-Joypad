use strict;
use warnings;
use Test::More;

BEGIN {
    my @modules = qw(
        Games::Joypad
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

