use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;

#my Str $fileName = $*CWD.Str ~ '/resources/' ~ 'JobTitles.txt';
my $fileName = %?RESOURCES<JobTitles.txt>;

#say '?RESOURCES<JobTitles.txt> :', $fileName;

my Str @jobTitles = $fileName.lines;

#say @jobTitles[1 .. 12].join("; ");

my Set $knownJobTitles = Set(@jobTitles);

sub is-known-job-title( Str:D $phrase --> Bool:D ) {
    $phrase (elem) $knownJobTitles
}

role DSL::Entity::English::Jobs::Grammar::JobTitles
        does DSL::Shared::Roles::English::PipelineCommand {
    rule fast-job-title { <known-job-title> || <job-title> }
    regex known-job-title { ([ [\w]+ % \h+ ]+) <?{ is-known-job-title( $0.Str ) }>}
    #rule known-two-word-job-title { ([\w]+) ([\w]+) <?{ is-known-job-title( $0.Str ~ ' ' ~ $1.Str) }>}
    rule job-title {
        <adjunct-job-title>    |
        <android-job-title>    |
        <art-job-title>    |
        <aspnet-job-title>    |
        <assistante-job-title>    |
        <assistant-job-title>    |
        <associate-job-title>    |
        <backend-job-title>    |
        <cofounder-job-title>    |
        <consulente-job-title>    |
        <contract-job-title>    |
        <corporate-job-title>    |
        <creative-job-title>    |
        <director-job-title>    |
        <drupal-job-title>    |
        <ecommerce-job-title>    |
        <editor-job-title>    |
        <founder-job-title>    |
        <freelance-job-title>    |
        <freelancer-job-title>    |
        <frontend-job-title>    |
        <full-job-title>    |
        <graphic-job-title>    |
        <graphiste-job-title>    |
        <head-job-title>    |
        <high-job-title>    |
        <hs-job-title>    |
        <independent-job-title>    |
        <instructor-job-title>    |
        <interactive-job-title>    |
        <java-job-title>    |
        <javascript-job-title>    |
        <junior-job-title>    |
        <lead-job-title>    |
        <lecturer-job-title>    |
        <manager-job-title>    |
        <math-job-title>    |
        <mathematical-job-title>    |
        <mathematician-job-title>    |
        <mathematics-job-title>    |
        <maths-job-title>    |
        <middle-job-title>    |
        <net-job-title>    |
        <owner-job-title>    |
        <perl-job-title>    |
        <php-job-title>    |
        <private-job-title>    |
        <professor-job-title>    |
        <programmatore-job-title>    |
        <programmer-job-title>
    }
    regex adjunct-job-title {
        <adjunct-job-title-word> \h+ [<mathematics-job-title-word> \h+ <instructor-job-title-word> | <math-job-title-word> \h+ <instructor-job-title-word> | <professor-job-title-word> \h+ <of-job-title-word> \h+ <mathematics-job-title-word>]
    }
    regex android-job-title {
        <android-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex art-job-title {
        <art-job-title-word> \h+ <director-job-title-word> \h+ <web-job-title-word> \h+ <designer-job-title-word>
    }
    regex aspnet-job-title {
        <aspnet-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex assistante-job-title {
        <assistante-job-title-word> \h+ <webmarketing-job-title-word>
    }
    regex assistant-job-title {
        <assistant-job-title-word> \h+ [<professor-job-title-word> \h+ <of-job-title-word> \h+ <mathematics-job-title-word> | <web-job-title-word> \h+ [<designer-job-title-word> | <developer-job-title-word> | <editor-job-title-word>] | <webmaster-job-title-word>]
    }
    regex associate-job-title {
        <associate-job-title-word> \h+ [<professor-job-title-word> \h+ <of-job-title-word> \h+ <mathematics-job-title-word> | <web-job-title-word> \h+ [<developer-job-title-word> | <producer-job-title-word>]]
    }
    regex backend-job-title {
        <backend-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex cofounder-job-title {
        <cofounder-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex consulente-job-title {
        <consulente-job-title-word> \h+ <web-job-title-word> \h+ <marketing-job-title-word>
    }
    regex contract-job-title {
        <contract-job-title-word> \h+ <web-job-title-word> \h+ [<designer-job-title-word> | <developer-job-title-word>]
    }
    regex corporate-job-title {
        <corporate-job-title-word> \h+ <webmaster-job-title-word>
    }
    regex creative-job-title {
        <creative-job-title-word> \h+ <web-job-title-word> \h+ <designer-job-title-word>
    }
    regex director-job-title {
        <director-job-title-word> \h+ [<of-job-title-word> \h+ <web-job-title-word> \h+ [<development-job-title-word> | <services-job-title-word>] | <web-job-title-word> \h+ [<development-job-title-word> | <services-job-title-word>]]
    }
    regex drupal-job-title {
        <drupal-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex ecommerce-job-title {
        <ecommerce-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex editor-job-title {
        <editor-job-title-word> \h+ <web-job-title-word>
    }
    regex founder-job-title {
        <founder-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex freelance-job-title {
        <freelance-job-title-word> \h+ [<frontend-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word> | <graphic-job-title-word> \h+ <web-job-title-word> \h+ <designer-job-title-word> | <webandgraphic-job-title-word> \h+ <designer-job-title-word> | <web-job-title-word> \h+ [<content-job-title-word> \h+ <writer-job-title-word> | <design-job-title-word> | <designer-job-title-word> \h+ <developer-job-title-word> | <designeranddeveloper-job-title-word> | <developer-job-title-word> | <development-job-title-word> | <editor-job-title-word> | <producer-job-title-word>] | <website-job-title-word> \h+ <designer-job-title-word>]
    }
    regex freelancer-job-title {
        <freelancer-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex frontend-job-title {
        <frontend-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex full-job-title {
        <full-job-title-word> \h+ <stack-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex graphic-job-title {
        <graphic-job-title-word> \h+ [<and-job-title-word> \h+ <web-job-title-word> \h+ <designer-job-title-word> | <designer-job-title-word> \h+ <web-job-title-word> \h+ [<designer-job-title-word> | <developer-job-title-word>] | <web-job-title-word> \h+ [<design-job-title-word> \h+ <intern-job-title-word> | <designer-job-title-word>]]
    }
    regex graphiste-job-title {
        <graphiste-job-title-word> \h+ <web-job-title-word>
    }
    regex head-job-title {
        <head-job-title-word> \h+ <of-job-title-word> \h+ [<mathematics-job-title-word> \h+ <department-job-title-word> | <maths-job-title-word> | <web-job-title-word> \h+ <development-job-title-word>]
    }
    regex high-job-title {
        <high-job-title-word> \h+ <school-job-title-word> \h+ [<mathematics-job-title-word> \h+ <teacher-job-title-word> | <math-job-title-word> \h+ <teacher-job-title-word>]
    }
    regex hs-job-title {
        <hs-job-title-word> \h+ <math-job-title-word> \h+ <teacher-job-title-word>
    }
    regex independent-job-title {
        <independent-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex instructor-job-title {
        <instructor-job-title-word> \h+ <of-job-title-word> \h+ <mathematics-job-title-word>
    }
    regex interactive-job-title {
        <interactive-job-title-word> \h+ <web-job-title-word> \h+ [<designer-job-title-word> | <developer-job-title-word>]
    }
    regex java-job-title {
        <java-job-title-word> \h+ [<and-job-title-word> \h+ [<jee-job-title-word> \h+ <developer-job-title-word> | <web-job-title-word> \h+ <developer-job-title-word>] | <architect-job-title-word> | <backend-job-title-word> \h+ <developer-job-title-word> | <developer-job-title-word> \h+ [<contract-job-title-word> | <internship-job-title-word>] | <specialist-job-title-word> | <team-job-title-word> \h+ [<lead-job-title-word> | <leader-job-title-word>] | <tech-job-title-word> \h+ <lead-job-title-word> | <technical-job-title-word> \h+ <lead-job-title-word>]
    }
    regex javascript-job-title {
        <javascript-job-title-word> \h+ [<developer-job-title-word> | <engineer-job-title-word>]
    }
    regex junior-job-title {
        <junior-job-title-word> \h+ <web-job-title-word> \h+ [<designer-job-title-word> | <developer-job-title-word>]
    }
    regex lead-job-title {
        <lead-job-title-word> \h+ [<java-job-title-word> \h+ <developer-job-title-word> | <web-job-title-word> \h+ [<designer-job-title-word> | <developer-job-title-word>]]
    }
    regex lecturer-job-title {
        <lecturer-job-title-word> \h+ [<mathematics-job-title-word> | <of-job-title-word> \h+ <mathematics-job-title-word>]
    }
    regex manager-job-title {
        <manager-job-title-word> \h+ <of-job-title-word> \h+ <web-job-title-word> \h+ <development-job-title-word>
    }
    regex math-job-title {
        <math-job-title-word> \h+ [<and-job-title-word> \h+ <science-job-title-word> \h+ [<teacher-job-title-word> | <tutor-job-title-word>] | <chemistry-job-title-word> \h+ <tutor-job-title-word> | <coach-job-title-word> | <consultant-job-title-word> | <department-job-title-word> \h+ <chair-job-title-word> | <educator-job-title-word> | <english-job-title-word> \h+ <tutor-job-title-word> | <fellow-job-title-word> | <grader-job-title-word> | <instructional-job-title-word> \h+ <coach-job-title-word> | <instructor-job-title-word> | <interventionist-job-title-word> | <lab-job-title-word> \h+ <tutor-job-title-word> | <physics-job-title-word> \h+ [<teacher-job-title-word> | <tutor-job-title-word>] | <professor-job-title-word> | <reading-job-title-word> \h+ <tutor-job-title-word> | <science-job-title-word> \h+ [<teacher-job-title-word> | <tutor-job-title-word>] | <specialist-job-title-word> | <teacher-job-title-word> | <teacherandcoach-job-title-word> | <teaching-job-title-word> \h+ <assistant-job-title-word> | <tutor-job-title-word>]
    }
    regex mathematical-job-title {
        <mathematical-job-title-word> \h+ <statistician-job-title-word>
    }
    regex mathematician-job-title { <mathematician-job-title-word> }
    regex mathematics-job-title {
        <mathematics-job-title-word> \h+ [<coach-job-title-word> | <computer-job-title-word> \h+ <science-job-title-word> \h+ <teacher-job-title-word> | <consultant-job-title-word> | <coordinator-job-title-word> | <department-job-title-word> \h+ <chair-job-title-word> | <faculty-job-title-word> | <grader-job-title-word> | <instructor-job-title-word> | <physics-job-title-word> \h+ [<teacher-job-title-word> | <tutor-job-title-word>] | <science-job-title-word> \h+ [<teacher-job-title-word> | <tutor-job-title-word>] | <specialist-job-title-word> | <teacher-job-title-word> | <teaching-job-title-word> \h+ <assistant-job-title-word> | <tutor-job-title-word>]
    }
    regex maths-job-title {
        <maths-job-title-word> \h+ [<english-job-title-word> \h+ <tutor-job-title-word> | <faculty-job-title-word> | <lecturer-job-title-word> | <science-job-title-word> \h+ <teacher-job-title-word>]
    }
    regex middle-job-title {
        <middle-job-title-word> \h+ [<java-job-title-word> \h+ <developer-job-title-word> | <school-job-title-word> \h+ [<mathematics-job-title-word> \h+ <teacher-job-title-word> | <math-job-title-word> \h+ [<science-job-title-word> \h+ <teacher-job-title-word> | <teacher-job-title-word>]]]
    }
    regex net-job-title {
        <net-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex owner-job-title {
        <owner-job-title-word> \h+ [<and-job-title-word> \h+ [<web-job-title-word> \h+ [<designer-job-title-word> | <developer-job-title-word>] | <webmaster-job-title-word>] | <web-job-title-word> \h+ [<designer-job-title-word> | <developer-job-title-word>] | <webmaster-job-title-word>]
    }
    regex perl-job-title {
        <perl-job-title-word> \h+ [<developer-job-title-word> | <programmer-job-title-word>]
    }
    regex php-job-title {
        <php-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex private-job-title {
        <private-job-title-word> \h+ [<mathematics-job-title-word> \h+ <tutor-job-title-word> | <math-job-title-word> \h+ <tutor-job-title-word>]
    }
    regex professor-job-title {
        <professor-job-title-word> \h+ <of-job-title-word> \h+ <mathematics-job-title-word>
    }
    regex programmatore-job-title {
        <programmatore-job-title-word> \h+ <web-job-title-word>
    }
    regex programmer-job-title {
        <programmer-job-title-word> \h+ <and-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    token adjunct-job-title-word { 'adjunct' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'adjunct') }> }
    token and-job-title-word { 'and' }
    token android-job-title-word { 'android' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'android') }> }
    token architect-job-title-word { 'architect' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'architect') }> }
    token art-job-title-word { 'art' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'art') }> }
    token aspnet-job-title-word { 'aspnet' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'aspnet') }> }
    token assistant-job-title-word { 'assistant' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'assistant') }> }
    token assistante-job-title-word { 'assistante' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'assistante') }> }
    token associate-job-title-word { 'associate' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'associate') }> }
    token backend-job-title-word { 'backend' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'backend') }> }
    token chair-job-title-word { 'chair' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'chair') }> }
    token chemistry-job-title-word { 'chemistry' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'chemistry') }> }
    token coach-job-title-word { 'coach' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'coach') }> }
    token cofounder-job-title-word { 'cofounder' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'cofounder') }> }
    token computer-job-title-word { 'computer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'computer') }> }
    token consulente-job-title-word { 'consulente' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'consulente') }> }
    token consultant-job-title-word { 'consultant' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'consultant') }> }
    token content-job-title-word { 'content' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'content') }> }
    token contract-job-title-word { 'contract' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'contract') }> }
    token coordinator-job-title-word { 'coordinator' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'coordinator') }> }
    token corporate-job-title-word { 'corporate' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'corporate') }> }
    token creative-job-title-word { 'creative' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'creative') }> }
    token department-job-title-word { 'department' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'department') }> }
    token design-job-title-word { 'design' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'design') }> }
    token designer-job-title-word { 'designer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'designer') }> }
    token designeranddeveloper-job-title-word { 'designeranddeveloper' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'designeranddeveloper') }> }
    token developer-job-title-word { 'developer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'developer') }> }
    token development-job-title-word { 'development' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'development') }> }
    token director-job-title-word { 'director' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'director') }> }
    token drupal-job-title-word { 'drupal' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'drupal') }> }
    token ecommerce-job-title-word { 'ecommerce' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'ecommerce') }> }
    token editor-job-title-word { 'editor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'editor') }> }
    token educator-job-title-word { 'educator' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'educator') }> }
    token engineer-job-title-word { 'engineer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'engineer') }> }
    token english-job-title-word { 'english' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'english') }> }
    token faculty-job-title-word { 'faculty' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'faculty') }> }
    token fellow-job-title-word { 'fellow' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'fellow') }> }
    token founder-job-title-word { 'founder' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'founder') }> }
    token freelance-job-title-word { 'freelance' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'freelance') }> }
    token freelancer-job-title-word { 'freelancer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'freelancer') }> }
    token frontend-job-title-word { 'frontend' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'frontend') }> }
    token full-job-title-word { 'full' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'full') }> }
    token grader-job-title-word { 'grader' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'grader') }> }
    token graphic-job-title-word { 'graphic' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'graphic') }> }
    token graphiste-job-title-word { 'graphiste' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'graphiste') }> }
    token head-job-title-word { 'head' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'head') }> }
    token high-job-title-word { 'high' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'high') }> }
    token hs-job-title-word { 'hs' }
    token independent-job-title-word { 'independent' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'independent') }> }
    token instructional-job-title-word { 'instructional' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'instructional') }> }
    token instructor-job-title-word { 'instructor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'instructor') }> }
    token interactive-job-title-word { 'interactive' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'interactive') }> }
    token intern-job-title-word { 'intern' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'intern') }> }
    token internship-job-title-word { 'internship' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'internship') }> }
    token interventionist-job-title-word { 'interventionist' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'interventionist') }> }
    token java-job-title-word { 'java' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'java') }> }
    token javascript-job-title-word { 'javascript' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'javascript') }> }
    token jee-job-title-word { 'jee' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'jee') }> }
    token junior-job-title-word { 'junior' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'junior') }> }
    token lab-job-title-word { 'lab' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'lab') }> }
    token lead-job-title-word { 'lead' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'lead') }> }
    token leader-job-title-word { 'leader' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'leader') }> }
    token lecturer-job-title-word { 'lecturer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'lecturer') }> }
    token manager-job-title-word { 'manager' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'manager') }> }
    token marketing-job-title-word { 'marketing' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'marketing') }> }
    token math-job-title-word { 'math' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'math') }> }
    token mathematical-job-title-word { 'mathematical' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'mathematical') }> }
    token mathematician-job-title-word { 'mathematician' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'mathematician') }> }
    token mathematics-job-title-word { 'mathematics' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'mathematics') }> }
    token maths-job-title-word { 'maths' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'maths') }> }
    token middle-job-title-word { 'middle' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'middle') }> }
    token net-job-title-word { 'net' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'net') }> }
    token of-job-title-word { 'of' }
    token owner-job-title-word { 'owner' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'owner') }> }
    token perl-job-title-word { 'perl' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'perl') }> }
    token php-job-title-word { 'php' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'php') }> }
    token physics-job-title-word { 'physics' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'physics') }> }
    token private-job-title-word { 'private' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'private') }> }
    token producer-job-title-word { 'producer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'producer') }> }
    token professor-job-title-word { 'professor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'professor') }> }
    token programmatore-job-title-word { 'programmatore' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'programmatore') }> }
    token programmer-job-title-word { 'programmer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'programmer') }> }
    token reading-job-title-word { 'reading' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'reading') }> }
    token school-job-title-word { 'school' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'school') }> }
    token science-job-title-word { 'science' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'science') }> }
    token services-job-title-word { 'services' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'services') }> }
    token specialist-job-title-word { 'specialist' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'specialist') }> }
    token stack-job-title-word { 'stack' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'stack') }> }
    token statistician-job-title-word { 'statistician' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'statistician') }> }
    token teacher-job-title-word { 'teacher' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'teacher') }> }
    token teacherandcoach-job-title-word { 'teacherandcoach' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'teacherandcoach') }> }
    token teaching-job-title-word { 'teaching' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'teaching') }> }
    token team-job-title-word { 'team' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'team') }> }
    token tech-job-title-word { 'tech' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'tech') }> }
    token technical-job-title-word { 'technical' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'technical') }> }
    token tutor-job-title-word { 'tutor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'tutor') }> }
    token web-job-title-word { 'web' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'web') }> }
    token webandgraphic-job-title-word { 'webandgraphic' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webandgraphic') }> }
    token webmarketing-job-title-word { 'webmarketing' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webmarketing') }> }
    token webmaster-job-title-word { 'webmaster' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webmaster') }> }
    token website-job-title-word { 'website' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'website') }> }
    token writer-job-title-word { 'writer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'writer') }> }
}
