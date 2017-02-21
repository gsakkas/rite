package sherrloc.constraint.analysis;

import java.util.List;

import sherrloc.graph.Edge;
import sherrloc.graph.Node;

/**
 * The interface for path finders, which saturates a constraint graph so that
 * derivable partial orderings from constraints represented in graph are
 * represented in the saturated graph
 */
public interface PathFinder {

	/**
	 * Return a path in the constraint graph, when a partial ordering on
	 * <code>start</code> and <code>end</code> is derivable from all constraints
	 * along the returned path
	 * 
	 * @param start
	 *            Node on LHS
	 * @param end
	 *            Node on RHS
	 * @param verbose
	 *            True when collecting data for evaluation
	 * 
	 * @return A constraint path such that <code>start <= end</code> is
	 *         derivable from constraints along the path. Return null if no such
	 *         path exists
	 */
	public List<Edge> getPath(Node start, Node end, boolean verbose);
}
