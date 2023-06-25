use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Tags::HTML::Search;
use Tags::Output::Structure;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $tags = Tags::Output::Structure->new;
my $obj = Tags::HTML::Search->new(
	'tags' => $tags,
);
$obj->init;
$obj->process;
my $ret_ar = $tags->flush(1);
is_deeply(
	$ret_ar,
	[
		['b', 'div'],
		['a', 'class', 'container'],
		['b', 'div'],
		['a', 'class', 'inner'],
		['b', 'form'],
		['a', 'class', 'form'],
		['a', 'method', 'get'],
		['b', 'p'],
		['b', 'input'],
		['a', 'autofocus', 'autofocus'],
		['a', 'type', 'text'],
		['e', 'input'],
		['e', 'p'],
		['b', 'p'],
		['b', 'button'],
		['a', 'type', 'submit'],
		['d', 'Search'],
		['e', 'button'],
		['e', 'p'],
		['e', 'form'],
		['e', 'div'],
		['e', 'div'],
	],
	'Default search page.',
);

# Test.
$obj = Tags::HTML::Search->new;
eval {
	$obj->process;
};
is($EVAL_ERROR, "Parameter 'tags' isn't defined.\n",
	"Parameter 'tags' isn't defined.");
clean();

# Test.
$tags = Tags::Output::Structure->new;
$obj = Tags::HTML::Search->new(
	'tags' => $tags,
);
eval {
	$obj->process;
};
is($EVAL_ERROR, "You need to init instance.\n",
	'You need to init instance.');
