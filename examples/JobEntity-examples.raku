use lib './lib';
use lib '.';
use DSL::Entity::English::Jobs;

my $pCOMMAND = DSL::Entity::English::Jobs::Grammar;

#use Grammar::Tracer;

say $pCOMMAND.parse('freelance web content writer', rule => 'job-entity-command');

say $pCOMMAND.parse('perl programmer', rule => 'job-entity-command');

say $pCOMMAND.parse('director of contracts', rule => 'job-entity-command');

#
#say $pCOMMAND.parse('i want talent for java arhitect');

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
