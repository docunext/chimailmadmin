#!/usr/bin/perl
package Conf;
use DBI;
use XML::Simple;
use Data::Dumper;
use Exporter;
@ISA = ('Exporter');
@EXPORT = ('setup');

sub setup {
    # This is sourced from Aortica!
    my $xs = XML::Simple->new();
    my $app_config = '../../config/config.xml';
    my $server_config = '../../../../config/config.xml';
    my $app_config_file;

    # Server Config
    open SERVERCONF, '<', $server_config || die("can't open datafile: $server_config!");
    my @server_config_lines = <SERVERCONF>;
    close(SERVERCONF);
    my $server_config_file = join( '', @server_config_lines );

    $server_config_file =~ s/<\/config>//;

    open APPCONF, '<', $app_config || die("can't open datafile: $app_config!");
    my @app_config_lines = <APPCONF>;
    close(APPCONF);
    my $app_config_file = join( '', @app_config_lines );

    $app_config_file =~ s/<\/config>//;
    $app_config_file =~ s/<config>//;
    $server_config_file .= $app_config_file."</config>";

    # FIXME - Paths are hard coded.
    $server_config_file =~ s/&project_root;/\/var\/www\/dev\/$app_name/g;
    $server_config_file =~ s/&app_name;/$app_name/g;
    $server_config_file =~ s/&server_name;/$server_name/g;
    $server_config_file =~ s/&includepath;/\/var\/www\/dev/g;
    my $xmlconf = $xs->XMLin($server_config_file);
    my $dbh = DBI->connect('DBI:mysql:savonext_dev:192.168.8.48:3306',
        $xmlconf->{datasource}->{savonix_read}->{username},
        $xmlconf->{datasource}->{savonix_read}->{password});

    return $dbh;
}

1;

=head1 NAME

Conf.pm

=head1 COPYRIGHT

Copyright Savonix Corporation.

=head1 LICENSE

Affero GPLv3

__END__
