#!/usr/bin/env perl

use v5.20.1;
use warnings;
use strict;

run();

#code to run
sub run {
  print(factorial(prompt("What number do you want to take the factorial of? (must be positive or 0)\n")));
}

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

#get factorial stage
sub factorial {
  #get stage
  my ($stage) = @_;

  #check if 0 and if so return 1
  if ($stage == 0) {
    return 1;
  } elsif ($stage > 0) {
    #return stage! if stage > 0
    return $stage * factorial($stage - 1);
  } elsif ($stage < 0) {
    #print error if stage < 0
    print("Num must be greater than or equal to 0, try again\n\n");
    run();
  }
}
