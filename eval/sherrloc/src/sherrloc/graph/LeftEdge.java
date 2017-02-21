package sherrloc.graph;

import sherrloc.constraint.analysis.CFLPathFinder;

/**
 * A special edge representing nonterminal LEFT in CFG (see {@link CFLPathFinder}).
 */
public class LeftEdge extends ReductionEdge {
	private EdgeCondition cons;

	/**
	 * @param cons
	 *            Constructor information
	 * @param first
	 *            Start node
	 * @param second
	 *            End node
	 */
	public LeftEdge(EdgeCondition cons, Edge first, Edge second) {
		super(first, second);
		this.cons = cons;
	}

	/**
	 * @return Represented constructor
	 */
	public EdgeCondition getCondition() {
		return cons;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof LeftEdge) {
			LeftEdge le = (LeftEdge) obj;
			return cons.equals(le.cons) && from.equals(le.from)
					&& to.equals(le.to);
		}
		return false;
	}

	@Override
	public int hashCode() {
		return from.hashCode() * 8009 + to.hashCode() * 4327 + cons.hashCode();
	}

	@Override
	public String toString() {
		return "left";
	}

	@Override
	public Edge getReverse() {
		return new LeftEdge(cons, second.getReverse(), first.getReverse());
	}
}