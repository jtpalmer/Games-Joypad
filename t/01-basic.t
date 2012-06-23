use strict;
use warnings;
use Test::More;
use Games::Joypad;

my $joypad = Games::Joypad->new();

my $direction;

$joypad->add_event_handler(
    sub {
        my ($event) = @_;

        isa_ok($event, 'Games::Joypad::Event');

        $direction = $event->direction();
    }
);

$direction = undef;
$joypad->direction( Games::Joypad::UP );
is( $direction, Games::Joypad::UP );

$direction = undef;
$joypad->direction( Games::Joypad::DOWN );
is( $direction, Games::Joypad::DOWN );

$direction = undef;
$joypad->direction( Games::Joypad::LEFT );
is( $direction, Games::Joypad::LEFT );

$direction = undef;
$joypad->direction( Games::Joypad::RIGHT );
is( $direction, Games::Joypad::RIGHT );

done_testing();

