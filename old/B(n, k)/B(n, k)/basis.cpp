// basis.cpp: implementation of the basis class.
//
//////////////////////////////////////////////////////////////////////

#include "basis.h"
#include "tableau.h"
#include <set>

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

basis::basis()
{
	

}

basis::~basis()
{

}










/*
//convert a chain into a vector of coefficients
vector<int> convert(list<basis> outputset) {
	vector<int> Answer;
	for (list<basis>::const_iterator outiter = outputset.begin(); outiter != outputset.end(); ++outier) {
		for(list<term>::const_iterator initer = (this.sumsofterms).begin(); initer != (this.sumsofterms).end(); ++initer) {
			if ( (*initer).element == ((*outiter).sumsofterms).element) {
				Answer.push_back( (*initer).coefficient);
				break;
			}
		}
	}
}

*/



/*
list<basis> ComputeBasis(const Partition lambda, const RankSet u) {
	list<basis> Answer;
	
	// to compute all the basis first we need to get all tabloids of u
	list<tabloid> tabloidlist;
	tabloidlist = u.ComputeTabloids();

	// now we need to get all SSYT of shape lambda and type u
	list<tableau> SSYTlist = SSYT(lambda, u.Shape());
	list<tableau> SYTlist = SYT(lambda);

	// for each SSYT we get a different embedding of 
	// the Specht module S^lambda into M_u. 
	// so loop over all SSYT
	for (list<tableau>::const_iterator T = SSYTlist.begin(); T != SSYTlist.end(); ++T) {
		// now we need to compute the image of each polytabloid 
		// generated by a young symmetrizer
		// So we need all SYT(lambda) which we did above to avoid redundancy
		// so we loop over all SYT
		for(list<tableau>::const_iterator S = SYTlist.begin(); S != SYTlist.end(); ++S) {
			// we act on all tableau row equivalent to T by 
			// the anticolumn stablizer of S
			// Then we convert the result to tabloids of shape ?lambda?

			// We store the result in tempbasis
			basis tempbasis;
			
			// loop over all tableau row equivalent to T
			list<tableau> rowequiv = Braceof(T);
			for(list<tableau>::const_iterator R = rowequiv.begin(); R != rowequiv.end(); ++R) {
				// now we loop over all elements of the column group of S
				// remembering sign
				list<Perm> Col = C(S);
				for(list<Perm>::const_iterator sigma = Col.begin(); sigma != Col.end(); ++sigma) {
					// we act on R by sign(sigma)*sigma
					// convert the result to a tabloid
					// and then a chain
					// add the result to answer

					term temp = sign(*sigma) * ConvertFromTabloid(TableauToTabloid((*sigma) * (*R), u));
					tempbasis.Add(temp);
				}
			}
		}
	}
}

*/		


			
			








