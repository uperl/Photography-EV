package Photography::EV;

use strict;
use warnings;
use 5.020000;
use feature 'signatures';
no warnings 'experimental::signatures';
use base qw( Exporter );

our @EXPORT_OK = qw( ev );
our @EXPORT = @EXPORT_OK;

# ABSTRACT: Calculate exposure value (EV)
# VERSION

=head1 SYNOPSIS

 use Photography::EV;
 my $ev = ev(5.6, 1/1000); # EV for f/5.6 at 1/1000s

=head1 DESCRIPTION

This module provides functions for calculating photographic
exposure values.  On some cameras the exposure can be locked
into a specific Exposure Value (EV), such that changing the
aperture or shutter speed will adjust the shutter speed or
aperture to maintain the same exposure.

=cut

sub _round ($)
{
  return $_[0] ? int($_[0] + $_[0]/abs($_[0]*2)) : 0;
}

sub _log2 ($)
{
  return log($_[0])/log(2);
}

=head1 FUNCTIONS

=head2 ev

 my $ev = ev($aperture, $time);

Takes the aperture (f-stop) and shutter speed (in seconds).
Returns the integer Exposure Value (EV).

=cut

sub ev ($aperture, $time)
{
  return _round _log2 $aperture*$aperture/$time;
}

1;

=head1 CAVEATS

This module requires Perl 5.20 or better.

=head1 SEE ALSO

=over 4

=item http://en.wikipedia.org/wiki/Exposure_value

=back

=cut
