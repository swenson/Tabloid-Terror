use Perm;

def main() {
  
	writeln("Testing constructor");

	var sigma: Permutation;
	var tau = new Permutation(3);
	
	var Sn: Vector(Permutation);
	writeln("Getting list of all permutations of a 4-element set");

	Sn = permutations(3);
	Sn = permutations(4);

	writeln("There were ", Sn.size, " permutations");
	writeln("Here they are along with their signs");
	for x in Sn do
	  writeln(x);
	  
	var A: [1..3] int = (1,3,2);
	var B: [1..3] int = (2,3,1);
	
	writeln(new Permutation(A, B));
}