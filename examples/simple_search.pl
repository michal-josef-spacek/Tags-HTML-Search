#!/usr/bin/env perl

use strict;
use warnings;

use CSS::Struct::Output::Indent;
use Tags::HTML::Search;
use Tags::Output::Indent;

# Object.
my $css = CSS::Struct::Output::Indent->new;
my $tags = Tags::Output::Indent->new;
my $obj = Tags::HTML::Search->new(
        'css' => $css,
        'tags' => $tags,
);

# Process search.
$obj->process_css;
$obj->process;

# Print out.
print "CSS\n";
print $css->flush."\n";
print "HTML\n";
print $tags->flush."\n";

# Output:
# TODO