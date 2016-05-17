#Russell Anderson
#Lab 9
#write a perl program that reads a users credit card number, if it matches 
#the correct regex pattern, the CC number will be displayed with 4 digits on a new line each

#!/usr/bin/perl

#prompt user to enter CC number
print 'Enter Your Credit Card Number: ';
#var for user input
$inp = <>;

#regex expression to test CC pattern
if (length($inp) >= 16 && $inp =~ /(^\d{4})[-|\s]*(\d{4})[-|\s]*(\d{4})[-|\s]*(\d{4}$)/) {
#use capture variables to print matching sub regex with line break
print "$1\n$2\n$3\n$4\n"; }
#if anything other than regex pattern....
 else {print "Incorrect Format\n";}
