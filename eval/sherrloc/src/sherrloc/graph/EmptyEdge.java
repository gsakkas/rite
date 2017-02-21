package sherrloc.graph;

import java.util.HashSet;
import java.util.Set;

import sherrloc.constraint.ast.Inequality;

/**
 * A singleton edge representing empty edge
 */
public class EmptyEdge extends Edge {
	private static EmptyEdge instance=null;
	
	private EmptyEdge() {
		super(null, null);
	}
	
	/**
	 * @return An instance of empty edge
	 */
	public static EmptyEdge getInstance() {
		if (instance==null)
			instance = new EmptyEdge();
		return instance;
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
		return this;
	}

	@Override
	public boolean isDirected() {
		return false;
	}

	@Override
	public String toString() {
		return "";
	}

}
