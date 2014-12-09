#!/usr/bin/env perl

use v5.20.1;
use warnings;
use strict;

print(get_fibs((prompt("what stage do you want?\n"))));

#my $num = prompt("what stage do you want?\n");
#for my fib (get_fibs($num)) {
#  print(fib . "\n")
#}


#basic prompt code
sub prompt {
  #get and print args
  my ($text) = @_;
  print $text;

  #get input, chomp and return it
  my $answer = <STDIN>;
  chomp $answer;
  return $answer;
}

#get fibonacci for stage
sub fibonacci {
  #get stage
  my ($stage) = @_;

  #check if stage = 0 and return 0 if so
  if ($stage == 0) {
    return 0;
  } elsif ($stage == 1) {
    #if stage = 1 I will return 1
    return 1;
  } elsif ($stage > 1) {
    #if stage > 1 then I will return the fib for stage
    return fibonacci($stage-1) + fibonacci($stage-2);
  } elsif ($stage < 0) {
    #if stage < 0 then I will return the fib using a formula
    return ((-1) ** (-1 * $stage + 1)) * fibonacci(-1 * $stage);
  }

  return 0;
}
sub get_fibs {
  #get stage
  my ($stage) = @_;

  #declare array
  my @fibs = (0);

  #declare a looping variable
  my @a = 0;

  if ($stage  > 0) {
    #loop if stage > 0 increments up
    while (@a < $stage) {
      @a = @a + 1;
      push @fibs, (fibonacci(@a));
    }
  } elsif ($stage < 0) {
    #loop if stage > 0 increments down
    while ($a > $stage) {
      @a = @a - 1;
      push @fibs, (fibonacci(@a));
    }
  }

  #return fibs array
  return @fibs
}
