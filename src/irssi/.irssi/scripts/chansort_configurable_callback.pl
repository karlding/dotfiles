use strict;
use warnings;

my $n = -9001;
my %hardcoded_positioning = (
    freenode => {
        '#uwmidsun'      => $n++, # 3
        '##embedded'     => $n++, # 3
        '#go-nuts'       => $n++, # 3
        '##kernel'       => $n++, # 3
    },
    mozilla => {
        '#rust'          => $n++, # 2
        '#servo'         => $n++, # 2
    },
);

sub {
    # We sort the "(status) window first before anything else
    ($b->{name} eq "(status)") <=> ($a->{name} eq "(status)")
    ||
    # We want "CHANNEL" at the beginning and "QUERY" at the end
    # regardless of chatnet.
    $a->{type} cmp $b->{type}
    ||
    # For the rest of this I want channels to be ordered by chatnet
    # and have hardcoded positions or an alphabetical sort, but for
    # QUERY I don't want any further sorting, I just want a stable
    # sort, this is so I can page back from the back of the list to
    # find my most recent queries.
    (
        ($a->{type} eq 'CHANNEL' and $b->{type} eq 'CHANNEL')
        ?
        (
            # Cluster chatnets alphabetically
            $a->{chatnet} cmp $b->{chatnet}
            ||
            # Put & channels like &bitlbee before normal channels
            ($b->{name} =~ /^&/) <=> ($a->{name} =~ /^&/)
            ||
            # Allow for hardcoding the positioning of channels
            # within a network
            ($hardcoded_positioning{$a->{chatnet}}->{$a->{name}} || 0) <=> ($hardcoded_positioning{$b->{chatnet}}->{$b->{name}} || 0)
            ||
            # Default to sorting alphabetically
            $a->{name} cmp $b->{name}
        )
        : 0
    )
};
