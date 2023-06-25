use strict;
use warnings;

use CSS::Struct::Output::Structure;
use English;
use Error::Pure::Utils qw(clean);
use Tags::HTML::Search;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $css = CSS::Struct::Output::Structure->new;
my $obj = Tags::HTML::Search->new(
	'css' => $css,
);
$obj->init;
$obj->process_css;
my $ret_ar = $css->flush(1);
is_deeply(
	$ret_ar,
	[
		['s', '.container'],
		['d', 'display', 'flex'],
		['d', 'align-items', 'center'],
		['d', 'justify-content', 'center'],
		['d', 'height', '100vh'],
		['e'],

		['s', '.form input'],
		['d', 'border-radius', '5px'],
		['e'],
	],
	'Default search page CSS.',
);

# Test.
$css = CSS::Struct::Output::Structure->new;
$obj = Tags::HTML::Search->new;
eval {
	$obj->process_css;
};
is($EVAL_ERROR, "Parameter 'css' isn't defined.\n",
	"Parameter 'css' isn't defined.");
clean();

# Test.
$css = CSS::Struct::Output::Structure->new;
$obj = Tags::HTML::Search->new(
	'css' => $css,
);
eval {
	$obj->process_css;
};
is($EVAL_ERROR, "You need to init instance.\n",
	'You need to init instance.');
