/*

Permutation module:

This contains the basic tools for manipulating permutations:

* A Class (but should it be class or a struct?) for permutations
** Constructors and Destructors
** A function to return the sign of a permutation
** A constructor based on passing in a two-row representation of a permutation.
** Overloaded * to compose two permutations.

Also
* A class for the symmetric group of size n
** A generator so that we can loop over all permutations of a fixed size
** A function that returns ALL permutations of size n
*** Question: Does chapel have lazy lists?
** 
*/ 

module Perm {
  use Containers;
  
  // factorial
  def factorial(n:int) {
    var prod = 1;
    for x in 2..n {
      prod *= x;
    }
    return prod;
  }
  
  // positive modulus
  def posmod(in x:int, y:int) {
    x %= y;
    if (x < 0) then x += y;
    return x;
  }
  
  class SymmmetricGroup {
    def permutations(size:int) {
      
    }
  }
  
  record Permutation {
    var perm: Vector(int);
    
    // return the permutation sending A to B
    def Permutation(A:[], B:[]) {
      var size = A.domain.dim(1).high - B.domain.dim(1).low;
      perm = new Vector(int, cap=size, offset=1);
      for n in 1..size do
        perm.push(0);
        
      forall (dom, x) in (1..(perm.size), A) do
        forall (rang, y) in (1..(perm.size), B) do
          if x == y then
            perm[dom] = rang;
    }
    
    def this(idx) var {
      return perm(idx);
    }
    
    def these() var {
      return perm.these();
    }
    
    def copy() {
      var temp = new Permutation(perm.size);
      for i in perm.dom do
        temp[i] = perm[i];
      return temp;
    }
    
    // return the sign of a permutation    
    def sign const {
    	// This uses Wilf and Nijenhuis' algorithm
    	// from "Combinatorial Algorithms"
    	// page 222
    	
    	var cycles = 0; // the number of cycles of the input permutation;
    	const N = perm.size - 1;
    	var M: int;
    	var temp = copy();
    	
    	for i in 1..N do
    	  temp[i] = -temp[i];
    	
    	for i in 1..N {
    	  if temp[i] < 0 {
    	    cycles += 1;
    	    M = i;
    	    do {
    	      temp[M] = -temp[M];
    	      M = temp[M];
    	    } while M != i;
    	  }
    	}
    	return 1 - 2 * posmod(N + cycles, 2);    	
    }
        
    def Permutation(n:int) {
      perm = new Vector(int, cap=n, offset=1);
      for i in 1..n do
        perm.push(0);
    }
    // Sigma is in S_n
    def n const {
      return perm.size - 1;
    }
    
    def next(m:int) {
    	// This uses Wilf and Nijenhuis' algorithm
    	// from "Combinatorial Algorithms"
    	// page 55
    	
    	var n, h, m1, B, j, m2, j1:int;
    	n = perm.size - 1;
    	var newperm: Permutation;

    	if m == 6 && n == 3 {
    	  newperm = new Permutation(n);
    		newperm[1] = 1;
    		newperm[2] = 3;
    		newperm[3] = 2;
    		return newperm;
    	}

      newperm = copy();
      if posmod(m, 2) == 1 {
        newperm[1] = newperm[2];
        newperm[2] = this[1];
    	}
    	else {
  	    h = 3;
    	  m1 = m/2;
    		do {
    			B = posmod(m1, h);
    			if B == 0 {
    				m1 = m1/h;
    				h += 1;
  				}
  			} while (B == 0);

        m1 = n;
        for j in 1..(h - 1) {
          m2 = posmod((this[j] - this[h]), n);
          if m2 < m1 {
            m1 = m2;
            j1 = j;
          }
        }

        newperm[j1] = this[h];
        newperm[h] = this[j1];
      }
      return newperm;
    } 
  }
  
  def permutations(n:int) {
    var v = new Vector(Permutation);
    for x in permutations_iter(n) do
      v.push(x);
    return v;
  }
  
  def permutations_iter(n:int) {
    var iter = new Permutation(n);
    for i in 1..n do
      iter[i] = i;
    yield iter;
    
    var m = 1;
    for m in 1..(factorial(n) + 1) {
      iter = iter.next(m);
      yield iter;
    }
  }
  
}
