#!/usr/bin/env perl

use v5.20.1;
use warnings;
use strict;

print(get_fibs((prompt("what stage do you want?\n"))));
#my $num = prompt("what stage do you want?\n");
#for my fib (get_fibs($num)) {
#  print(fib . "\n")
#}

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
sub get_fibs {
  my ($stage) = @_;
  my @fibs = (0);
  my @a = 0;
  if ($stage  > 0) {
    while (@a < $stage) {
      @a = @a + 1;
      push @fibs, (fibonacci(@a));
    }
  } elsif ($stage < 0) {
    while ($a > $stage) {
      @a = @a - 1;
      push @fibs, (fibonacci(@a));
    }
  }
  return @fibs
}
