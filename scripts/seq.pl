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
        if (length($val) > 0) {
          push(@seq, $val);
        }
}
for ($i = 3; $i < $#seq; $i++) {
        $o = Math::BigInt->new($seq[$i]);
        $m1 = Math::BigInt->new($seq[$i-1]);
        $m2 = Math::BigInt->new($seq[$i-2]);
        $m3 = Math::BigInt->new($seq[$i-3]);
        push(@x, scalar $o->bsub($m1));
        push(@y, scalar $m1->bsub($m2));
        push(@z, scalar $m2->bsub($m3));

   #     push(@x, $seq[$i]       - $seq[$i - 1]);
   #     push(@y, $seq[$i - 1]   - $seq[$i - 2]);
   #     push(@z, $seq[$i - 2]   - $seq[$i - 3]);
}
for ($i = 0; $i < $#seq; $i++) {
        if (defined $x[$i]) {
          print $x[$i] . " " . $y[$i] . " " . $z[$i] . "\n";
        }
}
