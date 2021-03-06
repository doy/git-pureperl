package Git::PurePerl::DirectoryEntry;
use Moose;
use MooseX::StrictConstructor;
use Moose::Util::TypeConstraints;

has 'mode'     => ( is => 'ro', isa => 'Str',           required => 1 );
has 'filename' => ( is => 'ro', isa => 'Str',           required => 1 );
has 'sha1'     => ( is => 'ro', isa => 'Str',           required => 1 );
has 'git'      => ( is => 'ro', isa => 'Git::PurePerl', required => 1 );

__PACKAGE__->meta->make_immutable;

sub object {
    my $self = shift;
    return $self->git->get_object( $self->sha1 );
}

1;
