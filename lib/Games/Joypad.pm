package Games::Joypad;
use strict;
use warnings;
use Games::Joypad::Event;

use parent qw(Exporter);

# ABSTRACT: Abstract joypad

use constant {
    NEUTRAL => 0,
    UP      => 1,
    DOWN    => 2,
    LEFT    => 5,
    RIGHT   => 6,
};

our @EXPORT_OK = qw(
    NEUTRAL
    NORTH
    SOUTH
    WEST
    EAST
);

our %EXPORT_TAGS = ( all => [qw( NEUTRAL NORTH SOUTH WEST EAST )], );

sub new {
    my ( $class, %params ) = @_;

    $class = ref $class if ref $class;

    my $self = {
        handlers  => [],
        pressed   => {},
        stack     => [],
        direction => NEUTRAL,
    };

    return bless $self, $class;
}

sub add_event_handler {
    my ( $self, $handler ) = @_;

    push @{ $self->{handlers} }, $handler;
}

sub direction {
    my $self = shift;

    if (@_) {
        $self->{direction} = $_[0];

        my $event = Games::Joypad::Event->new(direction => $_[0]);
        $self->_publish_event($event);
    }

    return $self->{direction};
}

sub _publish_event {
    my ( $self, $event ) = @_;

    for my $handler ( @{ $self->{handlers} }) {
        $handler->($event);
    }
}

1;

=pod

=head1 SYNOPSIS

    use Games::Joypad;

=head1 DESCRIPTION

What does this module do?

=head1 METHODS

=head2 method

=head1 CAVEATS

=head1 BUGS

=head1 RESTRICTIONS

=head1 NOTES

=head1 SEE ALSO

=over 4

=item * L<perl>

=back

=cut

