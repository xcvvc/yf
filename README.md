# yf

Quarterly Data Collection Project

As the web portal (Yahoo) changes its format frequently, these scripts need to be heavily updates with each run.

This is an ongoing project that may be updated quarterly.  The basic process is to clean the 2600 input files, run the batches, clean the 20 thousand output files in preparation to append the sql tables.

https://www.slickcharts.com/sp500
https://www.slickcharts.com/sp400
https://en.wikipedia.orgwiki/List_of_S%26P_600_companies
https://stockmarketmba.com/stocksinthespsmallcap600.php

this doesn't link and load anymore:
https://money.cnn.com/data/markets/russell/?%3Fordes=d&idd=ob_article_footer&page=1

https://fkol.com/stock/list/russell-2000.php?go=
add go=b100, go=b500, go=b1200 as needed, including writing a new script.


The company symbols are gathered into a single list from a half dozen web lists.

For each company, the .pl scripts load a page from the financial social page, and write either the 19th or the 21st line to a local file: subdirectory: text-files, and then mar-2022.  There are eight categories, totaling 20,000 files.

The second pass of eight parsing .py scripts creates exceptions easily identified by a small file size.  change the code to catch the exceptions, which may include an incorrect symbol from the start, or a wide non-utf-8 character from the web community portal.

batch files in sequence:

dj.txt
nq-100.txt
russell.txt
sp-400.txt
sp-500.txt
sp-600.txt
symbol-combine-lists.pl
symbol-list.txt

profile-to-line-19.pl
statistics-to-line-19.pl
summary-to-line-19.pl
holders-to-line-19.pl
financials-to-line-21.pl
cash-flow-to-line-21.pl
balance-sheet-to-line-21.pl
analysis-to-line-21.pl

profile-parse.py
statistics-parse.py
summary-parse.py
holders-parse.py
financials-parse.py
cash-flow-parse.py
balance-sheet-parse.py
analysis-parse.py

A post parse review is needed, based on exceptions, as many changes occur throughout the quarter between batch runs.  For example, over 100 companies have a blank 'no analysis available' table on the source financial website.

The size of the grab from the web portal is about 300 megabytes.  The size of the parsed collection is about 20 MB.


