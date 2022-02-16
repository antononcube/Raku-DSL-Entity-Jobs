use lib './lib';
use lib '.';
use DSL::Entity::Jobs;
use Test;

##===========================================================
## Titles
##===========================================================

my $pCOMMAND = DSL::Entity::Jobs::Grammar;
$pCOMMAND.set-resources(get-entity-resources-access-object());

plan 8;

## 1
ok $pCOMMAND.parse('software architect', rule => 'entity-job-title'), 'software architect';

## 2
ok $pCOMMAND.parse('java developer', rule => 'entity-job-title'), 'java developer';

## 3
ok $pCOMMAND.parse('project manager', rule => 'entity-job-title'), 'project manager';

## 4
ok $pCOMMAND.parse('painter', rule => 'entity-job-title'), 'painter';

## 5
ok $pCOMMAND.parse('fine art painter', rule => 'entity-job-title'), 'fine art painter';

## 5
ok $pCOMMAND.parse('driver', rule => 'entity-job-title'), 'driver';

## 7
ok $pCOMMAND.parse('owner driver', rule => 'entity-job-title'), 'owner driver';

## 8
ok $pCOMMAND.parse('mechanical engineer', rule => 'entity-job-title'), 'mechanical engineer';


done-testing;
