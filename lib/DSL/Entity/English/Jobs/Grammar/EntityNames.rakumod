use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Entity::English::Jobs::ResourceAccess;

my DSL::Entity::English::Jobs::ResourceAccess $resources.instance;

role DSL::Entity::English::Jobs::Grammar::EntityNames
        does DSL::Shared::Roles::English::PipelineCommand {

    regex skill-name-part {
        [ <.alnum> | '-' | '.' | '+' | '#' ]* <.alnum> | <.alnum>
    }

    regex entity-job-title {
        ( <skill-name-part>+ % \h+ ) <?{ $resources.known-name('Title', $0.Str.lc) }>
    }

    regex entity-job-skill {
        ( <skill-name-part>+ % \h+ ) <?{ $resources.known-name('Skill', $0.Str.lc) }>
    }
}