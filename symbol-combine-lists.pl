
#  dogsofthedow.com/dow-30-stocks-list-today.html
#  https://www.slickcharts.com/nasdaq100
#  https://www.slickcharts.com/sp500
#  https://stockmarketmba.com/stocksinthespmidcap400.php
#  https://stockmarketmba.com/stocksinthespsmallcap600.php
#  https://www.slickcharts.com/dowjones
#  https://bullishbears.com/russell-2000-stocks-list/
#  March 12, 2021


# for SP, just use wikipedia. tab delimited

open RUSSELL, ("<data/russell.txt") or die;
while( $line = <RUSSELL> )
{
chomp $line;
@_ = split ("\t", $line);
$company{$_[0]} = $_[1];
 
#print $company{$_[0]}, "\t", $_[0], "\n";
}

close RUSSELL;

# AAON 	AAON, Inc. 	Industrials 	Building Products 	Tulsa, Oklahoma 	view 	0000824142

open SP600, ("<data/sp600.txt") or die;

while ($line = <SP600>) {
@_ = split ("\t", $line );
$company{$_[0]} = $_[1];

# print $company{$_[0]}, "\t", $_[0], "\n";

}
close SP600;


# AA 	Alcoa 	Materials 	Aluminum 	Pittsburgh, Pennsylvania 	reports

open SP400, ("<data/sp400.txt") or die;

while ($line = <SP400>) {
@_ = split ("\t", $line );
$company{$_[0]} = $_[1];

# print $company{$_[0]}, "\t", $_[0], "\n";

}
close SP400;

# ADBE 	Adobe Inc. 	Information Technology 	Application Software 	San Jose, California 	1997-05-05 	0000796343 	1982

open SP500, ("<data/sp500.txt") or die;

while ($line = <SP500>) {
@_ = split ("\t", $line );
$company{$_[0]} = $_[1];

print $company{$_[0]}, "\t", $_[0], "\n";

}
close SP400;



$how_many = keys %company;
print "this many:  $how_many\n";

open OUTLIST, (">symbol-list.txt");

@symbols = sort keys %company;
foreach $each_one (@symbols) {
    print OUTLIST "$each_one\n";
   print "$each_one\r";
}
close OUTLIST;
print "\n";


exit;

#**************************************************************
# old code from prior sources
#************************************************************

open RUSSELL, ("<russell.txt") or die;
$line = <RUSSELL>;
chomp $line;
until ($line =~/Aaron.+/) {     #here grab symbols
    $line =~/([\D\.]+)/;
    push (@group_one, $line) ;
    $line = <RUSSELL>; 
    chomp $line;   
}
foreach $sym (@group_one) {     #here grab names
    $company{$sym} = $line;
    $line = <RUSSELL>;
    chomp $line;
}
print $line;
if ($line =~/Russell 2000 Stocks List \(D-K\).*/) { print "good\n"; }

$line = <RUSSELL>;
chomp $line;
until ($line =~/Daktronics.+/) {
    $line =~/([\D\.]+)/;
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
    $line =~/([\D\.]+)/;        
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
    $line =~/([\D\.]+)/;
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
#    print "$sym\t$company{$sym}\n";
}
close RUSSELL;


#************************************* space tab info...
#20 	JPMorgan Chase & Co. 	JPM 	2.677537 	  140.10 	
open DOW,("<dj.txt") or die;

while (<DOW>) {
    /(\d+) \t(\D+) \t([A-Z\.]+)/;
#    print "$3\t$2\n";

    $company{$3} = $2;
}
close DOW;



open NASDAQ, ("<nq-100.txt") or die;

while (<NASDAQ>) {
    /(\d+) \t(\D+) \t([A-Z\.]+)/;
#    print "$3 $2\n";

    $company{$3} = $2;

}
close NASDAQ;


open SP500, ("<sp-500.txt") or die;

while (<SP500>) {
    /(\d+) \t(\D+) \t([A-Z\.]+)/;
#    print "$3\t$2\n";

    $company{$3} = $2;

}
close SP500;


open SP400, ("<sp-400.txt") or die;

while (<SP400>) {
    /([A-Z\.]+)\t([\w ,-\.]+)\t/;
#    print "$1\t$2\n";
    $company{$1} = $2;
}
close SP400;

#while ( <SP400>) {
#    chomp;
#    chop;
#    if ( /(^\D+)/ ) {
#        $c = $1;
#        if ( $c !~ /[-\+]/ ) {
#            if ( $c =~ /^\s(\D+)/ ) {
#                $sym = $1;
#            } else { 
#                print "$c $sym\n";

#                $company{$sym} = $c;


#}   }   }   }
#close SP400;


open SP600, ("<sp-600.txt") or die;

while (<SP600>) {
    /([A-Z\.]+)\t([\w ,-\.]+)\t/;
#    print "$1\t$2\n";
    $company{$1} = $2;
}
close SP600;



$how_many = keys %company;
print "this many:  $how_many\n";

open OUTLIST, (">symbol-list.txt");

@symbols = sort keys %company;
foreach $each_one (@symbols) {
    print OUTLIST "$each_one\n";
#   print "$each_one\r";
}
close OUTLIST;
print "\n";

