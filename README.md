# Photography::EV ![linux](https://github.com/uperl/Photography-EV/workflows/linux/badge.svg) ![macos](https://github.com/uperl/Photography-EV/workflows/macos/badge.svg) ![windows](https://github.com/uperl/Photography-EV/workflows/windows/badge.svg) ![msys2-mingw](https://github.com/uperl/Photography-EV/workflows/msys2-mingw/badge.svg)

Calculate exposure value (EV)

# SYNOPSIS

```perl
use Photography::EV;
my $ev = ev(5.6, 1/1000); # EV for f/5.6 at 1/1000s
```

# DESCRIPTION

This module provides functions for calculating photographic
exposure values.  Some light meters can give readings in
"Exposure Value" or EV.  On some cameras the exposure can
be locked into a specific Exposure Value (EV), such that
changing the aperture or shutter speed will adjust the
shutter speed or aperture to maintain the same exposure.

# FUNCTIONS

## ev

```perl
my $ev = ev($aperture, $time);
```

Takes the aperture (f-stop) and shutter speed (in seconds).
Returns the integer Exposure Value (EV).

## aperture

```perl
my $aperture = aperture($ev, $time);
my $aperture = aperture($ev, $time, \@apertures);
```

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

```perl
my $aperture = aperture(9, 1/60, [1.2,1.4,2,4,5.6,8,11,16]);
```

## shutter\_speed

```perl
my $time = shutter_speed($ev, $aperture);
my $time = shutter_speed($ev, $aperture, \@times);
```

Returns the correct shutter speed (in seconds) corresponding to
the given EV and aperture.  By default returns the closest
full stop between 1920s (32 minutes) and 1/8000s.

If the optional third argument is given (a reference to a list
of possible shutter speeds), then the returned shutter speed
will be the closest possible from that list.  This is helpful
for older cameras that have a different set of shutter speed
stops, or newer cameras that use half stop shutter speeds.
At least some Rolleiflex TLRs have shutter speeds of 1, 2, 5, 10,
25, 50, 100, 250, 500 instead of the modern values.  To get
the correct shutter speed for f/3.5 and EV 5:

```perl
# map displayed shutter speed to 1/t to get time in seconds
my $time = shutter_speed(6, 3.5, [map { 1/$_ } 1, 2, 5, 10, 25, 50, 100, 250, 500]);
```

# CAVEATS

This module requires Perl 5.20 or better.

# SEE ALSO

- [http://en.wikipedia.org/wiki/Exposure\_value](http://en.wikipedia.org/wiki/Exposure_value)
- [Photography::DX](https://metacpan.org/pod/Photography::DX)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015-2024 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
