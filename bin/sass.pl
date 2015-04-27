#!/usr/bin/env perl6

use lib 'lib';

use ScssGrammar;
say ScssGrammar.parsefile(@*ARGS[0]).gist
