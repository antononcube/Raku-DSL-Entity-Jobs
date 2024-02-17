role DSL::Entity::Jobs::Grammar::EntityNames {

    regex entity-job-title {
        ( [ <.wbpl> <entity-name-part> <.wbpr> ]+ % \h+ ) <?{ self.get-resources().known-name('Title', $0.Str.lc) }>
    }

    regex entity-job-skill {
        ( [ <.wbpl> <entity-name-part> <.wbpr> ]+ % \h+ ) <?{ self.get-resources().known-name('Skill', $0.Str.lc) }>
    }
}