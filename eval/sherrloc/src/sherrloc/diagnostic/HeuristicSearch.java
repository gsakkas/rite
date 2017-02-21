package sherrloc.diagnostic;

import java.util.Comparator;
import java.util.HashSet;
import java.util.PriorityQueue;
import java.util.Set;

import sherrloc.diagnostic.explanation.Entity;
import sherrloc.diagnostic.explanation.Explanation;
import sherrloc.graph.ConstraintPath;

/**
 * This class implements the main functionality of A* search. Given a set of
 * entities, method {@link #findOptimal()} returns all subsets of entities so
 * that a metric defined in subclass is minimized.
 */
public abstract class HeuristicSearch {
    protected final Entity[] candidates;		// a set of candidates to be searched
    private double best=Double.MAX_VALUE;		// current best value
    protected UnsatPaths paths;
    private int nSubopt;
    private int subOptCount = 0;
    
	/**
	 * @param candidates
	 *            A set of candidates to be searched
	 * @param paths
	 *            Unsatisfiable paths identified in the constraint analysis
	 * @param nSubopt
	 *            Number of suboptimal suggestions to report
	 */
    public HeuristicSearch(Entity[] candidates, UnsatPaths paths, int nSubopt) {
    	this.candidates = candidates;
    	this.paths = paths;
    	this.nSubopt = nSubopt;
	}   
    
	/**
	 * A node in the search tree
	 */
    protected class SearchNode {
    	private Set<Integer> entities;	// a subset of entities (by index)
		private int index;			// the largest searched index to avoid duplication 
		private double est;			// cost estimation
		private Set<ConstraintPath> remaining; // remaining paths to be solved
    	
		/**
		 * @param entities
		 *            a subset of entities (represented by their indices)
		 * @param index
		 *            the largest entity index in <code>entities</code> (avoid
		 *            duplication)
		 * @param remaining
		 *            remaining paths to be solved
		 * @param est
		 *            cost estimation
		 */
    	protected SearchNode(Set<Integer> entities, int index, Set<ConstraintPath> remaining, double est) {
    		this.entities = entities;
    		this.index = index;
    		this.est = est;
    		this.remaining = remaining;
    	}
    	
    	/**
    	 * @return remaining unsatisfiable paths to cover
    	 */
    	public Set<ConstraintPath> getRemaining() {
			return remaining;
		}
    	
    	/**
    	 * @return entity set
    	 */
    	public Set<Integer> getEntities() {
			return entities;
		}
    }
    
    /**
	 * @return Find a subset of candidates that 1) explains errors 2) minimizes
	 *         the ranking metric
	 */
    public Set<Explanation> findOptimal ( ) {
    	Set<Explanation> ret = new HashSet<Explanation>();
    	PriorityQueue<SearchNode> queue = new PriorityQueue<SearchNode>(
    			100, new Comparator<SearchNode>() {
					public int compare(SearchNode n1, SearchNode n2) {
						return (int)(n1.est - n2.est);
					}
				});
    	
    	// explore the first level
    	for (int i=0; i<candidates.length; i++) {
    		addSerchNode(queue, i, new SearchNode(new HashSet<Integer>(), 0, paths.getPaths(), 0.0));
    	}
    	
    	while (!queue.isEmpty()) {
    		SearchNode data = queue.poll();
    		boolean stop = goalTest(ret, data);
    		if (stop)
    			return ret;
    		
    		// explore the next level
        	for (int i=data.index; i<candidates.length-1; i++) {
        		addSerchNode(queue, i+1, data);
        	}
    	}
    	
    	return ret;
    }
    
    /**
	 * @param ret
	 *            A set of explanations where the search node is added to if the
	 *            node is an explanation
	 * @param node
	 *            A search node to be added if it is an explanation
	 * @return Return true if the search is done
	 */
    private boolean goalTest (Set<Explanation> ret, SearchNode node) {
    	double key = node.est;
    	if (node.remaining.size()!=0)
    		return false;
    	else {
    		// test if this is an end node before searching deeper
			if (best==Double.MAX_VALUE)
				best = key;
			if (key<=best || subOptCount<nSubopt) {
				if (key > best)
					subOptCount ++;
				Set<Entity> eset = new HashSet<Entity>();
				for (Integer j:node.entities) {
					eset.add(candidates[j]);
				}
				ret.add( new Explanation(eset, key));
				return false;
			}
			else {
		    	return true;
			}
		}
    }
    
    /**
	 * Add a new node to the frontier of search tree (<code>queue</code>).
	 * 
	 * @param queue
	 *            The frontier of search tree where the new node is added to
	 * @param candIdx
	 *            Index of the entity to be added to the previous search node
	 *            <code>previous</code>
	 * @param previous
	 *            The previous search node
	 */
    abstract protected void addSerchNode (PriorityQueue<SearchNode> queue, int candIdx, SearchNode previous);
}
