#!/usr/bin/env perl

use v5.20.1;
use warnings;
use strict;

run();


sub run {
  my $email = prompt("What is your email?\n");
  my $email_type = get_email_type($email);
  print("Your email is of type: " . $email_type);
}

sub get_email_type {
  my ($str) = @_;

  if (is_gmail($str)) {
    return "gmail";
  } elsif (is_yahoo($str)) {
    return "yahoo";
  } elsif (is_email_com($str)) {
    return ".com";
  } elsif (is_email($str)) {
    return "an email";
  }

  return "not an email";
}
sub is_gmail {
  my ($str) = @_;

  if (is_email($str)) {
    if ($str =~ m/gmail.com$/) {
      return 1;
    }
  }

  return 0;
}

sub is_yahoo {
  my ($str) = @_;

  if (is_email($str)) {
    if ($str =~ m/yahoo.com$/) {
      return 1;
    }
  }

  return 0;
}

sub is_email {
  my ($text) = @_;
  if ($text =~ m/.+@.+\..+/) {
    return 1;
  }

  return 0;
}

sub is_email_com {
  my ($str) = @_;

  if (is_email($str)) {
    if ($str =~ m/com$/) {
      return 1;
    }
  }

  return 0;
}

sub prompt {
  my ($text) = @_;
  print $text;

  my $answer = <STDIN>;
  chomp $answer;
  return $answer;
}
