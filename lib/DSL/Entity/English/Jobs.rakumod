
=begin pod

=head1 DSL::Entity::English::Jobs

C<DSL::Entity::English::Jobs> package has grammar and action classes for the parsing and
interpretation of natural language commands that specify classification workflows.

=head1 Synopsis

    use DSL::Entity::English::Jobs;
    my $rcode = ToJobEntityCode('use dfTitanic; split data in training and testing parts with ratio 0.7; make a classifier; show roc curves');

=end pod

unit module DSL::Entity::English::Jobs;

use DSL::Shared::Utilities::MetaSpecsProcessing;

use DSL::Entity::English::Jobs::Grammar;
use DSL::Entity::English::Jobs::Actions::WL::System;

use DSL::Entity::English::Jobs::Actions::Bulgarian::Standard;

#-----------------------------------------------------------
my %targetToAction =
    "Mathematica"      => DSL::Entity::English::Jobs::Actions::WL::System,
    "WL"               => DSL::Entity::English::Jobs::Actions::WL::System,
    "WL-System"        => DSL::Entity::English::Jobs::Actions::WL::System,
    "Bulgarian"        => DSL::Entity::English::Jobs::Actions::Bulgarian::Standard;

my %targetToSeparator{Str} =
    "Julia"            => "\n",
    "Julia-DataFrames" => "\n",
    "R"                => " ;\n",
    "Mathematica"      => "\n",
    "WL"               => ";\n",
    "WL-ClCon"         => " ==>\n",
    "WL-System"        => ";\n",
    "Bulgarian"        => "\n";


#-----------------------------------------------------------
sub has-semicolon (Str $word) {
    return defined index $word, ';';
}

#-----------------------------------------------------------
proto ToJobEntityCode(Str $command, Str $target = 'tidyverse' ) is export {*}

multi ToJobEntityCode ( Str $command where not has-semicolon($command), Str $target = 'WL-ClCon' ) {

    die 'Unknown target.' unless %targetToAction{$target}:exists;

    my $match = DSL::Entity::English::Jobs::Grammar.parse($command.trim, actions => %targetToAction{$target} );
    die 'Cannot parse the given command.' unless $match;
    return $match.made;
}

multi ToJobEntityCode ( Str $command where has-semicolon($command), Str $target = 'WL-ClCon' ) {

    my $specTarget = get-dsl-spec( $command, 'target');

    $specTarget = $specTarget ?? $specTarget<DSLTARGET> !! $target;

    die 'Unknown target.' unless %targetToAction{$specTarget}:exists;

    my @commandLines = $command.trim.split(/ ';' \s* /);

    @commandLines = grep { $_.Str.chars > 0 }, @commandLines;

    my @cmdLines = map { ToJobEntityCode($_, $specTarget) }, @commandLines;

    @cmdLines = grep { $_.^name eq 'Str' }, @cmdLines;

    return @cmdLines.join( %targetToSeparator{$specTarget} ).trim;
}
