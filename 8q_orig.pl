#!/usr/bin/perl -l
# Bob's added comments
# Found on the internet -- not sure the author
# Brute force checking all possibilities and no reduced checks for
# Mirrors and reflections (theoretically only 12 distinct patters) but
# this finds 92

sub placequeen
  {
     # Following mach finds diagonal hits and returns empty array 
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
#print map '.'x$_.'Q'.'.'x(7-$_)."\n", /./g for placequeen;
# Iterate over returned boards and map the 8 digit string into
# a Chess board.  for placequeen iterates over returned boards
# returning a board as an 8 char string
# map returns the entire chessboard as a string to a single
# print execution and -l to perl adds the extra newline
print map '.  'x$_.'Q  '.'.  'x(7-$_)."\n" for placequeen;

