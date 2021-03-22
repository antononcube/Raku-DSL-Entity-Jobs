use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Entity::English::Jobs::ResourceAccess;

my DSL::Entity::English::Jobs::ResourceAccess $resources.instance;

role DSL::Entity::English::Jobs::Grammar::EntityNames
        does DSL::Shared::Roles::English::PipelineCommand {

    regex entity-job-title {
        ( <word-value>+ % \h+ ) <?{ $resources.known-name('JobTitles', $0.Str.lc) }>
    }

    regex skill-name-part { [ <.alnum> | '-' | '.' ]* <.alnum> | <.alnum> }
    regex entity-job-skill {
        ( <skill-name-part>+ % \h+ ) <?{ $resources.known-name('JobSkills', $0.Str.lc) }>
    }
}