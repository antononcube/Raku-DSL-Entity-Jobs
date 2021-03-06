#!/usr/bin/env perl6
use lib './lib';
use lib '.';
use DSL::Entity::Jobs;

my $pCOMMAND = DSL::Entity::Jobs::Grammar;

##==========================================================
sub remove( Str:D $str is copy, @indices --> Str:D) {
    for @indices.reverse {
        when Int   { $str.substr-rw($_,1) = '' }
        when Range { $str.substr-rw($_  ) = '' }
    }
    $str
}

say 'remove("java developer", [4]): ', remove("java developer", [8]);

##==========================================================
my Str $fileName = $*CWD.Str ~ '/resources/' ~ 'JobTitles.txt';

my Str @jobTitles = $fileName.IO.lines;

say @jobTitles[1 .. 12].join("; ");

my Set $knownJobTitles = Set(@jobTitles);

say 'java developer' (elem) $knownJobTitles;

##===========================================================
say "-" x 40;
my $start = now;
my Int $n = 1_000;
my @tests = @jobTitles.roll($n);
my @res = do for @tests -> $jt { $jt (elem) $knownJobTitles };
my $end = now;
my $avg1 = $end - $start;
say '1st total: ', $avg1;
say '1st  mean: ', $avg1 / $n;

say @res.classify({ so $_ }).pairs.map({ $_.key => $_.value.elems });

##===========================================================
say "-" x 40;
$start = now;
my @res2 = do for @tests -> $jt {
    quietly {
        so $pCOMMAND.parse($jt, rule => 'job-entity-spec-list')
    }
};

$end = now;
my $avg2 = $end - $start;
say '2nd total: ', $avg2;
say '2nd  mean: ', $avg2 / $n;

say @res2.classify({ so $_ }).pairs.map({ $_.key => $_.value.elems });

##===========================================================
say "-" x 40;
$start = now;
my Str @tests2 = @tests.map( { remove( $_, [$_.chars.rand.Int] ) } );
#my Str @tests2 = ['jav programer', 'directr of productio', 'veb designner'];

my @res3 = do for @tests2 -> $jt {
    quietly {
        so $pCOMMAND.parse($jt, rule => 'job-entity-spec-list');
    }
};

$end = now;
my $avg3 = $end - $start;
say '3rd total: ', $avg3;
say '3rd  mean: ', $avg3 / $n;

say @res3.classify({ so $_ }).pairs.map({ $_.key => $_.value.elems });

##===========================================================
say '$avg2 / $avg1 = ', $avg2 / $avg1;
say '$avg3 / $avg1 = ', $avg3 / $avg1;
say '$avg3 / $avg2 = ', $avg3 / $avg2;
