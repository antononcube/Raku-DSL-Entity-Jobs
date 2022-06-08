use lib './lib';
use lib '.';
use DSL::Entity::Jobs;
use Test;

my %targetToAction{Str} =
        "WL-System"        => DSL::Entity::Jobs::Actions::WL::System;

##===========================================================
## Skills
##===========================================================

my $pCOMMAND = DSL::Entity::Jobs::Grammar;
$pCOMMAND.set-resources(DSL::Entity::Jobs::resource-access-object());

my $ACTOBJ = %targetToAction{'WL-System'}.new(resources => DSL::Entity::Jobs::resource-access-object());

plan 8;

## 1
is $pCOMMAND.parse('java', rule => 'entity-job-skill', actions => $ACTOBJ).made,
        '"Java"',
        'java';

## 2
is $pCOMMAND.parse('java developmnt', rule => 'entity-job-skill', actions => $ACTOBJ).made,
        '"JavaDevelopment"',
        'java developmnt (misspelled)';

## 3
is ToJobEntityCode('java development'),
        '"JavaDevelopment"',
        'java development';

## 4
is $pCOMMAND.parse('continuous integration', rule => 'entity-job-skill', actions => $ACTOBJ).made,
        '"ContinuousIntegration"',
        'continuous integration';

## 5
is $pCOMMAND.parse('customer service', rule => 'entity-job-skill', actions => $ACTOBJ).made,
        '"CustomerService"',
        'customer service';

## 6
is $pCOMMAND.parse('mobile application development', rule => 'entity-job-skill', actions => $ACTOBJ).made,
        '"MobileApplicationDevelopment"',
        'mobile application development';

## 7
is ToJobEntityCode('quality assurance'),
        '"QualityAssurance"',
        'quality assurance';

## 8
is ToJobEntityCode('quality management'),
        '"QualityManagement"',
        'quality management';

done-testing;
