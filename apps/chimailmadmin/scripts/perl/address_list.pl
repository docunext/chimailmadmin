#!/usr/bin/perl
use Conf;

my $dbh = setup();

my $sth = $dbh->prepare("SELECT * FROM xpa_mailbox");
my $ID;

$sth->execute;
$sth->fetch;
while (my @data = $sth->fetchrow_array()) {
    my $domain = $data[0];
    my $transport = $data[1];
    if ($transport eq '') {
        $transport = 'maildrop:';
    }
    print "$domain $transport\n";
}

=head1 NAME

address_list.pl

=head1 COPYRIGHT

Copyright Savonix Corporation.

=head1 LICENSE

Affero GPLv3

__END__
