package sherrloc.graph;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import sherrloc.constraint.analysis.CFLPathFinder;
import sherrloc.constraint.ast.Inequality;


/**
 * Derived edges that only used in saturated constraint graphs (used in
 * CFL-reachability algorithm, see {@link CFLPathFinder})
 */
abstract public class ReductionEdge extends Edge{
	protected final Edge first;
	protected final Edge second;
	private final int size;
	
	/**
	 * @param first
	 *            First edge based on which the constructed edge is derived from
	 * @param second
	 *            Second edge based on which the constructed edge is derived
	 *            from
	 */
	public ReductionEdge(Edge first, Edge second) {
		super(first.from, second.to);
		if (first instanceof EmptyEdge)
			from = second.from;
		if (second instanceof EmptyEdge)
			to = first.to;
		this.first = first;
		this.second = second;
		size = first.getLength()+second.getLength();
	}
	
	/**
	 * @return All non-reduction edges (edges in the unsaturated constraint
	 *         graph) that derive this edge
	 */
	public List<Edge> getEdges() {
		List<Edge> ret = new ArrayList<Edge>();
		if (first instanceof ReductionEdge)
			ret.addAll(((ReductionEdge)first).getEdges());
		else if (!(first instanceof EmptyEdge))
			ret.add(first);
		
		if (second instanceof ReductionEdge)
			ret.addAll(((ReductionEdge)second).getEdges());
		else if (!(second instanceof EmptyEdge))
			ret.add(second);
		return ret;
	}
	
	@Override
	public boolean isDirected() {
		return true;
	}
	
	@Override
	public String toString() {
		return "reduction";
	}
		
	@Override
	public int getLength () {
		return size;
	}
	
	@Override
	public Set<Inequality> getHypothesis() {
		Set<Inequality> ret = new HashSet<Inequality>();
		ret.addAll(first.getHypothesis());
		ret.addAll(second.getHypothesis());
		return ret;
	}
}
