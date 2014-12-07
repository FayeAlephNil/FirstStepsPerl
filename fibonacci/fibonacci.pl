#!/usr/bin/env perl

use v5.20.1;
use warnings;
use strict;

print(fibonacci(prompt("what stage do you want?\n")));

sub prompt {
  my ($text) = @_;
  print $text;

  my $answer = <STDIN>;
  chomp $answer;
  return $answer;
}

sub fibonacci {
  my ($stage) = @_;
  if ($stage == 0) {
    return 0;
  } elsif ($stage == 1) {
    return 1;
  } elsif ($stage > 1) {
    return fibonacci($stage-1) + fibonacci($stage-2);
  } elsif ($stage < 0) {
    return ((-1) ** (-1 * $stage + 1)) * fibonacci(-1 * $stage);
  }
  return 0;
}
