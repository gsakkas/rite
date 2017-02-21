package sherrloc.constraint.ast;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import sherrloc.constraint.analysis.PathFinder;
import sherrloc.constraint.analysis.ShortestPathFinder;
import sherrloc.graph.ConstraintGraph;

/**
 * Hypothesis consists a conjunction of inequalities
 */
public class Hypothesis {
	private Set<Inequality> assertions;
	private ConstraintGraph graph;
	private PathFinder finder = null;
	private Hypothesis parent = null; // used to reduce shared environments
										// (e.g., to store global assumptions)

	/**
	 * Construct an empty hypothesis
	 */
	public Hypothesis() {
		assertions = new HashSet<Inequality>();
		graph = new ConstraintGraph(null);
	}

	/**
	 * @param s
	 *            A set of inequalities
	 */
	public Hypothesis(Set<Inequality> s) {
		assertions = s;
		graph = new ConstraintGraph(null);
	}

	/**
	 * Add an inequality to the hypothesis
	 * 
	 * @param ieq
	 *            An inequality to be added
	 */
	public void addInequality(Inequality ieq) {
		assertions.add(ieq.baseInequality());
	}

	/**
	 * Add all inequalities in <code>e</code> to the hypothesis
	 * 
	 * @param e
	 *            An hypothesis to be added
	 */
	public void addEnv(Hypothesis e) {
		if (parent == null) {
			parent = e;
		} else {
			assertions.addAll(e.getInequalities());
		}
	}

	/**
	 * Return a fresh hypothesis where an inequality <code>e1 <= e2</code> is
	 * added to the current hypothesis
	 * 
	 * @param e1
	 *            Element on LHS
	 * @param e2
	 *            Element on RHS
	 * @return A fresh hypothesis where an inequality <code>e1</code> <=
	 *         <code>e2</code> is added to the current hypothesis
	 */
	public Hypothesis addLeq(Element e1, Element e2) {
		Hypothesis h = new Hypothesis();
		h.addEnv(this);
		h.addInequality(new Inequality(e1.getBaseElement(),
				e2.getBaseElement(), Relation.LEQ));
		return h;
	}

	/**
	 * @return A string of all inequalities in hypothesis
	 */
	public String inequalityString() {
		StringBuffer sb = new StringBuffer();
		sb.append("Assertions:\n");
		for (Inequality e : assertions) {
			sb.append(e + "\n");
		}
		return sb.toString();
	}

	/**
	 * Test if the relation <code>e1</code> <= <code>e2</code> can be derived
	 * from the hypothesis
	 * 
	 * @param p1
	 *            Element on LHS
	 * @param p2
	 *            Element on RHS
	 * @return True if <code>p1 <= p2</code>
	 */
	public boolean leq(Element p1, Element p2) {
		return leq(p1, p2, true);
	}
	
	
	private boolean leq(Element p1, Element p2, boolean rec) {
		Element e1 = p1.getBaseElement();
		Element e2 = p2.getBaseElement();
		
		// simple cases
		if (e1.equals(e2))
			return true;

		if (e1.isBottom() || e2.isTop())
			return true;

		if (e1 instanceof Variable || e2 instanceof Variable) {
			return true;
		}

		// an assumption can be made on the join/meet/constructors, so apply
		// the assumptions first
		if (rec && leqApplyAssertions(e1, e2))
			return true;

		// In principle, all partial orderings can be inferred on the hypothesis
		// graph. But since the graph is constructed from constraints, a
		// relation can be missing if the element to be tested on does not
		// present in the graph (e.g., A <= A join B). One way is to
		// incrementally add the extra nodes to a saturated constraint graph.
		// Here, we apply the rules for constructors, joins and meets directly
		// for simplicity.

		// constructor mismatch
		if (e1 instanceof ConstructorApplication
				&& e2 instanceof ConstructorApplication) {
			if (!((ConstructorApplication) e1).getCons().equals(
					((ConstructorApplication) e2).getCons()))
				return false;
		}

		// break constructor application into the comparison on components
		if (e1 instanceof ConstructorApplication
				&& e2 instanceof ConstructorApplication) {
			List<Element> l1 = ((ConstructorApplication) e1).elements;
			List<Element> l2 = ((ConstructorApplication) e2).elements;
			boolean contravariant = ((ConstructorApplication) e1).getCons()
					.isContraVariant();
			for (int i = 0; i < l1.size(); i++) {
				if (!contravariant && !leq(l1.get(i), l2.get(i)))
					return false;
				else if (contravariant && !leq(l2.get(i), l1.get(i)))
					return false;
			}
			return true;
		}

		// apply the inference rules for joins and meets
		if (e1 instanceof JoinElement) {
			boolean succ = true;
			for (Element e : ((JoinElement) e1).getElements())
				if (!leq(e, e2, rec)) {
					succ = false;
					break;
				}
			if (succ)
				return true;
		} else if (e1 instanceof MeetElement) {
			for (Element e : ((MeetElement) e1).getElements())
				if (leq(e, e2, rec))
					return true;
		}

		if (e2 instanceof JoinElement) {
			for (Element e : ((JoinElement) e2).getElements())
				if (leq(e1, e, rec))
					return true;
		} else if (e2 instanceof MeetElement) {
			boolean succ = true;
			for (Element e : ((MeetElement) e2).getElements())
				if (!leq(e1, e, rec)) {
					succ = false;
					break;
				}
			if (succ)
				return true;
		}

		return false;
	}

	/**
	 * @return All inequalities made in the hypothesis
	 */
	public Set<Inequality> getInequalities() {
		if (parent == null)
			return assertions;
		else {
			Set<Inequality> ret = new HashSet<Inequality>();
			ret.addAll(assertions);
			ret.addAll(parent.getInequalities());
			return ret;
		}
	}

	/**
	 * Saturate a hypothesis graph to test if <code>e1<=e2</code> can be
	 * inferred
	 * 
	 * @param e1
	 *            Element on LHS
	 * @param e2
	 *            Element on RHS
	 * @return True if <code>e1 <= e2</code> can be inferred from the hypothesis
	 */
	public boolean leqApplyAssertions(Element e1, Element e2) {

		if (finder == null) {
			for (Inequality c : getInequalities()) {
				graph.addOneInequality(c);
			}
			graph.generateGraph();

			finder = new ShortestPathFinder(graph);
		}

		if (graph.hasElement(e1) && graph.hasElement(e2)) {
			if (finder.getPath(graph.getNode(e1), graph.getNode(e2), false) != null)
				return true;
			for (Element e : graph.getAllElements()) {
				if (finder.getPath(graph.getNode(e1), graph.getNode(e), false)!=null && leq(e, e2, false))
					return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		for (Inequality cons : assertions)
			sb.append(cons.toString() + "; ");
		sb.append("\n");
		for (Element ele : graph.getAllElements()) {
			sb.append(ele.toString() + "; ");
		}
		return sb.toString();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Hypothesis) {
			Hypothesis other = (Hypothesis) obj;
			for (Inequality cons : assertions) {
				if (!other.assertions.contains(cons))
					return false;
			}

			for (Inequality cons : other.assertions) {
				if (!assertions.contains(cons))
					return false;
			}
		}
		return true;
	}

	@Override
	public int hashCode() {
		int ret = 0;
		for (Inequality cons : assertions)
			ret += cons.hashCode();
		return ret;
	}

}
