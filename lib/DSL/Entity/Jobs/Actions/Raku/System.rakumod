use v6;

use DSL::Entity::Jobs::Actions::WL::System;
use DSL::Shared::Actions::English::Raku::PipelineCommand;

class DSL::Entity::Jobs::Actions::Raku::System
        is DSL::Entity::Jobs::Actions::WL::System
        is DSL::Shared::Actions::English::Raku::PipelineCommand {

    ##========================================================
    ## Grammar methods
    ##========================================================

#    method TOP($/) {
#        my $res = self.DSL::Entity::Jobs::Actions::WL::System::TOP($/);
#        make $res;
#    }
}
