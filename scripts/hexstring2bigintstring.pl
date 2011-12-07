#!/usr/bin/perl
##########################################################################
##
## by vh@thc.org, converts hexstrings to big integers
#  e.g.:
#    Cookie is -> Cookie: JESSIONID=C78D060223A08F9FF1488DE3B93FCF8C
#     value is C78D060223A08F9FF1488DE3B93FCF8C
#    echo C78D060223A08F9FF1488DE3B93FCF8C | hexstring2bigint.pl
#     returns 265248606882191698065742702371877670796
#    use this for seq-bigint.pl
#   Scripting:
#    sed 's/^Cookie: JESSIONID=//' COOKIEFILE | hexstring2bigint.pl | \
#    seq_bigint.pl > cookie.dat
#    echo 'splot "cookie.dat"' | gnuplut
#

use Math::BigInt lib => 'GMP';

while(<>) {
	chomp;
	$inp = $_;
	$inp =~ s/ //g;
	$sum = Math::BigInt->new();
	$add = Math::BigInt->new();
	$mul = Math::BigInt->new();
	$exp = Math::BigInt->new('1');
	$counter = 0;
	if (length($inp) % 2 == 1) {
	  $inp = "0" . $inp;
	}
	for ($i = length($inp) - 2; $i >= 0; $i -= 2) {
	  $conv = substr($inp, $i, 2);
	  $char = pack('H2', $conv);
	  $ord = ord($char);
	  $add->bzero();
	  $add->badd($ord);
	  $mul->bzero();
	  $mul->badd($add);
	  if ($counter > 0) {
	    $exp->bmul('256');
	  }
          $counter += 1;
	  $mul->bmul($exp);
	  $sum->badd($mul);
#	  print "conv: " . $conv . ", add: " . $add . ", exp: " . $exp . ", sum: " . $sum . "\n";
	}
	print $sum . "\n";
}

exit(0);
