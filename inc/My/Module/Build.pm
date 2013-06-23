package My::Module::Build;

use 5.006001;

use strict;
use warnings;

use Carp;

use base qw{ Module::Build };

our $VERSION = '0.001';

sub ACTION_authortest {
    my ( $self, @args ) = @_;

    $self->depends_on( 'build' );
    $self->test_files( qw{ t xt/author } );
    $self->SUPER::ACTION_test( @args );

    return;

}

sub ACTION_genclean {
    my ( $self ) = @_;

    $self->depends_on( 'realclean' );

    foreach my $fn ( qw{ META.json META.yml } ) {
        -f $fn
            and unlink $fn;
    }

    return;
}


1;

__END__

=head1 NAME

My::Module::Build - Customize L<Module::Build|Module::Build>.

=head1 SYNOPSIS

    use lib qw{ inc };
    use My::Module::Build;
    my $mb = My::Module::Build->new(
	module_name	=> 'Foo::Bar',
	dist_author	=> 'Yehudi Menuhin',
	dist_abstract	=> 'Foo some bars',
	license		=> 'perl',
    );
    $mb->create_build_script();

=head1 DESCRIPTION

This subclass of L<Module::Build|Module::Build> adds build targets as
convenient.

=head1 ACTIONS

=over

=item authortest

This action performs both the normal tests in F<t/> and the author tests
in F<xt/author/>.

=item genclean

This action is just like the C<realclean> action, but also removes files
generated by the packaging process. These are F<META.json> and F<META.yml>.

=back

=head1 SEE ALSO

L<Module::Build|Module::Build>.

=head1 SUPPORT

Support is by the author. Please file bug reports at
L<http://rt.cpan.org>, or in electronic mail to the author.

=head1 AUTHOR

Thomas R. Wyant, III F<wyant at cpan dot org>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Thomas R. Wyant, III

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl 5.10.0. For more details, see the full text
of the licenses in the directory LICENSES.

This program is distributed in the hope that it will be useful, but
without any warranty; without even the implied warranty of
merchantability or fitness for a particular purpose.

=cut

##############################################################################
# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 78
#   indent-tabs-mode: nil
#   c-indentation-style: bsd
# End:
# ex: set ts=8 sts=4 sw=4 tw=78 ft=perl expandtab shiftround :
