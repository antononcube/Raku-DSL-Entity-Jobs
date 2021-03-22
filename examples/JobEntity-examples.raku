use lib './lib';
use lib '.';
use DSL::Entity::English::Jobs;

my $pCOMMAND = DSL::Entity::English::Jobs::Grammar;

#use Grammar::Tracer;

say $pCOMMAND.parse('freelance web content writer', rule => 'job-entity-spec-list');

say $pCOMMAND.parse('perl programmer', rule => 'job-entity-spec-list');

say $pCOMMAND.parse('directr of contracts', rule => 'job-entity-spec-list');

say $pCOMMAND.parse('asp .net', rule => 'job-entity-spec-list');

#
say $pCOMMAND.parse('i want talent for java architect');

say $pCOMMAND.parse('i want talent with .net framework and java');

#say $pCOMMAND.subparse('i want talent with .net framework and java for the job software architect');

#
#say "=" x 60;
#
#
#my @testCommands = (
#''
#);
#
#
#my @targets = ('Bulgarian', 'WL-System');
#
#for @testCommands -> $c {
#    say "=" x 30;
#    say $c;
#    for @targets -> $t {
#        say '-' x 30;
#        say $t;
#        say '-' x 30;
#        my $start = now;
#        my $res = ToJobEntityCode($c, $t);
#        say "time:", now - $start;
#        say $res;
#    }
#}
