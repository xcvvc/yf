#  slickcharts.com/nasdaq100
#  slickcharts.com/sp500
#  dogsofthedow.com/dow-30-stocks-list-today.html
#  https://bullishbears.com/russell-2000-stocks-list/
#  October 15, 2021


open RUSSELL, ("<../russell.txt") or die;
$line = <RUSSELL>;
chomp $line;
until ($line =~/Aaron.+/) {
    push (@group_one, $line) ;
    $line = <RUSSELL>; 
    chomp $line;   
}
foreach $sym (@group_one) {
    $company{$sym} = $line;
    $line = <RUSSELL>;
    chomp $line;
}
print $line;
if ($line =~/Russell 2000 Stocks List \(D-K\).*/) { print "good\n"; }

$line = <RUSSELL>;
chomp $line;
until ($line =~/Daktronics.+/) {
    push (@group_two, $line) ;
    $line = <RUSSELL>; 
    chomp $line;   
}
foreach $sym (@group_two) {
    $company{$sym} = $line;
    $line = <RUSSELL>;
    chomp $line;
}
print $line;
if ($line =~/Russell 2000 Stocks List \(L-R\).*/) { print "good\n"; }



$line = <RUSSELL>;
chomp;
until ($line =~/Lithia.+/) {
    push (@group_three, $line) ;
    $line = <RUSSELL>; 
    chomp $line;   
}
foreach $sym (@group_three) {
    $company{$sym} = $line;
    $line = <RUSSELL>;
    chomp $line;
}
print $line;
if ($line =~/Russell 2000 Stocks List \(S-Z\).*/) { print "good\n"; }


$line = <RUSSELL>;
chomp $line;
until ($line =~/Safehold.+/) {
    push (@group_four, $line) ;
    $line = <RUSSELL>; 
    chomp $line;   
}
foreach $sym (@group_four) {
    $company{$sym} = $line;
    $line = <RUSSELL>;
    chomp $line;
}

@test = keys %company;
foreach $sym (@test) {
    print "$sym\t$company{$sym}\n";
}
close RUSSELL;



open DOW,("<../dj.txt") or die;

while (<DOW>) {
    /(\d+)\t(\D+)\t(\D+)\t/;
    print "$1 $2 $3\n";

    $company{$3} = $2;
}
close DOW;




open NASDAQ, ("<../nq-100.txt") or die;

while (<NASDAQ>) {
    /(\d+)\t(\D+)\t(\D+)\t/;
    print "$1 $2 $3\n";

    $company{$3} = $2;

}
close NASDAQ;


open SP500, ("<../sp-500.txt") or die;

while (<SP500>) {
    /(\d+)\t(\D+)\t(\D+)\t/;
    print "$1 $2 $3\n";

    $company{$3} = $2;

}
close SP500;


open SP400, ("<../sp-400.txt") or die;

while ( <SP400>) {
    chomp;
    chop;
    if ( /(^\D+)/ ) {
        $c = $1;
        if ( $c !~ /[-\+]/ ) {
            if ( $c =~ /^\s(\D+)/ ) {
                $sym = $1;
            } else { 
                print "$c $sym\n";

                $company{$sym} = $c;


}   }   }   }
close SP400;


open SP600, ("<../sp-600.txt") or die;
while ( <SP600> ) {
    if ( /(^\w+)\t([ \w]+)\t/ ) {
        $sym = $1;
        $c = $2;
        print "$c $sym\n";
        
        $company{$sym} = $c;

    }
}

$how_many = keys %company;
print "this many:  $how_many\n";

open OUTLIST, (">../symbol_list.txt");

@symbols = keys %company;
foreach $each_one (@symbols) {
    print OUTLIST "$each_one\n";
    print "$each_one\r";
}
close OUTLIST;
print "\n";

