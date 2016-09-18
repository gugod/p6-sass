#!/usr/bin/env perl6

use lib 'lib';

use Scss;

my $s = Scss.new.convert( slurp @*ARGS[0] );
say $s.gist;

