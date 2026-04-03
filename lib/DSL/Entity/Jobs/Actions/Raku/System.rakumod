use v6;

use DSL::Entity::Foods::Grammar;
use DSL::Entity::Foods::ResourceAccess;
use DSL::Shared::Actions::English::Raku::PipelineCommand;
use DSL::Shared::Entity::Actions::Raku::System;


class DSL::Entity::Jobs::Actions::Raku::System
        is DSL::Entity::Jobs::Actions::WL::System
        is DSL::Shared::Entity::Actions::Raku::System
        is DSL::Shared::Actions::English::Raku::PipelineCommand {

    has DSL::Entity::Jobs::ResourceAccess $.resources;

    ##========================================================
    ## Grammar methods
    ##========================================================

    method TOP($/) {
        make DSL::Entity::Jobs::Actions::WL::System::TOP($/).made;
    }
}
