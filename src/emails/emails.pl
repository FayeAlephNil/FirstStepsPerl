#!/usr/bin/env perl

use v5.20.1;
use warnings;
use strict;

run();


#The code that will run
sub run {
  #get email info
  my $email = prompt("What is your email?\n");
  my $email_type = get_email_url($email);
  my $email_ending = get_email_url_ending($email);

  #print email info
  print("Your email is of type: " . $email_type . "\n");
  print("Your email ends with: " . $email_ending);
}

sub get_email_url {
  #get args
  my ($str) = @_;

  #check is_email
  if (is_email($str)) {
    #split and return after @
    my ($first, $last) = split(/@/, $str);
    return $last;
  }

  return "not an email";
}

sub is_email {
  #get args
  my ($text) = @_;

  #use regexp to check if it is an email
  if ($text =~ m/.+@.+\..+/) {
    return 1;
  }

  return 0;
}

sub get_email_url_ending {
  #get args
  my ($str) = @_;

  #check is_email
  if (is_email($str)) {
    #split and return (+ a .) after the . after @
    my ($first, $last) = split(/@.+\./, $str);
    return "." . $last
  }

  return "no ending";
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
