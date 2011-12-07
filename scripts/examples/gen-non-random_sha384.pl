#!/usr/bin/perl -w
#
# Script to generate non random values, to demonstrate a bad randomness graph
# for my "Howto Analyse SessionIDs".
#
# written by: <flow@atstake.com> 
$version = "0.0.4";
$filename = "gen-non-random.pl";
$usage = "usage: $filename <count> <outputfile>\n";

$count = $ARGV[0] or die ("$usage\n");
$output = $ARGV[1] or die ("$usage\n");
print ("-- $filename Version: $version\n");

use Time::HiRes qw( usleep ualarm gettimeofday tv_interval );
use Math::Random;
use Digest::SHA qw(sha384_hex);

open (OUT, ">$output") or die ("Can't open $output\n");

for ($i=0; $i<$count;$i++)
{
        # generate a random number
        $random = random_uniform();
        # cut out char 3-9 of $random and put it in $randsub
        $randsub = substr($random, 2, 6);
        # get seconds and microseconds since epoch
        ($seconds, $microseconds) = gettimeofday;
        # get the last two chars of the seconds and put them into $s
        $s = substr($seconds, 8, 2);
        # sleep for a while
        usleep $randsub;
        # put together the last two digits of seconds and the microseconds
        $time = $s . $microseconds;
	$time_sha = sha384_hex($time);
        # print out the stuff we put together above
        print OUT ("$time_sha\n");
}
close (OUT) or die ("Can't close $output\n");
print ("$count values written to $output\n");
exit;
