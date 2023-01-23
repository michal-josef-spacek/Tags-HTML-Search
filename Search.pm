package Tags::HTML::Search;

use base qw(Tags::HTML);
use strict;
use warnings;

use Class::Utils qw(set_params split_params);
use Data::HTML::Button;
use Data::HTML::Form;
use Data::HTML::Form::Input;
use Tags::HTML::Form;
use Tags::HTML::Container;

our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my ($object_params_ar, $other_params_ar) = split_params(
		['action', 'search_type'], @params);
	my $self = $class->SUPER::new(@{$other_params_ar});

	# Form action.
	$self->{'action'} = undef;

	# Search type.
	$self->{'search_type'} = 'text';

	# Process params.
	set_params($self, @{$object_params_ar});

	# Object.
	return $self;
}

sub _cleanup {
	my $self = shift;

	delete $self->{'_tags_html_form'};

	return;
}

sub _init {
	my $self = shift;

	$self->{'_tags_html_container'} = Tags::HTML::Container->new(
		'css' => $self->{'css'},
		'tags' => $self->{'tags'},
	);
	$self->{'_tags_html_form'} = Tags::HTML::Form->new(
		'css' => $self->{'css'},
		'form' => Data::HTML::Form->new(
			'action' => $self->{'action'},
			'css_class' => 'form',
		),
		'submit' => Data::HTML::Button->new(
			'data' => [
				['d', 'Search'],
			],
			'data_type' => 'tags',
			'type' => 'submit',
		),
		'tags' => $self->{'tags'},
	);

	return;
}

sub _process {
	my $self = shift;

	$self->{'_tags_html_container'}->process(sub {
		my $search = Data::HTML::Form::Input->new(
			'type' => $self->{'search_type'},
		);
		$self->{'_tags_html_form'}->process($search);
	});

	return;
}

sub _process_css {
	my $self = shift;

	$self->{'_tags_html_container'}->process_css;
	$self->{'_tags_html_form'}->process_css;

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Tags::HTML::Search - Tags helper for gradient evaluation.

=head1 SYNOPSIS

 use Tags::HTML::Search;

 my $obj = Tags::HTML::Search->new(%params);
 $obj->cleanup;
 $obj->init;
 $obj->process;
 $obj->process_css;

=head1 METHODS

=head2 C<new>

 my $obj = Tags::HTML::Search->new(%params);

Constructor.

=over 8

=item * C<css>

'CSS::Struct::Output' object for L<process_css> processing.

It's required.

Default value is undef.

=item * C<search_type>

Search type.

Possible values are: button checkbox color date datetime-local email file hidden image month number password radio range reset search submit tel text time url week.

Default value is 'text'.

=item * C<tags>

'Tags::Output' object.

Default value is undef.

=back

=head2 C<process>

 $obj->process;

Process Tags structure for .

Returns undef.

=head2 C<process_css>

 $obj->process_css;

Process CSS::Struct structure for output.

Returns undef.

=head1 ERRORS

 new():
         From Class::Utils::set_params():
                 Unknown parameter '%s'.
         Parameter 'css' must be a 'CSS::Struct::Output::*' class.
         Parameter 'tags' must be a 'Tags::Output::*' class.

=head1 EXAMPLE

=for comment filename=simple_search.pl

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

=head1 DEPENDENCIES

L<Class::Utils>,
L<Data::HTML::Button>,
L<Data::HTML::Form::Input>,
L<Tags::HTML>,
L<Tags::HTML::Form>.

=head1 SEE ALSO

=over

=item L<Tags::HTML::Stars>

Tags helper for stars evaluation.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Tags-HTML-Search>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2022-2023 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
