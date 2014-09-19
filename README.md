# Photography::EV

Calculate exposure value (EV)

# SYNOPSIS

    use Photography::EV;
    my $ev = ev(5.6, 1/1000); # EV for f/5.6 at 1/1000s

# DESCRIPTION

This module provides functions for calculating photographic
exposure values.  Some light meters can give readings in 
"Exposure Value" or EV.  On some cameras the exposure can 
be locked into a specific Exposure Value (EV), such that 
changing the aperture or shutter speed will adjust the 
shutter speed or aperture to maintain the same exposure.

# FUNCTIONS

## ev

    my $ev = ev($aperture, $time);

Takes the aperture (f-stop) and shutter speed (in seconds).
Returns the integer Exposure Value (EV).

## aperture

    my $aperture = aperture($ev, $time);
    my $aperture = aperture($ev, $time, \@apertures);

Returns the correct aperture corresponding to the given EV and
shutter speed (in seconds).  By default returns the closest 
full stop aperture between 1 and 64.

If the optional third argument is given (a reference to a list of
possible aperture values), then the returned aperture will be
the closest possible from that list.  This is helpful, for example,
when you are using a lens that provides fractions of a stop.  My
Nikkor 50mm f/1.2 for example has stops at f/1.2, f/1.4, f/2, f/4
f/5.6, f/8, f/11 and f/16, so to get the correct aperture for 
1/60 at EV 9 for that lens:

    my $aperture = aperture(9, 1/60, [1.2,1.4,2,4,5.6,8,11,16]);

# CAVEATS

This module requires Perl 5.20 or better.

This modules doesn't use any non-core modules, but it does use [POSIX](https://metacpan.org/pod/POSIX), which
may not be available everywhere.

# SEE ALSO

- http://en.wikipedia.org/wiki/Exposure\_value

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
