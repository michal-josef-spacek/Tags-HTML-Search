use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Tags helper for search page.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.03;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'Tags-HTML-Search';
perl_version 5.008;
readme_from 'Search.pm';
recursive_author_tests('xt');
requires 'Class::Utils' => 0;
requires 'Data::HTML::Button' => 0;
requires 'Data::HTML::Form' => 0;
requires 'Data::HTML::Form::Input' => 0;
requires 'Error::Pure' => 0;
requires 'Tags::HTML' => 0;
requires 'Tags::HTML::Container' => 0;
requires 'Tags::HTML::Form' => 0;
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/Tags-HTML-Search/issues';
resources 'homepage' => 'https://github.com/michal-josef-spacek/Tags-HTML-Search';
resources 'repository' => 'git://github.com/michal-josef-spacek/Tags-HTML-Search';
test_requires 'CSS::Struct::Output::Raw' => 0;
test_requires 'English' => 0;
test_requires 'Error::Pure::Utils' => 0;
test_requires 'Tags::Output::Raw' => 0;
test_requires 'Tags::Output::Structure' => 0;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
