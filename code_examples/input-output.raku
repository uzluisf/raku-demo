# Reading from a file

# get a file handle for reading
my $fh = open "testfile", :r;

# get a file's contents
my $contents = $fh.slurp;

# close the file handle
$fh.close;

# alternatively, do everything at once by letting
# `slurp` to open and close the file for you
$contents = slurp "testfile"

# Writing to a file

# get the file handle for writing
$fh = open "testfile", :w;

# print content into file
$fh.say("New content with newline.");

# close the file handle
$fh.close;

# alternatively, do everything at once by letting
# `spurt` to open and close the file for you.
spurt "testfile", "More data\n", :append;

