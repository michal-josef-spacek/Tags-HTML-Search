use strict;
use warnings;

use Tags::HTML::Search;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Tags::HTML::Search::VERSION, 0.01, 'Version.');
