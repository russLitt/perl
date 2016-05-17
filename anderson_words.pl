
#
#
#Russell Anderson
#Lab 9 part 2 - program that counts frequency of selected words in 
#  standard input and print the words in descending order.
#
#Resources used:
#  http://perlmaven.com/perl-hashes
#    http://perlmaven.com/transforming-a-perl-array-using-map
#      http://perlmaven.com/how-to-sort-a-hash-in-perl
#
#
#!/usr/bin/perl

#create empty hash to hold values
my %wordList;

#loop through command line args
foreach (@ARGV) {
	$_ =~ s/[[:punct:]]//g; #remove punct if needed
	$_ = lc($_);		#convert to lower
	push(@keywords, $_)	#push keywords to array
}

#use map function to transform hash to keywords array
%wordList = map { $_ => undef } @keywords;

#while lines are being read...
while($lines = <STDIN>) {
	$lines =~ s/\n/ /g;		#break new line where white space occurs
	$lines =~ s/[[:punct:]]//g;	#remove punction if needed
	$lines = lc("$lines");		#convert to lower case
	#split into words and push them in to words array
	push(@words, split(/\s/, $lines));	
}

#loop through words array checking if new word has already been pushed to it...
foreach (@words) {
	if(exists($wordList{$_})) {	#if so...
		$wordList{$_}++;	#increase count by 1	
	}
}


#print results sorted in descending order by number of occurences
#sort using $a and $b temp variables, compares array values to one another
#using the spaceship operator <=>, resulting in values printed in desc order by count 
foreach (sort { ($wordList{$b} <=> $wordList{$a}) } keys %wordList) {
	print "$_:$wordList{$_}\n";
}
