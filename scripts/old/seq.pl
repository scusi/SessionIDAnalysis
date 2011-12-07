#!/usr/bin/perl -w
#
# seq.pl
# Script to see how random session ID are.
############################################
use Math::BigInt;

@seq = ();
@x = @y = @z = ();
while(<>) {
        chomp($val = $_);
        push(@seq, $val);

}
for ($i = 3; $i < $#seq; $i++) {
        push(@x, $seq[$i]       - $seq[$i - 1]);
        push(@y, $seq[$i - 1]   - $seq[$i - 2]);
        push(@z, $seq[$i - 2]   - $seq[$i - 3]);
}
for ($i = 0; $i < $#seq; $i++) {
        print $x[$i] . " " . $y[$i] . " " . $z[$i] . "\n";
}
