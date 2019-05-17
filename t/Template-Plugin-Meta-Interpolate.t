# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Template-Plugin-Meta-Interpolate.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More;
use Template;

BEGIN { use_ok('Template::Plugin::Meta::Interpolate') };

my $tt = Template->new;

my $template = <<'END_OF_TEMPLATE';
[% USE Meta::Interpolate -%]
[% META foo = '-"$var"'; template.foo -%]
END_OF_TEMPLATE

my $out;
$tt->process(\$template, { var => 'value' }, \$out) or die $tt->error;

is($out, 'value');

done_testing;

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

