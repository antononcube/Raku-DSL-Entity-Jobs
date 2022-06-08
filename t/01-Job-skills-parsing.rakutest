use lib './lib';
use lib '.';
use DSL::Entity::Jobs;
use Test;

##===========================================================
## Skills
##===========================================================

my $pCOMMAND = DSL::Entity::Jobs::Grammar;
$pCOMMAND.set-resources(DSL::Entity::Jobs::resource-access-object());

plan 8;

## 1
ok $pCOMMAND.parse('java', rule => 'entity-job-skill'), 'java';

## 2
ok $pCOMMAND.parse('java development', rule => 'entity-job-skill'), 'java development';

## 3
ok $pCOMMAND.parse('account management', rule => 'entity-job-skill'), 'account management';

## 4
ok $pCOMMAND.parse('continuous integration', rule => 'entity-job-skill'), 'continuous integration';

## 5
ok $pCOMMAND.parse('customer service', rule => 'entity-job-skill'), 'customer service';

## 6
ok $pCOMMAND.parse('mobile application development', rule => 'entity-job-skill'), 'mobile application development';

## 7
ok $pCOMMAND.parse('quality assurance', rule => 'entity-job-skill'), 'quality assurance';

## 8
ok $pCOMMAND.parse('quality management', rule => 'entity-job-skill'), 'quality management';

done-testing;
