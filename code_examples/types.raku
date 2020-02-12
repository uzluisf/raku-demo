sub static( Int $a, Int $b -> Int ) {
    $a + $b
}

sub dynamic( $a, $b ) {
    $a + $b
}

say static(2, 5);          # OUTPUT: «7␤»
static(2, 'oops');         # ERROR: ... will never work with declared signature ...
say dynamic(<a b>, <c d>); # OUTPUT: «4␤»
dynamic(2, 'oops');        # ERROR: Cannot convert string to number ...

# Subsets

subset ℕ of Int where * > 0;

sub f( ℕ $a, ℕ $b --> Array of ℕ ) {
    Array[ℕ].new: $a², $b²;
}

say f 1, 2; # OUTPUT: «[1 4]␤»

# Native types

my int @a = ^10_000_000;
say [+] @a; # OUTPUT: «49999995000000␤»
