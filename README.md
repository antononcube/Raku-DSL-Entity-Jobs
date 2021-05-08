# DSL::Entity::Jobs

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
    
- [ ] Job Skills
    
    - [ ] [US jobs on Dice.com](https://data.world/promptcloud/us-jobs-on-dice-com)
    
- [ ] Job Acronyms
    
    - *TBD...*
    
- [ ] Job Keywords

    - *TBD...*

## Examples

```perl6
say $pCOMMAND.parse('freelance web content writer', rule => 'job-entity-command');

#｢freelance web content writer｣
# job-title => ｢freelance web content writer｣
#  freelance-job-title => ｢freelance web content writer｣
#   freelance-job-title-word => ｢freelance｣
#   web-job-title-word => ｢web｣
#   content-job-title-word => ｢content｣
#   writer-job-title-word => ｢writer｣
```

```perl6
say $pCOMMAND.parse('i want talent for freelance web content writer');

#｢i want talent for freelance web content writer｣
# recommend-for-job-command => ｢i want talent for freelance web content writer｣
#  job-entity-command => ｢freelance web content writer｣
#   job-title => ｢freelance web content writer｣
#    freelance-job-title => ｢freelance web content writer｣
#     freelance-job-title-word => ｢freelance｣
#     web-job-title-word => ｢web｣
#     content-job-title-word => ｢content｣
#     writer-job-title-word => ｢writer｣
```

## References

### Other entity Raku spackages

[AAp1] Anton Antonov,
[DSL::Entity::Foods](https://github.com/antononcube/Raku-DSL-Entity-Foods),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAp2] Anton Antonov,
[DSL::Entity::Geographics](https://github.com/antononcube/Raku-DSL-Entity-Geographics),
(2021),
[GitHub/antononcube](https://github.com/antononcube).
