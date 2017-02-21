package sherrloc.graph;

import java.util.HashSet;
import java.util.Set;

import sherrloc.constraint.ast.Inequality;

/**
 * A dummy edge used when non-consecutive edges are connected to produce an LEQ
 * edge (e.g., when all components of a join element <= another element). The
 * main purpose is to make the inferred path start/end at the right node
 */
public class DummyEdge extends Edge {

	/**
	 * @param from
	 *            Start node
	 * @param to
	 *            End node
	 */
	public DummyEdge(Node from, Node to) {
		super(from, to);
	}

	@Override
	public String toString() {
		return "dummy";
	}

	@Override
	public boolean isDirected() {
		return true;
	}

	@Override
	public Set<Inequality> getHypothesis() {
		return new HashSet<Inequality>();
	}

	@Override
	public int getLength() {
		return 0;
	}

	@Override
	public Edge getReverse() {
		return new DummyEdge(to, from);
	}
}
