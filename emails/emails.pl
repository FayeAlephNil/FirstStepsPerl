#!/usr/bin/env perl

use v5.20.1;
use warnings;
use strict;

run();


sub run {
  my $email = prompt("What is your email?\n");
  my $email_type = get_email_url($email);
  my $email_ending = get_email_url_ending($email);
  print("Your email is of type: " . $email_type . "\n");
  print("Your email ends with: " . $email_ending);
}

sub get_email_url {
  my ($str) = @_;

  if (is_email($str)) {
    my ($first, $last) = split(/@/, $str);
    return $last;
  }

  return "not an email";
}

sub is_email_com {
  my ($str) = @_;

  if (is_email($str)) {
    if ($str =~ m/@.+\.com$/) {
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

sub get_email_url_ending {
  my ($str) = @_;

  if (is_email($str)) {
    my ($first, $last) = split(/@.+\./, $str);
    return "." . $last
  }

  return "no ending";
}

sub prompt {
  my ($text) = @_;
  print $text;

  my $answer = <STDIN>;
  chomp $answer;
  return $answer;
}
