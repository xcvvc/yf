use LWP::Simple;

@symbols = ( "IBM\n" );
$page = "profile";

open SYM, "<symbol-list.txt" or die "no open symbol_list\n";
while (<SYM>) {
    push @sym_array, $_;
}
print "\n";
$count = 1;
foreach $company (@sym_array) {
#@foreach $company ( @symbols ) {
    chomp $company;
    
    open(L19, ">", "text-files\/mar-2022\/line19-\L$company\E-$page.txt");
    my $url = "https:\/\/finance.yahoo.com\/quote\/$company\/$page?p=$company";

    my $line = get($url);

    my @filelines = split( '\n',$line);

    print L19 "$filelines[19]";
    print "$company\t $count\n";
    $count++;
}

