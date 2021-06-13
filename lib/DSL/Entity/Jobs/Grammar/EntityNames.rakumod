use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Entity::Jobs::ResourceAccess;

my DSL::Entity::Jobs::ResourceAccess $resources.instance;

role DSL::Entity::Jobs::Grammar::EntityNames
        does DSL::Shared::Roles::English::PipelineCommand {

    token name-punct-char { '-' | '.' | '+' | '#' }

    regex entity-name-part {
        [ <.alnum> | <.name-punct-char> ]+ | <.alnum>
    }

    regex wbpl { <!after [ <alnum> | <name-punct-char> ]> <?before [ <alnum> | <name-punct-char> ]> }

    regex wbpr { <?after [ <alnum> | <name-punct-char> ]> <!before [ <alnum> | <name-punct-char> ]> }

    regex entity-job-title {
        ( [ <.wbpl> <entity-name-part> <.wbpr> ]+ % \h+ ) <?{ $resources.known-name('Title', $0.Str.lc) }>
    }

    regex entity-job-skill {
        ( [ <.wbpl> <entity-name-part> <.wbpr> ]+ % \h+ ) <?{ $resources.known-name('Skill', $0.Str.lc) }>
    }
}