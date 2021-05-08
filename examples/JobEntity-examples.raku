use lib './lib';
use lib '.';
use DSL::Entity::Jobs;

my $pCOMMAND = DSL::Entity::Jobs::Grammar;

#use Grammar::Tracer;

#my DSL::Entity::Jobs::ResourceAccess $resourceObj;
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
#say $pCOMMAND.parse('i want talent with .net framework, java and java archtect');
#
#say $pCOMMAND.subparse('i want talent with .net framework and java for the job software architect');


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
