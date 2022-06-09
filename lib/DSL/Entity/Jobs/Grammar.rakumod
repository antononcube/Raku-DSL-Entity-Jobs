=begin comment
#==============================================================================
#
#   Job entities grammar in Raku
#   Copyright (C) 2021  Anton Antonov
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#   Written by Anton Antonov,
#   antononcube @ posteo . net,
#   Windermere, Florida, USA.
#
#==============================================================================
#
#   For more details about Raku see https://raku.org/ .
#
#==============================================================================
=end comment

use v6;

use DSL::Shared::Roles::PredicateSpecification;
use DSL::Shared::Roles::ErrorHandling;

use DSL::Entity::Jobs::Grammar::EntityNames;
use DSL::Entity::Jobs::ResourceAccess;

grammar DSL::Entity::Jobs::Grammar
        does DSL::Shared::Roles::ErrorHandling
        does DSL::Entity::Jobs::Grammar::EntityNames {

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

