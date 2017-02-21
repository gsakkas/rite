package sherrloc.graph;

import sherrloc.constraint.analysis.CFLPathFinder;

/**
 * A special edge representing nonterminal LEQ in CFG (see {@link CFLPathFinder}).
 */
public class LeqEdge extends ReductionEdge {

	/**
	 * @param first
	 *            Start node
	 * @param second
	 *            End node
	 */
	public LeqEdge(Edge first, Edge second) {
		super(first!=null?first:EmptyEdge.getInstance(), second!=null?second:EmptyEdge.getInstance());
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof LeqEdge) {
			return from.equals(((LeqEdge) obj).from)
					&& to.equals(((LeqEdge) obj).to);
		}
		return false;
	}

	@Override
	public int hashCode() {
		return from.hashCode() * 5237 + to.hashCode();
	}

	@Override
	public String toString() {
		return "id";
	}

	@Override
	public Edge getReverse() {
		return new LeqEdge(second.getReverse(), first.getReverse());
	}
}
