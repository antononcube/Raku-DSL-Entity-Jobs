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

use DSL::Entity::English::Jobs::Grammar::EntityNames;

grammar DSL::Entity::English::Jobs::Grammar
        does DSL::Shared::Roles::ErrorHandling
        does DSL::Entity::English::Jobs::Grammar::EntityNames {
    # TOP
    rule TOP {
        <pipeline-command> |
        <job-entity-spec-list> |
        <recommend-for-job-command> |
        <data-query-command>
    }

    regex job-entity-spec { <entity-job-title> | <entity-job-skill> }

    regex job-entity-spec-list { <job-entity-spec>+ % <.list-separator> }

    rule recommend-for-job-command { 'i' [ 'want' | 'am' 'interested' 'in']  [ 'talent' | 'recruits' | 'people'] [ <for-preposition> | <with-preposition> | 'that' 'fit'] <job-entity-spec-list> }

    rule data-query-command { [ 'how' 'many' | 'what' 'count' ] .'of' <job-entity-command> 'is' 'in' 'my' [ 'database' | 'catalog' ] }

}

