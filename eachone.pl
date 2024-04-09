use LWP::Simple;
use File::stat;

open SYM, "<update-symbol-list.txt" or die "no open symbol_list\n";
while (<SYM>) {
    chomp;
    push @sym_array, $_;
}
$countdown = 80;
foreach $company (@sym_array) {
# @symbols = ( "AAL" );
# foreach $company ( @symbols ) {

#    foreach $category ( "profile", "analysis", "summary", "holders", "statistics", "balance", "financials", "cash-flow" ) {      
    foreach $category ( "summary" ) {
            $file = "text-files\\mar-2024\\eachone\\\L$company\E-$category.html";
    	    $info = stat($file);
    	    if (!$info) {
		$detail = "$company\/$category";		
    	        if ( $category eq "balance" ) { $detail = "$company\/balance-sheet"; }
    	        if ( $category eq "statistics" ) { $detail = "$company\/key-statistics"; }
    	        if ( $category eq "summary" ) { $detail = "$company"; }
    	        
    		my $url = "https:\/\/finance.yahoo.com\/quote\/$detail";
    		my $line = get($url);

    		if($line) {
		    	open( COMPANY, ">", $file);
		    	binmode COMPANY, ":encoding(UTF-8)";
	    		print COMPANY $line;
    	   	 	close COMPANY;
    	    		print "$company \t$category\n";
    	    		$countdown--;
      		} else { print "$company\n"; }
	    }
    }
    if ( !$countdown ) { print "countdown limit\n"; last; }
}