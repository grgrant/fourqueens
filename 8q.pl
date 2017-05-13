#!/usr/bin/perl -l


sub placequeen
  {
	  print "B: ",$_[0],"\n";
	  print "Soln: ",@_,"\n" if length $_[0] == 8;
     $_[0]=~/^(.)(.*(.))(??{abs$1-$3!=length$2 && 'zzz'})/ ? () : 
     length $_[0] == 8 ? @_ : map $_[0]=~$_?():placequeen("$_@_"), 0..7
#	  print "A: ",$_[0],"\n";

  }
#print map '.'x$_.'Q'.'.'x(7-$_)."\n", /./g for placequeen;
print map '.  'x$_.'Q  '.'.  'x(7-$_)."\n", /./g for placequeen;
