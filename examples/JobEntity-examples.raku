 # use lib <. lib>;
use DSL::Entity::Jobs;
use DSL::Entity::Jobs::Actions::WL::System;

my $pCOMMAND = DSL::Entity::Jobs::Grammar;

$pCOMMAND.set-resources(DSL::Entity::Jobs::resource-access-object());

my $ACTOBJ =  DSL::Entity::Jobs::Actions::WL::System.new(resources => DSL::Entity::Jobs::resource-access-object());

#say DSL::Entity::Jobs::resource-access-object().getNameToEntityID()<Skill>.values.pick(60).raku;
#say DSL::Entity::Jobs::resource-access-object().getNameToEntityID()<Title>.values.pick(60).raku;

#say DSL::Entity::Jobs::resource-access-object().getNameToEntityID()<Skill>{'net framework'};
#say DSL::Entity::Jobs::resource-access-object().getNameToEntityID()<Skill>{'Adxstudio for Microsoft'.lc};
#say DSL::Entity::Jobs::resource-access-object().getNameToEntityID()<Skill>.grep({ $_.key.contains( / ^ 'net' /) });

#say ToJobEntityCode('software architect');
#say ToJobEntityCode('gunner');

#use Grammar::Tracer;

#my Str $query = 'freelance web content writer';
#
#say $query, ':', $resourceObj.known-name('Title', $query.lc);

#say $pCOMMAND.parse('freelance web content writer', rule => 'job-entity-spec-list');
#
#say $pCOMMAND.parse('perl programmer', rule => 'job-entity-spec-list');
#
#say $pCOMMAND.parse('directr of contracts', rule => 'job-entity-spec-list');
#
#say $pCOMMAND.parse('asp .net', rule => 'job-entity-spec-list');
#
#say $pCOMMAND.parse('i want talent for java architect');
#
#
#say $pCOMMAND.subparse('i want talent with .net framework and java for the job software architect');

my $tstart = now;
say $pCOMMAND.parse('i want talent with software architect, .net framework, c, and java');
say "Parsing time: { now - $tstart }";

$tstart = now;

say $pCOMMAND.subparse('software archtect, net framework, c, java');

#my $entlist = '3, 4, and 5 stopcock manifolds, net framework, c, java';
#my $entlist = 'internal logistics project engineer';
my $entlist = 'supply chain process';
say "Parsing of '$entlist' : ",
        $pCOMMAND.subparse(
                $entlist,
                actions => DSL::Entity::Jobs::Actions::WL::System.new(resources => DSL::Entity::Jobs::resource-access-object())
                ).made;

say "Parsing time: { now - $tstart }";

$tstart = now;
say $pCOMMAND.parse('i want talent with .net framework, c++, java, and software architect');
say "Parsing time: {now - $tstart}";


say "=" x 60;

my @testCommands = (
#'freelance web content writer',
#'.net framework, java',
#'.net framework, java, software architect',
#'freelance web content writer, .net programmer',
#'.net programmer and freelance web content writer',
'freelance and .net programmer'
);

my @targets = ('WL-System');

for @testCommands -> $c {
    say "=" x 30;
    say $c;
    for @targets -> $t {
        say '-' x 30;
        say $t;
        say '-' x 30;
        my $start = now;
        my $res = ToJobEntityCode($c, $t);
        say "time:", now - $start;
        say $res;
    }
}
