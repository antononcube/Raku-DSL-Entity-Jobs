#!/usr/bin/env perl6
use DSL::Entity::English::Jobs;

sub MAIN(Str $commands, Str $target = 'WL-ClCon' ) {
    put ToJobEntityCode($commands, $target);
}