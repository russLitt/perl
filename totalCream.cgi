#!/usr/bin/perl
use CGI ':standard';
$form = new CGI;
print $form->header;
$form->start_html('cgi script ice cream page');

#phone and address variables
$phone = $form->param('phone');
#'[0-9]{3}[-][0-9]{3}[-][0-9]{4}|\(?[0-9]{3}[-)]?\)[0-9]{3}[ -]?[0-9]{4}'
$street = $form->param('street');

#var to hold contents of ice cream type
@type = $form->param('type');

#determine if user has entered input for street...
if($street eq "") {
	print "<b>Please go back and enter a street address</b>";
}

elsif($phone eq "") {
	print "<b>Please go back and enter a phone number</b>";
}

#determine if at least one check box has been selected
elsif(scalar @type < 1) {
print "<b>Please go back and select at least 1 flavor</b>";
}

#if all those criteria are met...print results
else {

print "<font size = 4><b>Please review the contact information you entered:</b></font><br>";
print "Street Address: $street<br>";
print "Phone Number: $phone<br><br>";

$cost = 1.25;		#ice cream constant
$tax = .0925;		#tax constant
$subtotal = 0.00;	#variable for subtotal

print "<font size=4><b>Please review your order</b></font><br>";
#loop through checkbox selctions
foreach $i (@type) {
#print selection and price
	print "$type<pre>$i:&nbsp;&nbsp;&nbsp;&nbsp;\$$cost</pre>";
	$subtotal = $subtotal + $cost;
}

$subtotal = sprintf("%.2f", $subtotal);
$tax =  sprintf("%.2f",  $subtotal * $tax);
$total =  sprintf("%.2f", $subtotal + $tax);


print "<pre><br>Subtotal:&nbsp;&nbsp;\$$subtotal<br>";
print "Tax:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\$$tax<br><br>";
print "<b><font size=4>Order Total:&nbsp;&nbsp;\$$total</b></font></pre><br></center>";

}

$form->end_html();
exit 0;
