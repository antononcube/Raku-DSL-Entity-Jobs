
=begin pod

=head1 DSL::Entity::Jobs

C<DSL::Entity::Jobs> package has grammar and action classes for the parsing and
interpretation of natural language commands that specify classification workflows.

=head1 Synopsis

    use DSL::Entity::Jobs;
    my $rcode = ToJobEntityCode('use dfTitanic; split data in training and testing parts with ratio 0.7; make a classifier; show roc curves');

=end pod

unit module DSL::Entity::Jobs;

use DSL::Shared::Utilities::CommandProcessing;

use DSL::Entity::Jobs::Grammar;
use DSL::Entity::Jobs::Actions::WL::System;

use DSL::Entity::Jobs::Actions::Bulgarian::Standard;

#-----------------------------------------------------------
#| Target to actions rules
my %targetToAction{Str} =
    "Mathematica"      => DSL::Entity::Jobs::Actions::WL::System,
    "WL"               => DSL::Entity::Jobs::Actions::WL::System,
    "WL-System"        => DSL::Entity::Jobs::Actions::WL::System,
    "Bulgarian"        => DSL::Entity::Jobs::Actions::Bulgarian::Standard;

my %targetToAction2{Str} = %targetToAction.grep({ $_.key.contains('-') }).map({ $_.key.subst('-', '::').Str => $_.value }).Hash;
%targetToAction = |%targetToAction , |%targetToAction2;

#| Target to separators rules
my Str %targetToSeparator{Str} = DSL::Shared::Utilities::CommandProcessing::target-separator-rules();

#-----------------------------------------------------------
my DSL::Entity::Jobs::ResourceAccess $resourceObj;

#| Get the resources access object.
our sub resource-access-object(--> DSL::Entity::Jobs::ResourceAccess) { return $resourceObj; }

#-----------------------------------------------------------
#| Named entity recognition for jobs. (proto)
proto ToJobEntityCode(Str $command, Str $target = 'WL-System', | ) is export {*}

#| Named entity recognition for jobs.
multi ToJobEntityCode( Str $command, Str $target = 'WL-System', *%args ) {

    my $pCOMMAND = DSL::Entity::Jobs::Grammar;
    $pCOMMAND.set-resources(DSL::Entity::Jobs::resource-access-object());

    my $ACTOBJ = %targetToAction{$target}.new(resources => DSL::Entity::Jobs::resource-access-object());

    DSL::Shared::Utilities::CommandProcessing::ToWorkflowCode( $command,
                                                               grammar => $pCOMMAND,
                                                               actions => $ACTOBJ,
                                                               separator => %targetToSeparator{$target},
                                                               |%args )
}

#-----------------------------------------------------------
$resourceObj := BEGIN {
    my DSL::Entity::Jobs::ResourceAccess $obj .= new;
    $obj.ingest-resource-files();
    $obj
}