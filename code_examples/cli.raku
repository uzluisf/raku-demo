# An example with a single subroutine MAIN 

sub MAIN(
    Str   $file where *.IO.f = 'file.dat',  #= an existing file to frobnicate 
    Int  :size(:$length) = 24,              #= length/size needed for frobnication 
    Bool :$verbose,                         #= required verbosity 
) {
    say $length if $length.defined;
    say $file   if $file.defined;
    say 'Verbosity ', ($verbose ?? 'on' !! 'off');
}

=begin comment
# Usage message:

$ script-name
Usage:
script-name.raku [--size|--length=<Int>] [--verbose] [<file>]
 
   [<file>]                 an existing file to frobnicate
   --size|--length=<Int>    length/size needed for frobnication
   --verbose                required verbosity

# Usage:

$ raku script-name.raku --verbose
24
file.dat
Verbosity on
=end comment

# An example with multiple subroutines MAIN 

multi MAIN(
    'install',
    Str $something,
    Bool :$force
) {
    say "Installing $something {'by force' if $force}";
}

multi MAIN(
    'run',
    Str $something
) {
    say "Running $something";
}

=begin comment
# Usage message:

$ script-name.raku
Usage:
script-name [--force] install <something>
script-name run <something>

# Usage:
$ script-name.raku --force install raku
Installing raku by force
=end comment
