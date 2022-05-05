use lib './lib';
use lib '.';
use DSL::Entity::Jobs;
use Test;

##===========================================================
## Titles
##===========================================================

plan 8;

## 1
is ToJobEntityCode('software architect'), '"SoftwareArchitect"', 'software architect';

## 2
is ToJobEntityCode('java developer'), '"JavaDeveloper"', 'java developer';

## 3
is ToJobEntityCode('project manager'), '"ProjectManager"', 'project manager';

## 4
is ToJobEntityCode('painter'), '"Painter"', 'painter';

## 5
is ToJobEntityCode('fine art painter'), '"FineArtPainter"', 'fine art painter';

## 5
is ToJobEntityCode('driver'), '"Driver"', 'driver';

## 7
is ToJobEntityCode('owner driver'), '"OwnerDriver"', 'owner driver';

## 8
is ToJobEntityCode('mechanical engineer'), '"MechanicalEngineer"', 'mechanical engineer';


done-testing;
