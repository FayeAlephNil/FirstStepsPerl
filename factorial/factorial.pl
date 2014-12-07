#!/usr/bin/env perl

use v5.20.1;
use warnings;
use strict;

run();

sub run {
  print(factorial(prompt("What number do you want to take the factorial of? (must be positive or 0)\n")));
}

sub prompt {
  my ($text) = @_;
  print $text;

  my $answer = <STDIN>;
  chomp $answer;
  return $answer;
}

sub factorial {
  my ($stage) = @_;
  if ($stage == 0) {
    return 1;
  } elsif ($stage > 0) {
    return $stage * factorial($stage - 1);
  } elsif ($stage < 0) {
    print("Num must be greater than or equal to 0, try again\n\n");
    run();
  }
}
