package App::lcpan::Cmd::colortheme_mods;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

require App::lcpan;
use Hash::Subset qw(hash_subset);

our %SPEC;

$SPEC{handle_cmd} = {
    v => 1.1,
    summary => 'List ColorTheme modules available on CPAN',
    args => {
        %App::lcpan::common_args,
        %App::lcpan::query_multi_args,
        %App::lcpan::fauthor_args,
        %App::lcpan::fdist_args,
        %App::lcpan::flatest_args,
        %App::lcpan::sort_modules_args,
    },
};
sub handle_cmd {
    my %args = @_;

    my $res = App::lcpan::modules(
        %args,
        query_type=>'regexp-name',
        query=>['^(.+::)?ColorTheme::'],
    );

    $res;
}

1;
# ABSTRACT:
