package sherrloc.graph;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * This class provide basic functions of a graph
 */
public abstract class Graph {
	protected Set<Node> allNodes;
	protected Map<Node, Map<Node, Set<Edge>>> edges;
	
	protected Graph( ) {
		allNodes = new HashSet<Node>();
		edges = new HashMap<Node, Map<Node,Set<Edge>>>();
	}
	
	/**
	 * Add node <code>n</code> to graph. No duplicated nodes in graph.
	 * 
	 * @param n
	 *            Node to be added
	 */
	protected void addNode (Node n) {
		allNodes.add(n);
		edges.put(n, new HashMap<Node, Set<Edge>>());
	}

	/**
	 * Add edge <code>edge</code> to the graph. End nodes are added as well if
	 * they are not represented in graph
	 * 
	 * @param edge
	 *            Edge to be added
	 */
    protected void addEdge (Edge edge) {
    	Node from = edge.from;
    	Node to = edge.to;
    	if (!allNodes.contains(from))
    		addNode(from);
    	if (!allNodes.contains(to))
    		addNode(to);
    	if (!hasEdge(from, to))
    		edges.get(from).put(to, new HashSet<Edge>());
    	edges.get(from).get(to).add(edge);
    }
    
	/**
	 * @return All graph nodes
	 */
	public Set<Node> getAllNodes () {
		return allNodes;
	}
    
    /**
     * @return All edges in the graph
     */
    public List<Edge> getAllEdges () {
    	List<Edge> ret = new ArrayList<Edge>();
    	for (Node n1 : edges.keySet()) {
    		for (Node n2 : edges.get(n1).keySet()) {
    			ret.addAll(edges.get(n1).get(n2));
    		}
    	}
    	return ret;
    }
    
    /**
	 * Return true if there is an edge between <code>from</code> and
	 * <code>to</code>
	 * 
	 * @param from
	 *            Start of an edge
	 * @param to
	 *            End of an edge
	 * @return True if there is an edge between <code>from</code> and
	 *         <code>to</code>
	 */
    public boolean hasEdge (Node from, Node to) {
    	return edges.get(from).containsKey(to);
    }
    
    /**
	 * Get all edges between <code>from</code> and <code>to</code>
	 * 
	 * @param from
	 *            Start node
	 * @param to
	 *            End node
	 * @return All edges between <code>from</code> and <code>to</code>
	 */
    public Set<Edge> getEdges (Node from, Node to) {
    	return edges.get(from).get(to);
    }
    
	/**
	 * Return all adjacent nodes of <code>from></code>. Useful for outputting
	 * the graph as a DOT file
	 * 
	 * @param from
	 * @return All adjacent nodes of <code>from></code>
	 */
    public Map<Node, Set<Edge>> getNeighbors (Node from) {
    	return edges.get(from);
    }
    
    /**
     * Label the entire graph as printable for the DOT format output
     */
    public void labelAll ( ) {
    	for (Node n : allNodes)
        	n.markAsPrint();;
    }
}
