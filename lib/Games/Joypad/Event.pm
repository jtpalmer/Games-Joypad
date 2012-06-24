package Games::Joypad::Event;

# ABSTRACT: Joypad event

use strict;
use warnings;

sub new {
    my $class = shift;

    $class = ref $class if ref $class;

    my $self = {@_};

    return bless $self, $class;
}

sub direction {
    return $_[0]->{direction};
}

1;

