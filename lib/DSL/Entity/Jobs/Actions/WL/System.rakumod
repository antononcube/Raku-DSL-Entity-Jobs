use DSL::Entity::Jobs::Grammar;
use DSL::Shared::Actions::English::WL::PipelineCommand;


class DSL::Entity::Jobs::Actions::WL::System
        is DSL::Shared::Actions::English::WL::PipelineCommand {

    has DSL::Entity::Jobs::ResourceAccess $.resources;

    ##========================================================
    ## Grammar methods
    ##========================================================

    method TOP($/) {
        make $/.values[0].made;
    }

    method job-entity-spec($/) {
        make $/.values[0].made;
    }

    method job-entity-spec-list($/) {
        make $<job-entity-spec>>>.made.join(', ');
    }

    method entity-job-title($/) {
        my $nm = $!resources.name-to-entity-id('Title', $/.Str.lc, :!warn);
        make '"' ~ $nm ~ '"';
    }

    method entity-job-skill($/) {
        my $nm = $!resources.name-to-entity-id('Skill', $/.Str.lc, :!warn);
        make '"' ~ $nm ~ '"';
    }

    method entity-job-title-start($/) {
        my $nm = $!resources.name-to-entity-id('Title', $/.Str.lc, :!warn);
        make '"' ~ $nm ~ '"';
    }
}
