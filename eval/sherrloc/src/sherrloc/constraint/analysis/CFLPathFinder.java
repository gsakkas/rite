package sherrloc.constraint.analysis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sherrloc.graph.ConstraintEdge;
import sherrloc.graph.ConstraintGraph;
import sherrloc.graph.ConstructorEdge;
import sherrloc.graph.Edge;
import sherrloc.graph.EdgeCondition;
import sherrloc.graph.EmptyEdge;
import sherrloc.graph.JoinEdge;
import sherrloc.graph.LeftEdge;
import sherrloc.graph.LeqEdge;
import sherrloc.graph.MeetEdge;
import sherrloc.graph.Node;
import sherrloc.graph.ReductionEdge;
import sherrloc.graph.RightEdge;

/**
 * Saturate a constraint graph according to a context-free-grammar with three
 * types of edges:
 * <ul>
 * <li>LEQ: an inequality on node
 * <li>LEFT: constructor edge
 * <li>RIGHT: destructor edge
 * </ul>
 * <p>
 * See the full grammar in the paper "Toward General Diagnosis of Static Errors"
 * by Danfeng Zhang and Andrew C. Myers
 */
abstract public class CFLPathFinder implements PathFinder {
	/** Edges used in CFL-reachablity algorithm */
	protected LeqEdge[][] leqPath;
	protected Map<EdgeCondition, LeftEdge>[][] leftPath;
	// since the RIGHT edges are rare in a graph, and no right edges are
	// inferred, using HashMap can be more memory efficient than arrays
	protected Map<Integer, Map<Integer, List<RightEdge>>> rightPath;

	/** other fields */
	protected boolean initialized = false;
	protected final ConstraintGraph g;

	/**
	 * @param graph
	 *            A graph to be saturated
	 */
	public CFLPathFinder(ConstraintGraph graph) {
		g = graph;
		int size = g.getAllNodes().size();
		leqPath = new LeqEdge[size][size];
		leftPath = new HashMap[size][size];
		rightPath = new HashMap<Integer, Map<Integer, List<RightEdge>>>();
		for (Node start : g.getAllNodes()) {
			for (Node end : g.getAllNodes()) {
				int sIndex = start.getIndex();
				int eIndex = end.getIndex();

				leqPath[sIndex][eIndex] = null;
				leftPath[sIndex][eIndex] = new HashMap<EdgeCondition, LeftEdge>();
			}
		}
	}

	/**
	 * Add a {@link ReductionEdge} to the graph
	 * 
	 * @param edge
	 *            An edge to be added
	 */
	abstract protected void addEdge(ReductionEdge edge);

	/**
	 * Return all {@link RightEdge}s from <code>fIndex</code> to
	 * <code>tIndex</code>
	 * 
	 * @param fIndex
	 *            Start node
	 * @param tIndex
	 *            End node
	 * @return All {@link RightEdge}s from <code>fIndex</code> to
	 *         <code>tIndex</code>
	 */
	protected List<RightEdge> getRightEdges(int fIndex, int tIndex) {
		if (hasRightEdges(fIndex, tIndex)) {
			return rightPath.get(fIndex).get(tIndex);
		} else
			return new ArrayList<RightEdge>();
	}
	
	/**
	 * Return true if there is at least one {@link RightEdge} from
	 * <code>fIndex</code> to <code>tIndex</code>
	 * 
	 * @param fIndex
	 *            Start node
	 * @param tIndex
	 *            End node
	 * @return True if there is at least one {@link RightEdge} from
	 *         <code>fIndex</code> to <code>tIndex</code>
	 */
	protected boolean hasRightEdges(int fIndex, int tIndex) {
		if (rightPath.containsKey(fIndex) && rightPath.get(fIndex).containsKey(tIndex)) {
			return true;
		} 
		else
			return false;
	}

	/**
	 * Convert all graph edges into {@link ReductionEdge}s
	 */
	private void initialize() {

		List<Edge> edges = g.getAllEdges();

		for (Edge edge : edges) {
			if (edge instanceof ConstraintEdge || edge instanceof MeetEdge
					|| edge instanceof JoinEdge) {
				addEdge(new LeqEdge(edge, EmptyEdge.getInstance()));
			} else if (edge instanceof ConstructorEdge) {
				ConstructorEdge e = (ConstructorEdge) edge;
				if (e.getCondition().isReverse()) {
					addEdge(new RightEdge(e.getCondition(), edge, EmptyEdge.getInstance()));
				} else {
					addEdge(new LeftEdge(e.getCondition(), edge, EmptyEdge.getInstance()));
				}
			}
		}
	}

	/**
	 * Return a path in the constraint graph so that a partial ordering on
	 * <code>start, end</code> can be derived from constraints along the path.
	 * Return null when no such path exits
	 * 
	 * @param verbose
	 *            Set true to output saturation time
	 */
	public List<Edge> getPath(Node start, Node end, boolean verbose) {
		if (!initialized) {
			long startTime = System.currentTimeMillis();
			initialize();
			saturation();
			initialized = true;
			long endTime = System.currentTimeMillis();
			if (verbose)
				System.out.println("path_finding time: " + (endTime - startTime));
		}

		LeqEdge path = getLeqPath(start, end);
		if (path != null)
			return path.getEdges();
		else
			return null;
	}

	/**
	 * Return an LEQ path from <code>start</code> to <code>end</code>
	 * 
	 * @param start
	 *            Start node
	 * @param end
	 *            End node
	 * @return An LEQ path
	 */
	protected LeqEdge getLeqPath(Node start, Node end) {
		int sIndex = start.getIndex();
		int eIndex = end.getIndex();

		return leqPath[sIndex][eIndex];
	}

	/**
	 * Saturate the constraint graph
	 */
	abstract protected void saturation();
}
