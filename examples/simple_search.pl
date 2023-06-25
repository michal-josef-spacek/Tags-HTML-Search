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

# Initialize.
$obj->init;

# Process search.
$obj->process_css;
$obj->process;

# Print out.
print "CSS\n";
print $css->flush."\n\n";
print "HTML\n";
print $tags->flush."\n";

# Output:
# CSS
# .container {
#         display: flex;
#         align-items: center;
#         justify-content: center;
#         height: 100vh;
# }
# .form input {
#         border-radius: 5px;
# }
#
# HTML
# <div class="container">
#   <div class="inner">
#     <form class="form" method="get">
#       <p>
#         <input autofocus="autofocus" type="text">
#         </input>
#       </p>
#       <p>
#         <button type="submit">
#           Search
#         </button>
#       </p>
#     </form>
#   </div>
# </div>