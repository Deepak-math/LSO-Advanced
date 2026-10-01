use application 'polytope';

# Check if a filename was provided as an argument
if (@ARGV < 1) {
    die "Usage: polymake --script script_name.pl <filename.lp>\n";
}

# Read the filename from the command line arguments
my $input_file = $ARGV[0];

# 1. Read LP and find integer lattice points
my $rel = lp2poly($input_file);
my $pts = new Polytope<Rational>($rel)->LATTICE_POINTS;

# Integer Points 
print "--- FEASIBLE INTEGER POINTS ---\n";
print $pts;

# 2. Build the exact integer hull with variable names
my $ip_poly = new Polytope(POINTS=>$pts, COORDINATE_LABELS=>$rel->COORDINATE_LABELS);

# 3. Print facets
print "\n--- FACETS ---\n";
print_constraints($ip_poly);
;