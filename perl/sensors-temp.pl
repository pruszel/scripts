#!/usr/bin/perl
my $nl = 0;
my $chip;
my @t;

while (<>) {
  if ($chip eq "" or $nl) {
    ($chip = $_) =~ s/\n*$//;
    @t = ()
  } elsif ($_ =~ /temp\d+_input: ([\d\.]+)/m) {
     push @t, $1;
  }

  $nl = $_ eq "\n";

  if ($nl or eof()) {
    # Average chip's temperature
    my $t;
    map { $t += $_ } @t;

    printf("%s - %.1f°C\n", $chip, @t)
  }
}

