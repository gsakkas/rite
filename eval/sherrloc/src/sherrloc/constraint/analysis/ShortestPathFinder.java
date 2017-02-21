package sherrloc.constraint.analysis;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Set;

import sherrloc.constraint.ast.ConstructorApplication;
import sherrloc.constraint.ast.Element;
import sherrloc.constraint.ast.JoinElement;
import sherrloc.constraint.ast.MeetElement;
import sherrloc.constraint.ast.Variable;
import sherrloc.graph.ConstraintGraph;
import sherrloc.graph.DummyEdge;
import sherrloc.graph.Edge;
import sherrloc.graph.EdgeCondition;
import sherrloc.graph.EmptyEdge;
import sherrloc.graph.LeftEdge;
import sherrloc.graph.LeqEdge;
import sherrloc.graph.Node;
import sherrloc.graph.ReductionEdge;
import sherrloc.graph.RightEdge;
import sherrloc.graph.Variance;

/**
 * Implements the dynamic programming algorithm proposed by Chris Barrett, Riko
 * Jacob and Madhav Marathe. More details can be found in their paper
 * "Formal-language-constrained path problems". We also handle "meet" and "join"
 * when leq edges are inferred
 */
public class ShortestPathFinder extends CFLPathFinder {
	
	/** length of shortest paths */
	private int[][] shortestLEQ;
	private Map<EdgeCondition, Integer>[][] shortestLeft;
	
	/** Lookup tables to find enumerable elements from components. These tables are used to infer extra edges for join/meet/constructors */
	private Map<Node, List<Node>>   joinElements = new HashMap<Node, List<Node>>();
	private Map<Node, List<Node>>   meetElements = new HashMap<Node, List<Node>>();
	private Map<Node, List<Node>>   consElements = new HashMap<Node, List<Node>>();
	
	/** other fields */
	private int MAX = 10000;
	private PriorityQueue<ReductionEdge> queue;
	
	/**
	 * @param graph
	 *            A graph to be saturated
	 */
	public ShortestPathFinder(ConstraintGraph graph) {
		super(graph);
		/** initialize data structures */
		int size = g.getAllNodes().size();
		queue = new PriorityQueue<ReductionEdge>(
				500, new Comparator<ReductionEdge>() {
					public int compare(ReductionEdge o1, ReductionEdge o2) {
						return o1.getLength() - o2.getLength();
					}
				});
		shortestLEQ = new int[size][size];
		shortestLeft = new HashMap[size][size];
		for (Node start : g.getAllNodes()) {
			for (Node end : g.getAllNodes()) {
				int sIndex = start.getIndex();
				int eIndex = end.getIndex();
				shortestLeft[sIndex][eIndex] = new HashMap<EdgeCondition, Integer>();
				shortestLEQ[sIndex][eIndex] = MAX;
			}
		}
		initTables();
	}
	
	/**
	 * initialize the lookup tables
	 */
	private void initTables() {
		for (Node n : g.getAllNodes()) {
			Element element = n.getElement();
			if (element instanceof JoinElement) {
				JoinElement je = (JoinElement) element;
				for (Element ele : je.getElements()) {
					Node toadd = g.getNode(ele);
					if (!joinElements.containsKey(toadd))
						joinElements.put(toadd, new ArrayList<Node>());
					joinElements.get(toadd).add(n);
				}
			} else if (element instanceof MeetElement) {
				MeetElement je = (MeetElement) element;
				for (Element ele : je.getElements()) {
					Node toadd = g.getNode(ele);
					if (!meetElements.containsKey(toadd))
						meetElements.put(toadd, new ArrayList<Node>());
					meetElements.get(toadd).add(n);
				}
			} else if (element instanceof ConstructorApplication) {
				ConstructorApplication ce = (ConstructorApplication) element;
				for (Element ele : ce.getElements()) {
					Node toadd = g.getNode(ele);
					if (!consElements.containsKey(toadd))
						consElements.put(toadd, new ArrayList<Node>());
					consElements.get(toadd).add(n);
				}
			}
		}
	}
	
	@Override
	protected void addEdge (ReductionEdge edge) {
		int fIndex = edge.getFrom().getIndex();
		int tIndex = edge.getTo().getIndex();
		
		// LeqEdge and LeftEdge are added to the working list (queue) to infer more edges
		if (edge instanceof LeqEdge) {
			shortestLEQ[fIndex][tIndex] = 1;
			leqPath[fIndex][tIndex] = (LeqEdge) edge;
			queue.offer(edge);	
		}
		else if (edge instanceof LeftEdge) {
			LeftEdge le = (LeftEdge) edge;
			shortestLeft[fIndex][tIndex].put(le.getCondition(), 1);
			leftPath[fIndex][tIndex].put(le.getCondition(), le);
			queue.offer(edge);		
		}
		else if (edge instanceof RightEdge) {
			if (!rightPath.containsKey(fIndex)) {
				rightPath.put(fIndex, new HashMap<Integer, List<RightEdge>>());
			}
			if (!rightPath.get(fIndex).containsKey(tIndex)) {
				rightPath.get(fIndex).put(tIndex, new ArrayList<RightEdge>());
			}
			rightPath.get(fIndex).get(tIndex).add((RightEdge)edge);
		}
	}
	
	/**
	 * apply rule LEQ ::= LEQ LEQ
	 * 
	 * @param sIndex
	 *            Start node of the first LEQ edge
	 * @param fIndex
	 *            End node of the first LEQ edge (the same as the start node of
	 *            the second LEQ edge
	 * @param tIndex
	 *            End node of the second LEQ edge
	 */
	private void applyLeqLeq (int sIndex, int fIndex, int tIndex) {
		if (shortestLEQ[sIndex][fIndex] + shortestLEQ[fIndex][tIndex] < shortestLEQ[sIndex][tIndex]) {
			LeqEdge newedge = new LeqEdge(leqPath[sIndex][fIndex], leqPath[fIndex][tIndex]);
			shortestLEQ[sIndex][tIndex] = shortestLEQ[sIndex][fIndex]
					+ shortestLEQ[fIndex][tIndex];
			queue.offer(newedge);
			leqPath[sIndex][tIndex] = newedge;
			assert (newedge.getLength() == shortestLEQ[sIndex][tIndex]):"Inconsistent length in shortestLEQ";
		}
	}
		
	/**
	 * apply rule LEQ ::= LEFT RIGHT
	 * 
	 * @param leftS
	 *            Start node of the LEFT edge
	 * @param leftE
	 *            End node of the LEFT edge (the same as the start node of the
	 *            RIGHT edge
	 * @param rightE
	 *            End node of the RIGHT edge
	 * @param ec
	 *            Edge condition ({@link EdgeCondition}) of the LEFT edge
	 */
	private void applyLeftRight (int leftS, int leftE, int rightE, EdgeCondition ec) {
		if (ec != null && hasRightEdges(leftE, rightE) && shortestLeft[leftS][leftE].get(ec) + 1 < shortestLEQ[leftS][rightE]) {
			for (RightEdge e : getRightEdges(leftE, rightE)) {
				if (e != null && ec.matches(((RightEdge) e).cons)) {
					LeqEdge newedge = new LeqEdge(leftPath[leftS][leftE].get(ec), e);
					shortestLEQ[leftS][rightE] = shortestLeft[leftS][leftE].get(ec) + 1;
					queue.offer(newedge);
					leqPath[leftS][rightE] = newedge;
					assert (newedge.getLength() == shortestLEQ[leftS][rightE]):"Inconsistent length in shortestLEQ";
				}
			}
		}
	}
		
	/**
	 * apply rule LEFT ::= LEFT LEQ
	 * 
	 * @param leftS
	 *            Start node of the LEFT edge
	 * @param leftE
	 *            End node of the LEFT edge
	 * @param newE
	 *            End node of the inferred LEFT edge
	 * @param ec
	 *            Edge condition ({@link EdgeCondition}) of the LEFT edge
	 * @param useReverse
	 *            Use the reverse of LEQ edge, since the negative LEQ edges are
	 *            not explicitly represented in graph to save space
	 */
	private void applyLeftLeq (int leftS, int leftE, int newE, EdgeCondition ec, boolean useReverse) {
		int leqS = leftE, leqE = newE;
		if (useReverse) {
			leqS = newE;
			leqE = leftE;
		}
		
		if (ec != null && shortestLEQ[leqS][leqE] < MAX && (!shortestLeft[leftS][newE].containsKey(ec)
			|| shortestLeft[leftS][leftE].get(ec) + shortestLEQ[leqS][leqE] < shortestLeft[leftS][newE].get(ec))) {

				LeftEdge newedge;
				if (!useReverse)
					newedge = new LeftEdge(ec, leftPath[leftS][leftE].get(ec), leqPath[leqS][leqE]);
				else
					// have to reverse the leq edge to make sure the newedge has right end node 
					newedge = new LeftEdge(ec, leftPath[leftS][leftE].get(ec), leqPath[leqS][leqE].getReverse());
				shortestLeft[leftS][newE].put(ec, shortestLeft[leftS][leftE].get(ec) + shortestLEQ[leqS][leqE]);
				queue.offer(newedge);
				leftPath[leftS][newE].put(ec, newedge);
				assert (newedge.getLength() == shortestLeft[leftS][newE].get(ec)):"Inconsistent length in shortestLEQ";
		}
	}	
	
	/**
	 * Finding the (shortest) reduction path for error diagnosis is an instance
	 * of the context-free-language-reachability problem with the following
	 * grammar:
	 * <p>
	 * leq := left right | leq leq left := left leq
	 * <p>
	 * We follow the dynamic programming algorithm proposed by Chris Barrett,
	 * Riko Jacob and Madhav Marathe. More details can be found in their paper
	 * "Formal-language-constrained path problems". We also handle contravariant
	 * parameters, "meet" and "join" when id edges are inferred
	 */
	protected void saturation() {
		Set<Node> allNodes = g.getAllNodes();
		
		int current_length = 0;
		while (!queue.isEmpty()) {	
			ReductionEdge edge = queue.poll();
			
			if (edge instanceof LeqEdge)
				tryAddingExtraEdges ((LeqEdge)edge, current_length);
			
			assert (current_length <= edge.getLength()) : "Error: got a smaller edge "+ current_length + " " + edge.getLength();
			
			current_length = edge.getLength();
						
			for (int i=0; i<allNodes.size(); i++) {
				// first, use the edge as the left part of a reduction rule
				int sIndex = edge.getFrom().getIndex();
				int fIndex = edge.getTo().getIndex();
				
				// LEQ = LEQ LEQ
				if (edge instanceof LeqEdge) {
					applyLeqLeq(sIndex, fIndex, i);
				}
				else if (edge instanceof LeftEdge) {
					EdgeCondition ec = ((LeftEdge)edge).getCondition();
					
					// LEQ = LEFT RIGHT
					applyLeftRight(sIndex, fIndex, i, ec);

					// LEFT = LEFT LEQ
					applyLeftLeq(sIndex, fIndex, i, ec, ec.getVariance()==Variance.NEG);
				}
				
				// next, use the edge as the right part of a reduction rule
				if (edge instanceof LeqEdge) {
					// LEQ = LEQ LEQ
					applyLeqLeq(i, sIndex, fIndex);
	
					// LEFT := LEFT LEQ
					for (EdgeCondition ec : shortestLeft[i][sIndex].keySet()) {
							applyLeftLeq(i, sIndex, fIndex, ec, ec.getVariance()==Variance.NEG);
					}
				}
			}
		}
	}
	
	/**
	 * @param n1 Start node
	 * @param n2 End node
	 * @return True if n1<=n2 can be inferred from constraint graph, or hypothesis
	 */
	private boolean isLeq (Node n1, Node n2) {
		if (leqPath[n1.getIndex()][n2.getIndex()] != null)
			return true;
		if (g.getEnv() != null && !n1.getElement().trivialEnd() && !n2.getElement().trivialEnd()
				&& g.getEnv().leqApplyAssertions(
						n1.getElement().getBaseElement(), n2.getElement().getBaseElement())) {
			return true;
		}
		return false;
	}
	/**
	 * Given a newly discovered LeqEdge, this function tries to identify extra
	 * LeqEdges by using the properties of meet, join and constructor
	 */
	private void tryAddingExtraEdges (LeqEdge edge, int count) {
		Node from = edge.getFrom();
		Node to = edge.getTo();
		
		// if node "to" is an element of a meet label, add an leq edge from node
		// "from" to the meet element if it flows into all components
		if (meetElements.containsKey(to)) {
			for (Node meetnode : meetElements.get(to)) {
				MeetElement me = (MeetElement) meetnode.getElement();
				Node candidate = from;
				int candIndex = candidate.getIndex();
				int meetIndex = meetnode.getIndex();
				boolean success = true;
				Edge redEdge = EmptyEdge.getInstance();
				
				if (leqPath[candIndex][meetIndex] != null || candIndex == meetIndex)
					continue;
				for (Element e : me.getElements()) {
					if (!isLeq(candidate, g.getNode(e))) {
						success = false;
						break;
					}
				}
				if (success) {
					Node prev = from;
					for (Element e : me.getElements()) {
						int eleIndex = g.getNode(e).getIndex();
						redEdge = new LeqEdge(redEdge, new DummyEdge(prev, candidate));
						redEdge = new LeqEdge(redEdge, leqPath[candIndex][eleIndex]);
						prev = g.getNode(e);
					}
					LeqEdge newedge = new LeqEdge(redEdge, new DummyEdge(prev, meetnode));
					shortestLEQ[candIndex][meetIndex] = newedge.getLength();
					queue.offer(newedge);
					leqPath[candIndex][meetIndex] = newedge;
					assert (newedge.getFrom().getIndex() == candIndex && newedge.getTo().getIndex() == meetIndex);
				}
			}
		}
		
		// if node "from" is an element of a join label, add an leq edge from 
		// the join element to node "to" if all components flow into it
		if (joinElements.containsKey(from)) {
			for (Node joinnode : joinElements.get(from)) {
				JoinElement je = (JoinElement) joinnode.getElement();
				Node candidate = to;
				int candIndex = candidate.getIndex();
				int joinIndex = joinnode.getIndex();
				boolean success = true;
				Edge redEdge = EmptyEdge.getInstance();

				if (leqPath[joinIndex][candIndex] != null || joinIndex == candIndex)
					continue;
				for (Element e : je.getElements()) {
					if (!isLeq(g.getNode(e), candidate)) {
						success = false;
						break;
					}
				}
				if (success) {
					Node prev = joinnode;
					for (Element e : je.getElements()) {
						int eleIndex = g.getNode(e).getIndex();
						redEdge = new LeqEdge(redEdge, new DummyEdge(prev, g.getNode(e)));
						redEdge = new LeqEdge(redEdge, leqPath[eleIndex][candIndex]);
						prev = candidate;
					}
					LeqEdge newedge = new LeqEdge(redEdge, new DummyEdge(prev, candidate));
					shortestLEQ[joinIndex][candIndex] = newedge.getLength();
					queue.offer(newedge);
					leqPath[joinIndex][candIndex] = newedge;
				}
			}
		}
		
		// if node "from" and "to" belong to same constructor, check if this new
		// link enables a leq relation on the constructor application
		if (consElements.containsKey(from) && consElements.containsKey(to)) {
			for (Node cnFrom : consElements.get(from)) {
				for (Node cnTo : consElements.get(to)) {
					// make sure this is "ce1", not the swapped one when the constructor is contravariant
					ConstructorApplication ce1 = (ConstructorApplication) cnFrom.getElement(); 
					ConstructorApplication ce2 = (ConstructorApplication) cnTo.getElement();

					Node f = cnFrom;
					Node t = cnTo;
					if (ce1.getCons().isContraVariant()) {
						t = cnFrom;
						f = cnTo;
					}
					
					if (leqPath[f.getIndex()][t.getIndex()] != null || f.getIndex() == t.getIndex())
						continue;
	
					if (ce1.getCons().equals(ce2.getCons())) {
						// check if all elements flows into another constructor
						boolean success = true;
						Edge redEdge = EmptyEdge.getInstance();
						Node prev = f; 

						for (int i = 0; i < ce1.getCons().getArity(); i++) {
							Element e1 = ce1.getElements().get(i);
							Element e2 = ce2.getElements().get(i);
							int ie1 = g.getNode(e1).getIndex();
							int ie2 = g.getNode(e2).getIndex();
							if (!isLeq(g.getNode(e1), g.getNode(e2)) || e1 instanceof Variable || e2 instanceof Variable) {
								success = false;
								break;
							} else {
								redEdge = new LeqEdge(redEdge, new DummyEdge(prev, g.getNode(e1)));
								redEdge = new LeqEdge(redEdge, leqPath[ie1][ie2]);
								prev = g.getNode(e2);
							}
						}
						if (success) {
							LeqEdge newedge = new LeqEdge(redEdge, new DummyEdge(prev, t));
							newedge = new LeqEdge(newedge, new DummyEdge(f, t));
							shortestLEQ[f.getIndex()][t.getIndex()] = newedge.getLength();
							queue.offer(newedge);
							leqPath[f.getIndex()][t.getIndex()] = newedge;
						}
					}
				}
			}
		}
	}
}