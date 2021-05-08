use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Shared::Utilities::MetaSpecsProcessing;

class DSL::Entity::Jobs::ResourceAccess {
    ##========================================================
    ## Data
    ##========================================================
    my Hash %nameToEntityID{Str};
    my Set %knownNames{Str};
    my Set %knownNameWords{Str};

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

    submethod instance {

        $instance = DSL::Entity::Jobs::ResourceAccess.bless unless $instance;

        if $numberOfInstances == 0 {
            $instance.make()
        }

        $numberOfInstances += 1;

        $instance
    }

    method make() {
        $numberOfMakeCalls += 1;
        #say "Number of calls to .make $numberOfMakeCalls";

        #-----------------------------------------------------------
        for <Skill Title> -> $fn {
            my $fileName = %?RESOURCES{'Job' ~ $fn ~ 'ToEntityID_EN.csv'};
            my Str @nameIDPairs = $fileName.lines;

            my %nameRules = @nameIDPairs.map({ $_.split(',') }).flat;
            %nameRules = %nameRules.keys.map(*.lc) Z=> %nameRules.values;

            %nameToEntityID.push( $fn => %nameRules );

            %knownNames.push( $fn => Set(%nameRules) );

            %knownNameWords.push( $fn => Set(%nameRules.keys.map({ $_.split(/h+/) }).flat) );
        }

        #-----------------------------------------------------------
        self
    }

    ##========================================================
    ## Access
    ##========================================================
    method is-known-name-word(Str:D $word) {
        my Bool $res = False;
        for %knownNameWords.keys -> $c {
            $res = known-string(%knownNameWords{$c}, $word, :bool, :!warn);
            last when $res
        }
        $res
    }

    method known-name-word(Str:D $class, Str:D $word, Bool :$bool = True, Bool :$warn = True) {
        known-string(%knownNameWords{$class}, $word, :$bool, :$warn)
    }

    #-----------------------------------------------------------
    method known-name(Str:D $class, Str:D $phrase, Bool :$bool = True, Bool :$warn = True) {
        known-phrase(%knownNames{$class}, %knownNameWords{$class}, $phrase, :$bool, :$warn)
    }

    #-----------------------------------------------------------
    method known-title(Str:D $phrase, Bool :$bool = True, Bool :$warn = True) {
        ## If the tile candidate $phrase is a known skill, then return False/Nil.
        if $phrase (elem) %knownNames{'Skill'} {
            $bool ?? False !! Nil
        } else {
            self.known-name('Title', $phrase, :$bool, :$warn)
        }
    }

    #-----------------------------------------------------------
    method known-skill(Str:D $phrase, Bool :$bool = True, Bool :$warn = True) {
        ## If the skill candidate $phrase is a known title, then return False/Nil.
        if $phrase (elem) %knownNames{'Title'} {
            $bool ?? False !! Nil
        } else {
            self.known-name('Skill', $phrase, :$bool, :$warn)
        }
    }

    #-----------------------------------------------------------
    method name-to-entity-id(Str:D $class, Str:D $phrase, Bool :$warn = False) {
        my $name = self.known-name($class, $phrase.lc, :!bool, :$warn);
        $name ?? %nameToEntityID{$class}{$name} !! Nil
    }
}
