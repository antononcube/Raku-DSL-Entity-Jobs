use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Shared::Utilities::MetaSpecsProcessing;
use DSL::Shared::Entity::ResourceAccess;

class DSL::Entity::Jobs::ResourceAccess
        is DSL::Shared::Entity::ResourceAccess {
    #-----------------------------------------------------------
    # OVERRIDE-START
    #-----------------------------------------------------------

    ##========================================================
    ## Data
    ##========================================================
    my Hash %nameToEntityID{Str} = %();
    my Set %knownNames{Str} = %();
    my Set %knownNameWords{Str} = %();

    method getNameToEntityID( --> Hash) { %nameToEntityID }
    method getKnownNames( --> Hash) { %knownNames }
    method getKnownNameWords( --> Hash) { %knownNameWords }

    ##========================================================
    ## BUILD
    ##========================================================
    # We create a lexical variable in the class block that holds our single instance.
    my DSL::Entity::Jobs::ResourceAccess $instance = Nil;

    my Int $numberOfInstances = 0;

    method getNumberOfInstances() { $numberOfInstances }

    my Int $numberOfMakeCalls = 0;

    method getNumberOfMakeCalls() { $numberOfMakeCalls }

    method new {!!!}

    #| Singleton instance.
    submethod instance {

        $instance = DSL::Entity::Jobs::ResourceAccess.bless unless $instance;

        if $numberOfInstances == 0 {
            $instance.make()
        }

        $numberOfInstances += 1;

        $instance
    }

    #| Override the parent class function in order to call
    #| DSL::Shared::Entity::ResourceAccess.make()
    #| with the correct file names.
    method get-resource-files( --> Hash) {
        my @fileNames = <JobSkillToEntityID_EN.csv JobTitleToEntityID_EN.csv>;
        my %resources = <Skill Title> Z=> @fileNames;
        %resources = %resources.map({ $_.key => %?RESOURCES{$_.value} });
        return %resources;
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
