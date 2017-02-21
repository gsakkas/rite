package sherrloc.graph;

import java.util.HashSet;
import java.util.Set;

import sherrloc.constraint.ast.Inequality;

/**
 * Edges representing join elements in the constraint language
 */
public class JoinEdge extends Edge {
	
	/**
	 * @param from
	 *            Start node
	 * @param to
	 *            End node
	 */
	public JoinEdge(Node from, Node to) {
		super(from, to);
	}
	
	@Override
	public String toString() {
		return "join";
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
		return 1;
	}
	
	@Override
	public Edge getReverse() {
		return new JoinEdge(to, from);
	}
}
