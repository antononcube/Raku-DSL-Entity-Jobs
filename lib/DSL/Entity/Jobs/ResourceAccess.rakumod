use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Shared::Utilities::MetaSpecsProcessing;
use DSL::Shared::Entity::ResourceAccess;

class DSL::Entity::Jobs::ResourceAccess
        is DSL::Shared::Entity::ResourceAccess {
    #-----------------------------------------------------------
    # OVERRIDE-START
    #-----------------------------------------------------------

    #| Override the parent class function in order to call
    #| DSL::Shared::Entity::ResourceAccess.make()
    #| with the correct file names.
    method get-resource-files( --> Positional) {
        my @fileNames = <JobSkillToEntityID_EN.tsv JobTitleToEntityID_EN.tsv ONETJobSkillToEntityID_EN.tsv ONETJobTitleToEntityID_EN.tsv>;
        my @resources = <Skill Title Skill Title> Z=> @fileNames;
        @resources = @resources.map({ $_.key => %?RESOURCES{$_.value} });
        return @resources;
    }

    #-----------------------------------------------------------
    # OVERRIDE-END
    #-----------------------------------------------------------

    #-----------------------------------------------------------
    method known-title(Str:D $phrase, Bool :$bool = True, Bool :$warn = True) {
        ## If the tile candidate $phrase is a known skill, then return False/Nil.
        if $phrase (elem) self.getKnownNames(){'Skill'} {
            $bool ?? False !! Nil
        } else {
            self.known-name('Title', $phrase, :$bool, :$warn)
        }
    }

    #-----------------------------------------------------------
    method known-skill(Str:D $phrase, Bool :$bool = True, Bool :$warn = True) {
        ## If the skill candidate $phrase is a known title, then return False/Nil.
        if $phrase (elem) self.getKnownNames(){'Title'} {
            $bool ?? False !! Nil
        } else {
            self.known-name('Skill', $phrase, :$bool, :$warn)
        }
    }
}
