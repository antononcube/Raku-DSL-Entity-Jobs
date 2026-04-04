# Raku DSL::Entity::Jobs package

This Raku package has grammars for parsing job entities and related sub-entities: 
titles, skills, acronyms, keywords.  

## Data

The textual data is taken from different projects posted at 
[data.world](https://data.world).

- [X] Job Titles
    
    - [X] [Similar Job Titles (74,567 unique job titles)](https://data.world/peopledatalabs/similar-job-titles-74567-unique-job-titles)
    
        - After fixing the JSON file in order to be able to parse it Mathematica and R
          ~34,000 English job titles were obtained.
       
    - [ ] [US jobs on Dice.com](https://data.world/promptcloud/us-jobs-on-dice-com)
    
    - [ ] [Simplyhired Job Listing 2020](https://data.world/promptcloud/simplyhired-job-listing-2020)
  
    - [ ] [Careerbuilder Job Listing 2020](https://data.world/promptcloud/careerbuilder-job-listing-2020)
    
- [X] Job Skills
    
    - [X] [US jobs on Dice.com](https://data.world/promptcloud/us-jobs-on-dice-com)
    
- [ ] Job Acronyms
    
    - *TBD...*
    
- [ ] Job Keywords

    - *TBD...*

## Examples

```raku
use DSL::Entity::Jobs;

say ToJobEntityCode('software architect');
say ToJobEntityCode('academic success coach', 'Raku-System');
```

### Grammar parsing

```raku
use DSL::Entity::Jobs::Grammar;

my $pCOMMAND = DSL::Entity::Jobs::Grammar.new;
$pCOMMAND.set-resources(DSL::Entity::Jobs::resource-access-object());

$pCOMMAND.parse('freelance web content writer', rule => 'job-entity-spec');
```

```raku
$pCOMMAND.parse('i want talent for freelance web content writer');
```

## References

### Other entity Raku packages

[AAp1] Anton Antonov,
[DSL::Entity::Foods](https://github.com/antononcube/Raku-DSL-Entity-Foods),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAp2] Anton Antonov,
[DSL::Entity::Geographics](https://github.com/antononcube/Raku-DSL-Entity-Geographics),
(2021),
[GitHub/antononcube](https://github.com/antononcube).
