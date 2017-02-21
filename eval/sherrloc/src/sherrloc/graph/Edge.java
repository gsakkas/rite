package sherrloc.graph;

import java.util.Set;

import sherrloc.constraint.ast.Inequality;

/**
 * An edge in the constraint graph
 */
abstract public class Edge {
	protected Node from;
	protected Node to;

	/**
	 * @param from
	 *            Start node
	 * @param to
	 *            End node
	 */
	public Edge(Node from, Node to) {
		this.from = from;
		this.to = to;
	}

	/**
	 * @return Start node
	 */
	public Node getFrom() {
		return from;
	}

	/**
	 * @return End node
	 */
	public Node getTo() {
		return to;
	}

	/**
	 * Increase # satisfiable paths using the edge
	 */
	public void incNumSuccCounter() {
		// do nothing
	}

	/**
	 * Mark the edge contributes to errors
	 */
	public void setCause() {
		// do nothing
	}

	/**
	 * @return False if the edge is bidirectional (e.g., an edge representing
	 *         equation)
	 */
	abstract public boolean isDirected();

	/**
	 * @return # of supporting edges that derives the edge
	 */
	abstract public int getLength();

	/**
	 * @return All hypotheses made to derive the edge
	 */
	abstract public Set<Inequality> getHypothesis();

	/**
	 * @return Reversed edge
	 */
	abstract public Edge getReverse();
}
