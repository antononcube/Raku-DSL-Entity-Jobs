use lib './lib';
use lib '.';
use DSL::Entity::Jobs;
use DSL::Entity::Jobs::Actions::WL::System;

my $pCOMMAND = DSL::Entity::Jobs::Grammar;

$pCOMMAND.set-resources(get-entity-resources-access-object());

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

say
        $pCOMMAND.parse(
                'software archtect, net framework, c, java',
                actions => DSL::Entity::Jobs::Actions::WL::System.new(resources => get-entity-resources-access-object())
                ).made;

say "Parsing time: { now - $tstart }";

$tstart = now;
say $pCOMMAND.parse('i want talent with .net framework, c++, java, and software architect');
say "Parsing time: {now - $tstart}";


say "=" x 60;

my @testCommands = (
'freelance web content writer',
'.net framework, java',
'.net framework, java, software architect',
'freelance web content writer, .net programmer',
'.net programmer and freelance web content writer',
'freelance web content writer and .net programmer'
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
