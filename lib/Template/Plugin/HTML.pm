#============================================================= -*-Perl-*-
#
# Template::Plugin::HTML
#
# DESCRIPTION
#   Template Toolkit plugin providing useful functionality for generating
#   HTML.
#
# AUTHOR
#   Andy Wardley   <abw@wardley.org>
#
# COPYRIGHT
#   Copyright (C) 1996-2007 Andy Wardley.  All Rights Reserved.
#
#   This module is free software; you can redistribute it and/or
#   modify it under the same terms as Perl itself.
#
#============================================================================

package Template::Plugin::HTML;

use strict;
use warnings;
use base 'Template::Plugin';

our $VERSION = '3.100';

sub new {
    my ($class, $context, @args) = @_;
    my $hash = ref $args[-1] eq 'HASH' ? pop @args : { };
    bless {
        _SORTED    => $hash->{ sorted     } || 0,
        attributes => $hash->{ attributes } || $hash->{ attrs } || { },
    }, $class;
}

sub element {
    my ($self, $name, $attr) = @_;
    ($name, $attr) = %$name if ref $name eq 'HASH';
    return '' unless defined $name and length $name;
    $attr = $self->attributes($attr);
    $attr = " $attr" if $attr;
    return "<$name$attr>";
}

sub closed_element {
    my ($self, $name, $attr) = @_;
    ($name, $attr) = %$name if ref $name eq 'HASH';
    return '' unless defined $name and length $name;
    $attr = $self->attributes( $attr );
    $attr = " $attr" if $attr;
    return "<$name$attr />";
}

sub attributes {
    my ($self, $hash) = @_;
    $hash ||= $self->{ attributes };
    return '' unless ref $hash eq 'HASH';

    my @keys = keys %$hash;
    @keys = sort @keys if $self->{ _SORTED };

    join(' ', map { 
        "$_=\"" . $self->escape( $hash->{ $_ } ) . '"';
    } @keys);
}

sub add_attributes {
    my ($self, $attr) = @_;
    return unless ref $attr eq 'HASH';

    my $cur = $self->{ attributes };

    for (keys %{$attr}) {
        $cur->{$_} = exists $cur->{$_}
            ? $cur->{$_} . " $attr->{$_}"
            : $attr->{$_};

    }

    return;
}

*add_attribute = \&add_attributes;
*add           = \&add_attributes;


sub replace_attributes {
    my ($self, $attr) = @_;
    return unless ref $attr eq 'HASH';

    my $cur = $self->{ attributes };

    for (keys %{$attr}) {
        $cur->{$_} = $attr->{$_};
    }

    return;
}

*replace_attribute = \&replace_attributes;
*replace           = \&replace_attributes;

sub clear_attributes {
    my $self = shift;
    $self->{ attributes } = { };
    return;
}


sub escape {
    my ($self, $text) = @_;
    for ($text) {
        s/&/&amp;/g;
        s/</&lt;/g;
        s/>/&gt;/g;
        s/"/&quot;/g;
    }
    $text;
}

sub url {
    my ($self, $text) = @_;
    return undef unless defined $text;
    $text =~ s/([^a-zA-Z0-9_.-])/uc sprintf("%%%02x",ord($1))/eg;
    return $text;
}


1;

__END__

=head1 NAME

Template::Plugin::HTML - Plugin to create HTML elements

=head1 SYNOPSIS

    [% USE HTML %]
    
    [% HTML.escape("if (a < b && c > d) ..." %]
    
    [% HTML.element(table => { border => 1, cellpadding => 2 }) %]
    
    [% HTML.attributes(border => 1, cellpadding => 2) %]

=head1 DESCRIPTION

The C<HTML> plugin is a very basic plugin, implementing a few useful
methods for generating HTML.  

=head1 METHODS

=head2 escape(text)

Returns the source text with any HTML reserved characters such as 
C<E<lt>>, C<E<gt>>, etc., correctly escaped to their entity equivalents.

=head2 attributes(hash)

Returns the elements of the hash array passed by reference correctly
formatted (e.g. values quoted and correctly escaped) as attributes for
an HTML element.

=head2 add_attribute(attributes)

This provides a way to incrementally add attributes to the object.
The values passed in are stored in the object.  Calling
L<element> with just a tag or L<attributes> without an parameters
will used the saved attributes.

    USE tag = HTML;
    tag.add_attributes( { class => 'navbar' } );
    tag.add_attributes( { id => 'foo' } );
    tag.add_attributes( { class => 'active' } );

    tag.element( 'li' ); # <li class="navbar active" id="foo">

This method has two aliases: add_attribute() and add().

=head2 replace_attribute(attributes)

This will replace an attribute value instead of add to existing.


    USE tag = HTML;
    tag.add_attributes( { class => 'navbar' } );
    tag.add_attributes( { id => 'foo' } );
    tag.replace_attributes( { class => 'active' } );

    tag.element( 'li' ); # <li class="active" id="foo">

This method has two aliases: replace_attribute() and replace().

=head2 clear_attributes

Clears any saved attributes

=head2 element(type, attributes)

Generates an HTML element of the specified type and with the attributes
provided as an optional hash array reference as the second argument or
as named arguments.

    [% HTML.element(table => { border => 1, cellpadding => 2 }) %]
    [% HTML.element('table', border=1, cellpadding=2) %]
    [% HTML.element(table => attribs) %]

=head1 DEBUGGING

The HTML plugin accepts a C<sorted> option as a constructor argument
which, when set to any true value, causes the attributes generated by
the C<attributes()> method (either directly or via C<element()>) to be
returned in sorted order.  Order of attributes isn't important in
HTML, but this is provided mainly for the purposes of debugging where
it is useful to have attributes generated in a deterministic order
rather than whatever order the hash happened to feel like returning
the keys in.

    [% USE HTML(sorted=1) %]
    [% HTML.element( foo => { charlie => 1, bravo => 2, alpha => 3 } ) %]

generates:

    <foo alpha="3" bravo="2" charlie="1">

=head1 AUTHOR

Andy Wardley E<lt>abw@wardley.orgE<gt> L<http://wardley.org/>

=head1 COPYRIGHT

Copyright (C) 1996-2007 Andy Wardley.  All Rights Reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=head1 SEE ALSO

L<Template::Plugin>

=cut

# Local Variables:
# mode: perl
# perl-indent-level: 4
# indent-tabs-mode: nil
# End:
#
# vim: expandtab shiftwidth=4:
