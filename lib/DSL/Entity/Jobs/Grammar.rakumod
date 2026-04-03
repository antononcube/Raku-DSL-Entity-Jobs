use DSL::Shared::Roles::PredicateSpecification;
use DSL::Shared::Roles::ErrorHandling;

use DSL::Entity::Jobs::Grammar::EntityNames;
use DSL::Entity::Jobs::ResourceAccess;

use DSL::Shared::Entity::Grammar::EntityNames;
use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;

grammar DSL::Entity::Jobs::Grammar
        does DSL::Entity::Jobs::Grammar::EntityNames
        does DSL::Shared::Entity::Grammar::EntityNames
        does DSL::Shared::Roles::English::PipelineCommand
        does DSL::Shared::Roles::ErrorHandling {

    my DSL::Entity::Jobs::ResourceAccess $resources;

    method get-resources(--> DSL::Entity::Jobs::ResourceAccess) { return $resources; }
    method set-resources(DSL::Entity::Jobs::ResourceAccess $obj) { $resources = $obj; }

    # TOP
    regex TOP {
        <pipeline-command> |
        <job-entity-spec-list> |
        <recommend-for-job-command> |
        <data-query-command>
    }

    regex job-entity-spec { <entity-job-title> | <entity-job-skill> }

    regex job-entity-spec-list { <job-entity-spec>+ % <.list-separator> }

    regex recommend-for-job-command { 'i' \h+ [ 'want' | 'am' \h+ 'interested' \h+ 'in'] \h+  [ 'talent' | 'recruitas' | 'people'] \h+ [ <for-preposition> | <with-preposition> | 'that' \h+  'fit'] \h+  <job-entity-spec-list> }

    regex data-query-command { [ 'how' \h+ 'many' | 'what' \h+ 'count' ] \h+ .'of' \h+ <job-entity-command> \h+ 'is' \h+  'in' \h+  'my' \h+ [ 'database' | 'catalog' ] }

}

