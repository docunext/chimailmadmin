#!/usr/bin/perl
use Conf;

my $dbh = setup();

my $sth = $dbh->prepare("SELECT domain, transport FROM xpa_domain");
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

1;

=head1 NAME

domain_list.pl

=head1 COPYRIGHT

Copyright Savonix Corporation.

=head1 LICENSE

Affero GPLv3

__END__
