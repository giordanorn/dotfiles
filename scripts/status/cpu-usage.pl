#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use Getopt::Long;

my $t_warn = 50;
my $t_crit = 80;
my $cpu_usage = -1;

sub help {
    print "Usage: cpu_usage [-w <warning>] [-c <critical>]\n";
    print "-w <percent>: warning threshold to become yellow\n";
    print "-c <percent>: critical threshold to become red\n";
    exit 0;
}

GetOptions("help|h" => \&help,
           "w=i"    => \$t_warn,
           "c=i"    => \$t_crit);

# Get CPU usage
$ENV{LC_ALL}="en_US"; # if mpstat is not run under en_US locale, things may break, so make sure it is
open (MPSTAT, 'mpstat 1 1 |') or die;
while (<MPSTAT>) {
    if (/^Average.*\s+(\d+\.\d+)/) {
        $cpu_usage = 100 - $1; # 100% - %idle
        last;
    }
}
close(MPSTAT);

$cpu_usage eq -1 and die 'Can\'t find CPU information';

# Print formatted cpu usage percent
printf "%.0f\n", $cpu_usage;
