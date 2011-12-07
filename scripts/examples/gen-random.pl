#!/usr/bin/perl -w
#
# Script to generate random values, to demonstrate a good randomness graph
# for my "Howto Analyse SessionIDs".
#
# written by: <flow@atstake.com>
# Version: 0.0.1

use Math::Random;

for ($i=0; $i<10000;$i++)
{
$random = random_uniform();
$random =~ s/\A[0\\.]//g;
$random =~ s/\A[\.]//g;
#$random =~ s/\A[\d]{6}//g;
print ("$random\n");
}

exit;
