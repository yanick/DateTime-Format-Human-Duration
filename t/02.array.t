use Test::More;
use lib 't/lib';
use DateTime::Format::Human::Duration;
use DateTime;


my $dta = DateTime->now( locale => 'nb' );
my $dtb = $dta->clone->add( minutes => 1 );
my $dtc = $dta->clone->subtract( minutes => 1 );


my $fmt = DateTime::Format::Human::Duration->new;

TODO: {
    local $TODO = "See outstanding RT issue #74923: https://rt.cpan.org/Public/Bug/Display.html?id=74923";
    is($fmt->format_duration_between($dta, $dtb, past => '%s ago', future => 'in %s'),
        'in 1mi');

    is($fmt->format_duration_between($dta, $dtc, past => '%s ago', future => 'in %s'),
        '1mi ago');
}

done_testing();
