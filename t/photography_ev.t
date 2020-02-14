use Test2::V0 -no_srand => 1;
use Photography::EV;

subtest ev => sub {
  is ev(1,1),       0,   "EV  0 = f/1.0 1s";
  is ev(1.4,1),     1,   "EV  1 = f/1.4 1s";
  is ev(5.6,8*60),  -4,  "EV -4 = f/5.6 8m";
  is ev(45,1/1000), 21,  "EV 21 = f/45  1/1000s";
};

subtest aperture => sub {
  is aperture(9,1/60, []), undef, 'empty list of apertures always returns undef';
  is aperture(9,1/60), 2.8, 'EV 9  1/60  ... f/2.8';
};

subtest time => sub {
  is shutter_speed(9,11, []), undef, 'empty list of shutter speeds always returns undef';
  is shutter_speed(9,11), .25,       'EV 9  f/11  ... 1/4s';
  is shutter_speed(14,1.4), 1/8000,  'EV 14 f/1.4 ... 1/8000s';
};

done_testing;
