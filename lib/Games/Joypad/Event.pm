package Games::Joypad::Event;
use strict;
use warnings;

# ABSTRACT: Joypad event

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

