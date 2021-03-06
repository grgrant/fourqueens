#!/usr/bin/perl -l
# Bob's added comments
# Found on the internet -- not sure the author
# Brute force checking all possibilities and no reduced checks for
# Mirrors and reflections (theoretically only 12 distinct patters) but
# this finds 92

sub placequeen
  {
     # Following match finds diagonal hits and returns empty array 
     # Diagonal hit = absolute value of difference between digits
     #                      v
     # does not match distance between digits (inclusive)
     #                                v
     # Force non-match -- double negative         v
     # Empty array when diag match                         v
     $_[0]=~/^(.)(.*(.))(??{abs$1-$3!=length$2 && 'x'})/ ? () : 
     # Else branch hit if no diagonal hits
     # Check is we have 8 characters (8 queens selected) and return
     # the array         v
     # Otherwise Do another iteration and recurse
     #                        v
     # Check to see if iterated value is found in currently checked string
     #                            v       v
     # If so return empty array             v
     # Recurse with iterated value on front of string
     #                                         v
     length $_[0] == 8 ? @_ : map $_[0]=~$_?():placequeen("$_@_"), 0..7

  }
# Iterate over returned boards and map the 8 digit string into
# a Chess board.  for placequeen iterates over returned boards
# returning a board as an 8 char string
# map returns the entire chessboard as a string to a single
# print execution and -l to perl adds the extra newline
#print map '.'x$_.'Q'.'.'x(7-$_)."\n", /./g for placequeen;
#print $_ for placequeen;

my %seen = {};
sub checkdup {
  my $s = shift;
  return if $seen{$s};
  # Not seen yet
  my $t = $s;
  $seen{pmir($s)} = 1;
  for (1..3) { $t = p90($t); $seen{$t} = 1; $seen{pmir($t)} = 1; }
  #print $s;
  $_ = $s;
  print map '.'x$_.'Q'.'.'x(7-$_)."\n", /./g
}

# This transformation rotates the board 90 degrees using value as index
# and index as value
sub p90 {
  my @s = split //,shift;
  my @s90 = ();
  while (my ($i, $v) = each @s) { $s90[$v] = 7-$i; }
  return join '',@s90
}

# This transformation mirrors a board by doing 7-i of each element
sub pmir {
  my $s = shift;
  my $sm;
  ($sm = $s) =~ tr/01234567/76543210/;
  return $sm;
}

checkdup($_) for placequeen;

