# Photography::EV

Calculate exposure value (EV)

# SYNOPSIS

    use Photography::EV;
    my $ev = ev(5.6, 1/1000); # EV for f/5.6 at 1/1000s

# DESCRIPTION

This module provides functions for calculating photographic
exposure values.  On some cameras the exposure can be locked
into a specific Exposure Value (EV), such that changing the
aperture or shutter speed will adjust the shutter speed or
aperture to maintain the same exposure.

# FUNCTIONS

## ev

    my $ev = ev($aperture, $time);

Takes the aperture (f-stop) and shutter speed (in seconds).
Returns the integer Exposure Value (EV).

# SEE ALSO

- http://en.wikipedia.org/wiki/Exposure\_value

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
