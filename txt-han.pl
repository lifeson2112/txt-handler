#!/usr/bin/perl

# Handler for taking txt files and serving them with auto-marked hyperlinks

print "Content-type: text/html\n\n";

my $filename = $ENV{'PATH_TRANSLATED'};

my $fh;
open $fh, '<', $filename;

my @lines = <$fh>;
@lines = map {$w = $_; $w =~ s/(https?[^\s]*)/<a href="$1">$1<\/a>/g; $w} @lines;

print join("<br>",@lines);
