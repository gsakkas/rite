package sherrloc.graph;

import sherrloc.constraint.analysis.CFLPathFinder;

/**
 * A special edge representing nonterminal LEQ in CFG (see {@link CFLPathFinder}).
 */
public class RightEdge extends ReductionEdge {
	public EdgeCondition cons;
	
	/**
	 * @param cons
	 *            Constructor information
	 * @param first
	 *            Start node
	 * @param second
	 *            End node
	 */
	public RightEdge(EdgeCondition cons, Edge first, Edge second) {
		super(first, second);
		this.cons = cons;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof RightEdge) {
			return cons.equals(((RightEdge)obj).cons) && from.equals(((RightEdge)obj).from) && to.equals(((RightEdge)obj).to);
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return from.hashCode()*7103+to.hashCode()*3343+cons.hashCode();
	}
	
	@Override
	public String toString() {
		return "right";
	}
		
	@Override
	public Edge getReverse() {
		return new RightEdge(cons, second.getReverse(), first.getReverse());
	}
}