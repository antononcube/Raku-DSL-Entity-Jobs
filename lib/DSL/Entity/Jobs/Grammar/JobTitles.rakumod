
##===========================================================
## Not used -- kept as an example alternative implementation.
##===========================================================

use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;

my $fileName = %?RESOURCES<JobTitles.txt>;

my Str @jobTitles = $fileName.lines;

my Set $knownJobTitles = Set(@jobTitles);
my Set $knownJobTitleWords = Set(@jobTitles.map({ $_.split(/\h+/) }).flat);

sub known-job-title-word (Str:D $word, Bool :$bool = True, Bool :$warn = True) {
    known-string($knownJobTitleWords, $word, :$bool, :$warn)
}

sub known-job-title(Str:D $phrase, Bool :$bool = True, Bool :$warn = True) {
    known-phrase( $knownJobTitles, $knownJobTitleWords, $phrase, :$bool, :$warn )
}

role DSL::Entity::Jobs::Grammar::JobTitles
        does DSL::Shared::Roles::English::PipelineCommand {
    rule job-title-faster-match {
        <job-title-known>
    }
    rule job-title-known {
        ([[\w]+ ]+) <?{ known-job-title($0.Str) }>
    }

    rule job-title {
        <adjunct-job-title>    |
        <administrador-job-title>    |
        <analista-job-title>    |
        <android-job-title>    |
        <art-job-title>    |
        <aspnet-job-title>    |
        <assistant-job-title>    |
        <assistante-job-title>    |
        <associate-job-title>    |
        <backend-job-title>    |
        <chef-job-title>    |
        <cofounder-job-title>    |
        <concepteur-job-title>    |
        <consulente-job-title>    |
        <consultor-job-title>    |
        <contract-job-title>    |
        <corporate-job-title>    |
        <creative-job-title>    |
        <desarrolladora-job-title>    |
        <desarrollador-job-title>    |
        <desarrollo-job-title>    |
        <desenvolvedora-job-title>    |
        <desenvolvedor-job-title>    |
        <developpeur-job-title>    |
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
        <journaliste-job-title>    |
        <junior-job-title>    |
        <lead-job-title>    |
        <lecturer-job-title>    |
        <manager-job-title>    |
        <maquetador-job-title>    |
        <math-job-title>    |
        <mathematical-job-title>    |
        <mathematician-job-title>    |
        <mathematics-job-title>    |
        <maths-job-title>    |
        <middle-job-title>    |
        <net-job-title>    |
        <owner-job-title>    |
        <periodista-job-title>    |
        <perl-job-title>    |
        <php-job-title>    |
        <private-job-title>    |
        <professor-job-title>    |
        <programadora-job-title>    |
        <programador-job-title>    |
        <programista-job-title>    |
        <programmatore-job-title>    |
        <programmer-job-title>    |
        <programmeur-job-title>    |
        <redactora-job-title>    |
        <redactor-job-title>    |
        <responsable-job-title>    |
        <science-job-title>    |
        <secondary-job-title>    |
        <senior-job-title>    |
        <software-job-title>    |
        <stagiaire-job-title>    |
        <sviluppatore-job-title>    |
        <teacher-job-title>    |
        <tgt-job-title>    |
        <web-job-title>    |
        <webandgraphic-job-title>    |
        <webandgraphics-job-title>    |
        <webandmobile-job-title>    |
        <webandsoftware-job-title>    |
        <webandui-job-title>    |
        <webansvarlig-job-title>    |
        <webbansvarig-job-title>    |
        <webbutvecklare-job-title>    |
        <webdeveloper-job-title>    |
        <webeditor-job-title>    |
        <webentwickler-job-title>    |
        <weblogic-job-title>    |
        <webmarketeur-job-title>    |
        <webmaster-job-title>    |
        <webmestre-job-title>    |
        <webmethods-job-title>    |
        <webredacteur-job-title>    |
        <webshop-job-title>    |
        <website-job-title>    |
        <websphere-job-title>    |
        <webudvikler-job-title>    |
        <webutvikler-job-title>
    }
    regex adjunct-job-title {
        <adjunct-job-title-word> \h+ [<mathematics-job-title-word> \h+ <instructor-job-title-word> | <math-job-title-word> \h+ <instructor-job-title-word> | <professor-job-title-word> \h+ <of-job-title-word> \h+ <mathematics-job-title-word>]
    }
    regex administrador-job-title {
        <administrador-job-title-word> \h+ <web-job-title-word>
    }
    regex analista-job-title {
        <analista-job-title-word> \h+ [<desarrollador-job-title-word> \h+ <java-job-title-word> | <desenvolvedor-job-title-word> \h+ [<java-job-title-word> | <web-job-title-word>] | <de-job-title-word> \h+ <sistemas-job-title-word> \h+ [<java-job-title-word> | <web-job-title-word>] | <java-job-title-word> | <programador-job-title-word> \h+ [<java-job-title-word> | <web-job-title-word>] | <programmatore-job-title-word> \h+ <java-job-title-word> | <web-job-title-word>]
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
    regex assistant-job-title {
        <assistant-job-title-word> \h+ [<chef-job-title-word> \h+ <de-job-title-word> \h+ <projet-job-title-word> \h+ <web-job-title-word> | <professor-job-title-word> \h+ <of-job-title-word> \h+ <mathematics-job-title-word> | <web-job-title-word> \h+ [<designer-job-title-word> | <developer-job-title-word> | <editor-job-title-word>] | <webmaster-job-title-word>]
    }
    regex assistante-job-title {
        <assistante-job-title-word> \h+ <chef-job-title-word> \h+ <de-job-title-word> \h+ <projet-job-title-word> \h+ <web-job-title-word>
    }
    regex associate-job-title {
        <associate-job-title-word> \h+ [<java-job-title-word> \h+ <developer-job-title-word> | <professor-job-title-word> \h+ <of-job-title-word> \h+ <mathematics-job-title-word> | <web-job-title-word> \h+ [<developer-job-title-word> | <producer-job-title-word>]]
    }
    regex backend-job-title {
        <backend-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex chef-job-title {
        <chef-job-title-word> \h+ <de-job-title-word> \h+ [<projets-job-title-word> \h+ <web-job-title-word> | <projet-job-title-word> \h+ [<web-job-title-word> \h+ <junior-job-title-word> | <webmarketing-job-title-word>]]
    }
    regex cofounder-job-title {
        <cofounder-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex concepteur-job-title {
        <concepteur-job-title-word> \h+ <web-job-title-word>
    }
    regex consulente-job-title {
        <consulente-job-title-word> \h+ <web-job-title-word> \h+ <marketing-job-title-word>
    }
    regex consultor-job-title {
        <consultor-job-title-word> \h+ [<java-job-title-word> | <web-job-title-word>]
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
    regex desarrolladora-job-title {
        <desarrolladora-job-title-word> \h+ <web-job-title-word>
    }
    regex desarrollador-job-title {
        <desarrollador-job-title-word> \h+ [<de-job-title-word> \h+ <aplicaciones-job-title-word> \h+ <web-job-title-word> | <java-job-title-word> \h+ <senior-job-title-word> | <web-job-title-word>]
    }
    regex desarrollo-job-title {
        <desarrollo-job-title-word> \h+ <web-job-title-word>
    }
    regex desenvolvedora-job-title {
        <desenvolvedora-job-title-word> \h+ <web-job-title-word>
    }
    regex desenvolvedor-job-title {
        <desenvolvedor-job-title-word> \h+ [<java-job-title-word> \h+ [<pleno-job-title-word> | <web-job-title-word>] | <web-job-title-word>]
    }
    regex developpeur-job-title {
        <developpeur-job-title-word> \h+ [<java-job-title-word> | <web-job-title-word>]
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
        <freelance-job-title-word> \h+ [<frontend-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word> | <graphic-job-title-word> \h+ <web-job-title-word> \h+ <designer-job-title-word> | <java-job-title-word> \h+ <developer-job-title-word> | <webandgraphic-job-title-word> \h+ <designer-job-title-word> | <web-job-title-word> \h+ [<content-job-title-word> \h+ <writer-job-title-word> | <design-job-title-word> | <designer-job-title-word> \h+ <developer-job-title-word> | <designeranddeveloper-job-title-word> | <developer-job-title-word> | <development-job-title-word> | <editor-job-title-word> | <producer-job-title-word>] | <website-job-title-word> \h+ <designer-job-title-word>]
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
        <java-job-title-word> \h+ [<analyst-job-title-word> | <and-job-title-word> \h+ [<jee-job-title-word> \h+ <developer-job-title-word> | <web-job-title-word> \h+ <developer-job-title-word>] | <android-job-title-word> \h+ <developer-job-title-word> | <application-job-title-word> \h+ <developer-job-title-word> | <architect-job-title-word> | <backend-job-title-word> \h+ <developer-job-title-word> | <consultant-job-title-word> | <contractor-job-title-word> | <developer-job-title-word> \h+ [<consultant-job-title-word> | <contract-job-title-word> | <contractor-job-title-word> | <intern-job-title-word> | <internship-job-title-word> | <trainee-job-title-word>] | <engineer-job-title-word> | <instructor-job-title-word> | <intern-job-title-word> | <programmer-job-title-word> \h+ <analyst-job-title-word> | <software-job-title-word> \h+ [<developer-job-title-word> | <engineer-job-title-word>] | <specialist-job-title-word> | <team-job-title-word> \h+ [<lead-job-title-word> | <leader-job-title-word>] | <tech-job-title-word> \h+ <lead-job-title-word> | <technical-job-title-word> \h+ <lead-job-title-word> | <trainee-job-title-word> | <trainer-job-title-word> | <tutor-job-title-word> | <web-job-title-word> \h+ <developer-job-title-word>]
    }
    regex javascript-job-title {
        <javascript-job-title-word> \h+ [<developer-job-title-word> | <engineer-job-title-word>]
    }
    regex journaliste-job-title {
        <journaliste-job-title-word> \h+ <web-job-title-word>
    }
    regex junior-job-title {
        <junior-job-title-word> \h+ [<java-job-title-word> \h+ [<developer-job-title-word> | <programmer-job-title-word>] | <web-job-title-word> \h+ [<designer-job-title-word> | <developer-job-title-word>]]
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
    regex maquetador-job-title {
        <maquetador-job-title-word> \h+ <web-job-title-word>
    }
    regex math-job-title {
        <math-job-title-word> \h+ [<and-job-title-word> \h+ <science-job-title-word> \h+ [<teacher-job-title-word> | <tutor-job-title-word>] | <chemistry-job-title-word> \h+ <tutor-job-title-word> | <coach-job-title-word> | <consultant-job-title-word> | <department-job-title-word> \h+ <chair-job-title-word> | <educator-job-title-word> | <english-job-title-word> \h+ <tutor-job-title-word> | <fellow-job-title-word> | <grader-job-title-word> | <instructional-job-title-word> \h+ <coach-job-title-word> | <instructor-job-title-word> | <interventionist-job-title-word> | <lab-job-title-word> \h+ <tutor-job-title-word> | <physics-job-title-word> \h+ [<teacher-job-title-word> | <tutor-job-title-word>] | <professor-job-title-word> | <reading-job-title-word> \h+ <tutor-job-title-word> | <science-job-title-word> \h+ [<teacher-job-title-word> | <tutor-job-title-word>] | <specialist-job-title-word> | <teacher-job-title-word> | <teacherandcoach-job-title-word> | <teaching-job-title-word> \h+ <assistant-job-title-word> | <tutor-job-title-word>]
    }
    regex mathematical-job-title {
        <mathematical-job-title-word> \h+ <statistician-job-title-word>
    }
    regex mathematician-job-title { <mathematician-job-title-word> }
    regex mathematics-job-title {
        <mathematics-job-title-word> \h+ [<coach-job-title-word> | <computer-job-title-word> \h+ <science-job-title-word> \h+ <teacher-job-title-word> | <consultant-job-title-word> | <coordinator-job-title-word> | <department-job-title-word> \h+ <chair-job-title-word> | <educator-job-title-word> | <faculty-job-title-word> | <grader-job-title-word> | <instructor-job-title-word> | <physics-job-title-word> \h+ [<teacher-job-title-word> | <tutor-job-title-word>] | <professor-job-title-word> | <science-job-title-word> \h+ [<teacher-job-title-word> | <tutor-job-title-word>] | <specialist-job-title-word> | <teacher-job-title-word> | <teaching-job-title-word> \h+ <assistant-job-title-word> | <tutor-job-title-word>]
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
    regex periodista-job-title {
        <periodista-job-title-word> \h+ <web-job-title-word>
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
    regex programadora-job-title {
        <programadora-job-title-word> \h+ <web-job-title-word>
    }
    regex programador-job-title {
        <programador-job-title-word> \h+ [<java-job-title-word> \h+ [<junior-job-title-word> | <pleno-job-title-word>] | <web-job-title-word>]
    }
    regex programista-job-title {
        <programista-job-title-word> \h+ <java-job-title-word>
    }
    regex programmatore-job-title {
        <programmatore-job-title-word> \h+ [<java-job-title-word> | <web-job-title-word>]
    }
    regex programmer-job-title {
        <programmer-job-title-word> \h+ <and-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word>
    }
    regex programmeur-job-title {
        <programmeur-job-title-word> \h+ <web-job-title-word>
    }
    regex redactora-job-title {
        <redactora-job-title-word> \h+ <web-job-title-word>
    }
    regex redactor-job-title {
        <redactor-job-title-word> \h+ <web-job-title-word>
    }
    regex responsable-job-title {
        <responsable-job-title-word> \h+ <web-job-title-word>
    }
    regex science-job-title {
        <science-job-title-word> \h+ <and-job-title-word> \h+ <math-job-title-word> \h+ <teacher-job-title-word>
    }
    regex secondary-job-title {
        <secondary-job-title-word> \h+ [<mathematics-job-title-word> \h+ <teacher-job-title-word> | <math-job-title-word> \h+ <teacher-job-title-word>]
    }
    regex senior-job-title {
        <senior-job-title-word> \h+ [<frontend-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word> | <graphic-job-title-word> \h+ <web-job-title-word> \h+ <designer-job-title-word> | <java-job-title-word> \h+ [<architect-job-title-word> | <consultant-job-title-word> | <developer-job-title-word> | <engineer-job-title-word> | <programmer-job-title-word> | <software-job-title-word> \h+ <engineer-job-title-word>] | <javascript-job-title-word> \h+ <developer-job-title-word> | <net-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word> | <php-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word> | <web-job-title-word> \h+ [<analyst-job-title-word> | <applications-job-title-word> \h+ <developer-job-title-word> | <architect-job-title-word> | <consultant-job-title-word> | <designer-job-title-word> \h+ <developer-job-title-word> | <developer-job-title-word> | <editor-job-title-word> | <engineer-job-title-word> | <producer-job-title-word> | <programmer-job-title-word>] | <webandgraphic-job-title-word> \h+ <designer-job-title-word>]
    }
    regex software-job-title {
        <software-job-title-word> \h+ [<and-job-title-word> \h+ <web-job-title-word> \h+ <developer-job-title-word> | <engineer-job-title-word> \h+ [<java-job-title-word> \h+ <developer-job-title-word> | <web-job-title-word> \h+ <developer-job-title-word>]]
    }
    regex stagiaire-job-title {
        <stagiaire-job-title-word> \h+ <web-job-title-word>
    }
    regex sviluppatore-job-title {
        <sviluppatore-job-title-word> \h+ [<java-job-title-word> | <web-job-title-word>]
    }
    regex teacher-job-title {
        <teacher-job-title-word> \h+ <of-job-title-word> \h+ [<mathematics-job-title-word> | <maths-job-title-word>]
    }
    regex tgt-job-title {
        <tgt-job-title-word> \h+ <maths-job-title-word>
    }
    regex web-job-title {
        <web-job-title-word> \h+ [<administrator-job-title-word> | <advisor-job-title-word> | <analyst-job-title-word> | <analytics-job-title-word> \h+ [<consultant-job-title-word> | <manager-job-title-word>] | <app-job-title-word> \h+ <developer-job-title-word> | <application-job-title-word> \h+ [<architect-job-title-word> | <developer-job-title-word> \h+ <intern-job-title-word> | <development-job-title-word> | <engineer-job-title-word> | <programmer-job-title-word>] | <applications-job-title-word> \h+ [<engineer-job-title-word> | <manager-job-title-word>] | <art-job-title-word> \h+ <director-job-title-word> | <associate-job-title-word> | <author-job-title-word> | <builder-job-title-word> | <communications-job-title-word> \h+ [<manager-job-title-word> | <specialist-job-title-word>] | <content-job-title-word> \h+ [<administrator-job-title-word> | <analyst-job-title-word> | <assistant-job-title-word> | <coordinator-job-title-word> | <editor-job-title-word> | <intern-job-title-word> | <officer-job-title-word> | <writer-job-title-word>] | <copywriter-job-title-word> | <database-job-title-word> \h+ <developer-job-title-word> | <desginer-job-title-word> | <design-job-title-word> \h+ [<assistant-job-title-word> | <consultant-job-title-word> | <developer-job-title-word> | <instructor-job-title-word> | <intern-job-title-word> | <manager-job-title-word> | <specialist-job-title-word>] | <designer-job-title-word> \h+ [<administrator-job-title-word> | <developer-job-title-word> | <freelance-job-title-word> | <frontend-job-title-word> \h+ <developer-job-title-word> | <intern-job-title-word> | <internship-job-title-word> | <pleno-job-title-word> | <programmer-job-title-word> | <trainee-job-title-word> | <web-job-title-word> \h+ <developer-job-title-word> | <webmaster-job-title-word>] | <designeranddeveloper-job-title-word> | <designerandgraphic-job-title-word> \h+ <designer-job-title-word> | <designerandprogrammer-job-title-word> | <designing-job-title-word> | <desinger-job-title-word> | <developer-job-title-word> \h+ [<administrator-job-title-word> | <analyst-job-title-word> | <consultant-job-title-word> | <contractor-job-title-word> | <coop-job-title-word> | <intern-job-title-word> | <internship-job-title-word> | <programmer-job-title-word> | <project-job-title-word> \h+ <manager-job-title-word> | <system-job-title-word> \h+ <administrator-job-title-word> | <systems-job-title-word> \h+ <administrator-job-title-word> | <trainee-job-title-word> | <webmaster-job-title-word>] | <developerandanalyst-job-title-word> | <developerandgraphic-job-title-word> \h+ <designer-job-title-word> | <developerandprogrammer-job-title-word> | <development-job-title-word> \h+ [<assistant-job-title-word> | <consultant-job-title-word> | <contractor-job-title-word> | <coordinator-job-title-word> | <engineer-job-title-word> | <immersive-job-title-word> \h+ <student-job-title-word> | <intern-job-title-word> | <lead-job-title-word> | <officer-job-title-word> | <project-job-title-word> \h+ <manager-job-title-word> | <student-job-title-word> | <team-job-title-word> \h+ [<lead-job-title-word> | <leader-job-title-word>]] | <director-job-title-word> | <editor-job-title-word> | <editorial-job-title-word> \h+ <intern-job-title-word> | <graphics-job-title-word> \h+ <designer-job-title-word> | <integrator-job-title-word> | <journalist-job-title-word> | <marketer-job-title-word> | <marketing-job-title-word> \h+ [<analyst-job-title-word> | <consultant-job-title-word> | <coordinator-job-title-word> | <executive-job-title-word> | <intern-job-title-word> | <specialist-job-title-word>] | <merchandiser-job-title-word> | <mobile-job-title-word> \h+ [<application-job-title-word> \h+ <developer-job-title-word> | <developer-job-title-word>] | <multimedia-job-title-word> \h+ [<designer-job-title-word> | <developer-job-title-word>] | <officer-job-title-word> | <operations-job-title-word> \h+ <manager-job-title-word> | <print-job-title-word> \h+ <designer-job-title-word> | <producer-job-title-word> | <production-job-title-word> \h+ [<artist-job-title-word> | <assistant-job-title-word> | <manager-job-title-word> | <specialist-job-title-word>] | <product-job-title-word> \h+ <manager-job-title-word> | <programmer-job-title-word> \h+ <analyst-job-title-word> | <programming-job-title-word> | <project-job-title-word> \h+ [<coordinator-job-title-word> | <manager-job-title-word>] | <projects-job-title-word> \h+ <manager-job-title-word> | <publisher-job-title-word> | <reporter-job-title-word> | <research-job-title-word> \h+ <analyst-job-title-word> | <researcher-job-title-word> | <sales-job-title-word> \h+ <manager-job-title-word> | <services-job-title-word> \h+ [<developer-job-title-word> | <manager-job-title-word>] | <social-job-title-word> \h+ <media-job-title-word> \h+ <manager-job-title-word> | <software-job-title-word> \h+ <engineer-job-title-word> | <specialist-job-title-word> | <strategist-job-title-word> | <support-job-title-word> \h+ [<analyst-job-title-word> | <specialist-job-title-word>] | <systems-job-title-word> \h+ [<administrator-job-title-word> | <analyst-job-title-word> | <developer-job-title-word> | <engineer-job-title-word>] | <team-job-title-word> \h+ [<lead-job-title-word> | <leader-job-title-word>] | <technician-job-title-word> | <technologist-job-title-word> | <tester-job-title-word> | <user-job-title-word> \h+ <interface-job-title-word> \h+ [<designer-job-title-word> | <developer-job-title-word>] | <writer-job-title-word>]
    }
    regex webandgraphic-job-title {
        <webandgraphic-job-title-word> \h+ <designer-job-title-word>
    }
    regex webandgraphics-job-title {
        <webandgraphics-job-title-word> \h+ <designer-job-title-word>
    }
    regex webandmobile-job-title {
        <webandmobile-job-title-word> \h+ <developer-job-title-word>
    }
    regex webandsoftware-job-title {
        <webandsoftware-job-title-word> \h+ <developer-job-title-word>
    }
    regex webandui-job-title {
        <webandui-job-title-word> \h+ <designer-job-title-word>
    }
    regex webansvarlig-job-title { <webansvarlig-job-title-word> }
    regex webbansvarig-job-title { <webbansvarig-job-title-word> }
    regex webbutvecklare-job-title { <webbutvecklare-job-title-word> }
    regex webdeveloper-job-title { <webdeveloper-job-title-word> }
    regex webeditor-job-title { <webeditor-job-title-word> }
    regex webentwickler-job-title { <webentwickler-job-title-word> }
    regex weblogic-job-title {
        <weblogic-job-title-word> \h+ <administrator-job-title-word>
    }
    regex webmarketeur-job-title { <webmarketeur-job-title-word> }
    regex webmaster-job-title {
        <webmaster-job-title-word> \h+ [<designer-job-title-word> | <developer-job-title-word> | <freelance-job-title-word> | <graphic-job-title-word> \h+ <designer-job-title-word> | <webdesigner-job-title-word>]
    }
    regex webmestre-job-title { <webmestre-job-title-word> }
    regex webmethods-job-title {
        <webmethods-job-title-word> \h+ [<consultant-job-title-word> | <developer-job-title-word>]
    }
    regex webredacteur-job-title { <webredacteur-job-title-word> }
    regex webshop-job-title {
        <webshop-job-title-word> \h+ <manager-job-title-word>
    }
    regex website-job-title {
        <website-job-title-word> \h+ [<assistant-job-title-word> | <consultant-job-title-word> | <content-job-title-word> \h+ [<editor-job-title-word> | <manager-job-title-word> | <writer-job-title-word>] | <design-job-title-word> \h+ <development-job-title-word> | <designeranddeveloper-job-title-word> | <designer-job-title-word> \h+ <developer-job-title-word> | <developer-job-title-word> | <development-job-title-word> | <editor-job-title-word> | <graphic-job-title-word> \h+ <designer-job-title-word> | <intern-job-title-word> | <maintenance-job-title-word> | <management-job-title-word> | <producer-job-title-word> | <programmer-job-title-word> | <project-job-title-word> \h+ <manager-job-title-word> | <specialist-job-title-word>]
    }
    regex websphere-job-title {
        <websphere-job-title-word> \h+ [<administrator-job-title-word> | <consultant-job-title-word> | <specialist-job-title-word>]
    }
    regex webudvikler-job-title { <webudvikler-job-title-word> }
    regex webutvikler-job-title { <webutvikler-job-title-word> }
    token adjunct-job-title-word { 'adjunct' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'adjunct') }> }
    token administrador-job-title-word { 'administrador' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'administrador') }> }
    token administrator-job-title-word { 'administrator' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'administrator') }> }
    token advisor-job-title-word { 'advisor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'advisor') }> }
    token analista-job-title-word { 'analista' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'analista') }> }
    token analyst-job-title-word { 'analyst' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'analyst') }> }
    token analytics-job-title-word { 'analytics' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'analytics') }> }
    token and-job-title-word { 'and' }
    token android-job-title-word { 'android' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'android') }> }
    token aplicaciones-job-title-word { 'aplicaciones' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'aplicaciones') }> }
    token app-job-title-word { 'app' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'app') }> }
    token application-job-title-word { 'application' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'application') }> }
    token applications-job-title-word { 'applications' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'applications') }> }
    token architect-job-title-word { 'architect' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'architect') }> }
    token art-job-title-word { 'art' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'art') }> }
    token artist-job-title-word { 'artist' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'artist') }> }
    token aspnet-job-title-word { 'aspnet' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'aspnet') }> }
    token assistant-job-title-word { 'assistant' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'assistant') }> }
    token assistante-job-title-word { 'assistante' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'assistante') }> }
    token associate-job-title-word { 'associate' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'associate') }> }
    token author-job-title-word { 'author' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'author') }> }
    token backend-job-title-word { 'backend' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'backend') }> }
    token builder-job-title-word { 'builder' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'builder') }> }
    token chair-job-title-word { 'chair' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'chair') }> }
    token chef-job-title-word { 'chef' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'chef') }> }
    token chemistry-job-title-word { 'chemistry' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'chemistry') }> }
    token coach-job-title-word { 'coach' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'coach') }> }
    token cofounder-job-title-word { 'cofounder' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'cofounder') }> }
    token communications-job-title-word { 'communications' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'communications') }> }
    token computer-job-title-word { 'computer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'computer') }> }
    token concepteur-job-title-word { 'concepteur' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'concepteur') }> }
    token consulente-job-title-word { 'consulente' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'consulente') }> }
    token consultant-job-title-word { 'consultant' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'consultant') }> }
    token consultor-job-title-word { 'consultor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'consultor') }> }
    token content-job-title-word { 'content' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'content') }> }
    token contract-job-title-word { 'contract' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'contract') }> }
    token contractor-job-title-word { 'contractor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'contractor') }> }
    token coop-job-title-word { 'coop' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'coop') }> }
    token coordinator-job-title-word { 'coordinator' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'coordinator') }> }
    token copywriter-job-title-word { 'copywriter' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'copywriter') }> }
    token corporate-job-title-word { 'corporate' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'corporate') }> }
    token creative-job-title-word { 'creative' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'creative') }> }
    token database-job-title-word { 'database' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'database') }> }
    token de-job-title-word { 'de' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'de') }> }
    token department-job-title-word { 'department' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'department') }> }
    token desarrollador-job-title-word { 'desarrollador' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'desarrollador') }> }
    token desarrolladora-job-title-word { 'desarrolladora' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'desarrolladora') }> }
    token desarrollo-job-title-word { 'desarrollo' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'desarrollo') }> }
    token desenvolvedor-job-title-word { 'desenvolvedor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'desenvolvedor') }> }
    token desenvolvedora-job-title-word { 'desenvolvedora' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'desenvolvedora') }> }
    token desginer-job-title-word { 'desginer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'desginer') }> }
    token design-job-title-word { 'design' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'design') }> }
    token designer-job-title-word { 'designer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'designer') }> }
    token designeranddeveloper-job-title-word { 'designeranddeveloper' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'designeranddeveloper') }> }
    token designerandgraphic-job-title-word { 'designerandgraphic' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'designerandgraphic') }> }
    token designerandprogrammer-job-title-word { 'designerandprogrammer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'designerandprogrammer') }> }
    token designing-job-title-word { 'designing' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'designing') }> }
    token desinger-job-title-word { 'desinger' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'desinger') }> }
    token developer-job-title-word { 'developer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'developer') }> }
    token developerandanalyst-job-title-word { 'developerandanalyst' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'developerandanalyst') }> }
    token developerandgraphic-job-title-word { 'developerandgraphic' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'developerandgraphic') }> }
    token developerandprogrammer-job-title-word { 'developerandprogrammer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'developerandprogrammer') }> }
    token development-job-title-word { 'development' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'development') }> }
    token developpeur-job-title-word { 'developpeur' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'developpeur') }> }
    token director-job-title-word { 'director' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'director') }> }
    token drupal-job-title-word { 'drupal' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'drupal') }> }
    token ecommerce-job-title-word { 'ecommerce' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'ecommerce') }> }
    token editor-job-title-word { 'editor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'editor') }> }
    token editorial-job-title-word { 'editorial' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'editorial') }> }
    token educator-job-title-word { 'educator' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'educator') }> }
    token engineer-job-title-word { 'engineer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'engineer') }> }
    token english-job-title-word { 'english' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'english') }> }
    token executive-job-title-word { 'executive' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'executive') }> }
    token faculty-job-title-word { 'faculty' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'faculty') }> }
    token fellow-job-title-word { 'fellow' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'fellow') }> }
    token founder-job-title-word { 'founder' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'founder') }> }
    token freelance-job-title-word { 'freelance' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'freelance') }> }
    token freelancer-job-title-word { 'freelancer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'freelancer') }> }
    token frontend-job-title-word { 'frontend' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'frontend') }> }
    token full-job-title-word { 'full' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'full') }> }
    token grader-job-title-word { 'grader' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'grader') }> }
    token graphic-job-title-word { 'graphic' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'graphic') }> }
    token graphics-job-title-word { 'graphics' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'graphics') }> }
    token graphiste-job-title-word { 'graphiste' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'graphiste') }> }
    token head-job-title-word { 'head' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'head') }> }
    token high-job-title-word { 'high' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'high') }> }
    token hs-job-title-word { 'hs' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'hs') }> }
    token immersive-job-title-word { 'immersive' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'immersive') }> }
    token independent-job-title-word { 'independent' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'independent') }> }
    token instructional-job-title-word { 'instructional' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'instructional') }> }
    token instructor-job-title-word { 'instructor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'instructor') }> }
    token integrator-job-title-word { 'integrator' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'integrator') }> }
    token interactive-job-title-word { 'interactive' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'interactive') }> }
    token interface-job-title-word { 'interface' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'interface') }> }
    token intern-job-title-word { 'intern' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'intern') }> }
    token internship-job-title-word { 'internship' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'internship') }> }
    token interventionist-job-title-word { 'interventionist' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'interventionist') }> }
    token java-job-title-word { 'java' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'java') }> }
    token javascript-job-title-word { 'javascript' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'javascript') }> }
    token jee-job-title-word { 'jee' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'jee') }> }
    token journalist-job-title-word { 'journalist' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'journalist') }> }
    token journaliste-job-title-word { 'journaliste' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'journaliste') }> }
    token junior-job-title-word { 'junior' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'junior') }> }
    token lab-job-title-word { 'lab' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'lab') }> }
    token lead-job-title-word { 'lead' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'lead') }> }
    token leader-job-title-word { 'leader' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'leader') }> }
    token lecturer-job-title-word { 'lecturer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'lecturer') }> }
    token maintenance-job-title-word { 'maintenance' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'maintenance') }> }
    token management-job-title-word { 'management' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'management') }> }
    token manager-job-title-word { 'manager' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'manager') }> }
    token maquetador-job-title-word { 'maquetador' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'maquetador') }> }
    token marketer-job-title-word { 'marketer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'marketer') }> }
    token marketing-job-title-word { 'marketing' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'marketing') }> }
    token math-job-title-word { 'math' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'math') }> }
    token mathematical-job-title-word { 'mathematical' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'mathematical') }> }
    token mathematician-job-title-word { 'mathematician' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'mathematician') }> }
    token mathematics-job-title-word { 'mathematics' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'mathematics') }> }
    token maths-job-title-word { 'maths' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'maths') }> }
    token media-job-title-word { 'media' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'media') }> }
    token merchandiser-job-title-word { 'merchandiser' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'merchandiser') }> }
    token middle-job-title-word { 'middle' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'middle') }> }
    token mobile-job-title-word { 'mobile' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'mobile') }> }
    token multimedia-job-title-word { 'multimedia' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'multimedia') }> }
    token net-job-title-word { 'net' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'net') }> }
    token of-job-title-word { 'of' }
    token officer-job-title-word { 'officer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'officer') }> }
    token operations-job-title-word { 'operations' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'operations') }> }
    token owner-job-title-word { 'owner' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'owner') }> }
    token periodista-job-title-word { 'periodista' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'periodista') }> }
    token perl-job-title-word { 'perl' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'perl') }> }
    token php-job-title-word { 'php' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'php') }> }
    token physics-job-title-word { 'physics' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'physics') }> }
    token pleno-job-title-word { 'pleno' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'pleno') }> }
    token print-job-title-word { 'print' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'print') }> }
    token private-job-title-word { 'private' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'private') }> }
    token producer-job-title-word { 'producer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'producer') }> }
    token product-job-title-word { 'product' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'product') }> }
    token production-job-title-word { 'production' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'production') }> }
    token professor-job-title-word { 'professor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'professor') }> }
    token programador-job-title-word { 'programador' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'programador') }> }
    token programadora-job-title-word { 'programadora' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'programadora') }> }
    token programista-job-title-word { 'programista' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'programista') }> }
    token programmatore-job-title-word { 'programmatore' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'programmatore') }> }
    token programmer-job-title-word { 'programmer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'programmer') }> }
    token programmeur-job-title-word { 'programmeur' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'programmeur') }> }
    token programming-job-title-word { 'programming' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'programming') }> }
    token project-job-title-word { 'project' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'project') }> }
    token projects-job-title-word { 'projects' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'projects') }> }
    token projet-job-title-word { 'projet' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'projet') }> }
    token projets-job-title-word { 'projets' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'projets') }> }
    token publisher-job-title-word { 'publisher' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'publisher') }> }
    token reading-job-title-word { 'reading' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'reading') }> }
    token redactor-job-title-word { 'redactor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'redactor') }> }
    token redactora-job-title-word { 'redactora' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'redactora') }> }
    token reporter-job-title-word { 'reporter' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'reporter') }> }
    token research-job-title-word { 'research' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'research') }> }
    token researcher-job-title-word { 'researcher' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'researcher') }> }
    token responsable-job-title-word { 'responsable' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'responsable') }> }
    token sales-job-title-word { 'sales' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'sales') }> }
    token school-job-title-word { 'school' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'school') }> }
    token science-job-title-word { 'science' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'science') }> }
    token secondary-job-title-word { 'secondary' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'secondary') }> }
    token senior-job-title-word { 'senior' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'senior') }> }
    token services-job-title-word { 'services' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'services') }> }
    token sistemas-job-title-word { 'sistemas' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'sistemas') }> }
    token social-job-title-word { 'social' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'social') }> }
    token software-job-title-word { 'software' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'software') }> }
    token specialist-job-title-word { 'specialist' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'specialist') }> }
    token stack-job-title-word { 'stack' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'stack') }> }
    token stagiaire-job-title-word { 'stagiaire' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'stagiaire') }> }
    token statistician-job-title-word { 'statistician' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'statistician') }> }
    token strategist-job-title-word { 'strategist' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'strategist') }> }
    token student-job-title-word { 'student' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'student') }> }
    token support-job-title-word { 'support' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'support') }> }
    token sviluppatore-job-title-word { 'sviluppatore' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'sviluppatore') }> }
    token system-job-title-word { 'system' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'system') }> }
    token systems-job-title-word { 'systems' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'systems') }> }
    token teacher-job-title-word { 'teacher' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'teacher') }> }
    token teacherandcoach-job-title-word { 'teacherandcoach' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'teacherandcoach') }> }
    token teaching-job-title-word { 'teaching' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'teaching') }> }
    token team-job-title-word { 'team' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'team') }> }
    token tech-job-title-word { 'tech' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'tech') }> }
    token technical-job-title-word { 'technical' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'technical') }> }
    token technician-job-title-word { 'technician' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'technician') }> }
    token technologist-job-title-word { 'technologist' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'technologist') }> }
    token tester-job-title-word { 'tester' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'tester') }> }
    token tgt-job-title-word { 'tgt' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'tgt') }> }
    token trainee-job-title-word { 'trainee' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'trainee') }> }
    token trainer-job-title-word { 'trainer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'trainer') }> }
    token tutor-job-title-word { 'tutor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'tutor') }> }
    token user-job-title-word { 'user' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'user') }> }
    token web-job-title-word { 'web' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'web') }> }
    token webandgraphic-job-title-word { 'webandgraphic' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webandgraphic') }> }
    token webandgraphics-job-title-word { 'webandgraphics' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webandgraphics') }> }
    token webandmobile-job-title-word { 'webandmobile' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webandmobile') }> }
    token webandsoftware-job-title-word { 'webandsoftware' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webandsoftware') }> }
    token webandui-job-title-word { 'webandui' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webandui') }> }
    token webansvarlig-job-title-word { 'webansvarlig' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webansvarlig') }> }
    token webbansvarig-job-title-word { 'webbansvarig' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webbansvarig') }> }
    token webbutvecklare-job-title-word { 'webbutvecklare' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webbutvecklare') }> }
    token webdesigner-job-title-word { 'webdesigner' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webdesigner') }> }
    token webdeveloper-job-title-word { 'webdeveloper' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webdeveloper') }> }
    token webeditor-job-title-word { 'webeditor' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webeditor') }> }
    token webentwickler-job-title-word { 'webentwickler' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webentwickler') }> }
    token weblogic-job-title-word { 'weblogic' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'weblogic') }> }
    token webmarketeur-job-title-word { 'webmarketeur' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webmarketeur') }> }
    token webmarketing-job-title-word { 'webmarketing' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webmarketing') }> }
    token webmaster-job-title-word { 'webmaster' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webmaster') }> }
    token webmestre-job-title-word { 'webmestre' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webmestre') }> }
    token webmethods-job-title-word { 'webmethods' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webmethods') }> }
    token webredacteur-job-title-word { 'webredacteur' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webredacteur') }> }
    token webshop-job-title-word { 'webshop' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webshop') }> }
    token website-job-title-word { 'website' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'website') }> }
    token websphere-job-title-word { 'websphere' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'websphere') }> }
    token webudvikler-job-title-word { 'webudvikler' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webudvikler') }> }
    token webutvikler-job-title-word { 'webutvikler' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'webutvikler') }> }
    token writer-job-title-word { 'writer' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'writer') }> }
}
