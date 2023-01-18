#!/usr/bin/env perl6
use DSL::Entity::Jobs;

sub MAIN(Str $commands, Str $target = 'WL-System' ) {
    put ToJobEntityCode($commands, $target);
}