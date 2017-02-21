package sherrloc.diagnostic;

import sherrloc.diagnostic.explanation.Entity;


/**
 * Fining minimal cut is simply an instance of the more general heuristic
 * search, with the metric of being entity size
 */
public class MinCutFinder extends EntityExplanationFinder {
    
	/**
	 * @param paths
	 *            Unsatisfiable paths identified by constraint analysis
	 * @param candidates
	 *            A set of entities so that all subsets can be a potential
	 *            explanation
	 */
    public MinCutFinder(UnsatPaths paths, Entity[] candidates, int nOpt) {
    	super(paths, candidates, nOpt, 1, 0);
    }
}
