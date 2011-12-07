#!/usr/bin/perl -w
#
# script to normalize cookies for phase space analysis.
#
# written by. <florian.walther@nruns.com>
# date: 16.07.2004
# $Id$
#
###
$usage="$0 <filename>\n";
$filename = $ARGV[0] or die "$usage\n";

open FH, "$filename" or die "Can't open $filename: $!\n";
while (<FH>) {
    #$_ =~s/^Set-Cookie: JSESSIONID=A3//g;
    #$_ =~s/\!1633673148; path=\///g;
    $_ =~s/(.)/substr(("0"x3).ord($1),-3)/ge;
    print ("$_");
}
close FH;
