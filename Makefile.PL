#!/usr/bin/perl

use strict;

# For PRIVATE Module::Install extensions
use lib 'private-lib';

use lib '.';
use inc::Module::Install;

all_from('lib/Benchmark/Timer.pm');

# Perl 5.6 doesn't work with URI::Escape. We get an error about Exporter not exporting "import"
perl_version '5.008';

requires(
  'Time::HiRes' => 0,
);

test_requires(
  'Test::More' => 0,
);

license 'gpl2';

auto_license(holder => 'David Coppit');

check_optional('Statistics::PointEstimation' => 0,
  "Install Statistics::PointEstimation for statistical sampling support\n");

no_index 'file' => 'delta.pl';
no_index 'directory' => 'private-lib';

realclean_files('inc');

WriteAll;
