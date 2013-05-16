use strict;
use utf8;

use Test::TCP;

$ENV{TEST_MEMCACHED} ||= do {
    my $server = Test::TCP->new(
        code => sub {
            my $port = shift;
            exec '/usr/bin/memcached', '-p', $port;
            die $!;
        }
    );
    Harriet->save_guard($server);
    '127.0.0.1:' . $server->port;
};
