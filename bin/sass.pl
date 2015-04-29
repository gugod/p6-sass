#!/usr/bin/env perl6

use lib 'lib';

use Scss;

Scss.new.convert( slurp @*ARGS[0] );

