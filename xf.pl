my $s = shift;
my @am, @a90, @a90m;
#my @a = split //,$s;
my @a = split //,$s;
#print map "$_ ", @a;

for (my $i = 0; $i < 8; $i++) {
	$am[$i] = 7 - $a[$i];
	$a90[$a[$i]] = 7 - $i;
	#$a90[$a[7-$i]] = $i; # Identical to a90
	$a90m[$a[$i]] = $i;
	$a180[$i] = 7 - $a[7-$i];
	$a180m[$i] = $a[7-$i];
	$a270[7-$a[$i]] = $i;
	$a270m[7-$a[$i]] = 7 - $i;
	#$a270m[7-$a[7-$i]] = $i; 
	$t[7-$a[7-$i]] = $i;

}

sub p {
  my $name = shift;
  my @arr = @_;
  printf "%-5.5s %8s\n",$name,join '',@_;
}

sub t90 {
  my @s = split //,shift;
  my @s90 = ();
  while (my ($i, $v) = each @s) { @s90[$v] = 7-$i; }
  return join '',@s90
}

p("a",@a);
p("am",@am);
p("a90",@a90);
p("a90m",@a90m);
p("a180",@a180);
p("a180m",@a180m);
p("a270",@a270);
p("a270m",@a270m);
p("test",@t);

($sm = $s) =~ tr/01234567/76543210/;
printf "%-5.5s %s\n","a",$s;
printf "%-5.5s %s\n","am",$sm;
printf "%-5.5s %s\n","a90",t90($s);
printf "%-5.5s %s\n","a180",t90(t90($s));
printf "%-5.5s %s\n","a270",t90(t90(t90($s)));

