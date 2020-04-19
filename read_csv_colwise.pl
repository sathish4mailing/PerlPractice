Read the CSV file and print the specified column value based on user input.

#!perl

use Text::CSV  qw( csv );
use List::MoreUtils qw(first_index);

print "Enter the specific header name_of_column..";

my $name_of_column = <STDIN>;
chomp $name_of_column;
$name_of_column = lc $name_of_column;

my $csv = Text::CSV->new ({ binary => 1, auto_diag => 1 });
open my $fh, "<:encoding(utf8)", "test.csv" or die "test.csv: $!"; 
$header_details = $csv->getline ($fh);
$index = first_index { lc($_) eq $name_of_column } @{$header_details};

if ( $index < 0) {
	print "the provided user input not matched with header in the csv file\n";
	exit;
}

map { print "$_->[$index]\n"; } @{$csv->getline_all ($fh)};
close $fh;

exit;
