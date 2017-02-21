package sherrloc.constraint.analysis;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import sherrloc.constraint.ast.ConstructorApplication;
import sherrloc.constraint.ast.Element;
import sherrloc.constraint.ast.Hypothesis;
import sherrloc.constraint.ast.JoinElement;
import sherrloc.constraint.ast.MeetElement;
import sherrloc.diagnostic.UnsatPaths;
import sherrloc.graph.ConstraintGraph;
import sherrloc.graph.ConstraintPath;
import sherrloc.graph.Edge;
import sherrloc.graph.Node;

/**
 * This class identifies satisfiable and unsatisfiable constraints in a
 * constraint graph.
 */
public class ConstraintAnalysisImpl implements ConstraintAnalysis {
	private boolean isSym;
	private boolean isVerbose;
	private boolean isRec;
	private boolean DEBUG = false;

	/** Reuse saturated hypothesis graph when possible */
	private HashMap<Hypothesis, Hypothesis> cachedEnv;

	/**
	 * @param isSym
	 *            True if all constraints are equalities (to avoid duplication
	 *            in result)
	 * @param isVerbose
	 *            True to collect data for evaluation
	 * @param isRec
	 *            True if recursion is allowed
	 */
	public ConstraintAnalysisImpl(boolean isSym, boolean isVerbose, boolean isRec) {
		this.isSym = isSym;
		this.isVerbose = isVerbose;
		this.isRec = isRec;
		cachedEnv = new HashMap<Hypothesis, Hypothesis>();
	}

	/**
	 * Return an instance of constraint analysis. Currently, the only analysis
	 * implemented is {@link ShortestPathFinder}
	 * 
	 * @return An constraint analysis algorithm
	 */
	private PathFinder getPathFinder(ConstraintGraph graph) {
		return new ShortestPathFinder(graph);
	}

	@Override
	public UnsatPaths genErrorPaths(ConstraintGraph graph) {
		ArrayList<Node> startNodes = new ArrayList<Node>();
		ArrayList<Node> endNodes = new ArrayList<Node>();
		Set<Element> elements = graph.getAllElements();
		UnsatPaths unsatPaths = new UnsatPaths();

		if (DEBUG) {
			System.out.println("Total nodes before path generaton: "
					+ elements.size());
		}

		/** only search for informative paths */
		for (Element element : elements) {
			if (!(element instanceof JoinElement))
				startNodes.add(graph.getNode(element));
			if (!(element instanceof MeetElement))
				endNodes.add(graph.getNode(element));
		}

		if (DEBUG) {
			System.out.println("Total start nodes before path generaton: "
					+ startNodes.size());
			System.out.println("Total end nodes before path generaton: "
					+ endNodes.size());
			System.out.println("Total comparison required: "
					+ startNodes.size() * endNodes.size());
		}

		PathFinder finder = getPathFinder(graph);
		if (isVerbose)
			System.out.println("graph_size: " + graph.getAllNodes().size());

		for (Node start : startNodes) {
			for (Node end : endNodes) {
				Element e1 = start.getElement();
				Element e2 = end.getElement();

				// avoid returning duplicated edges when only equalities are used
				if (isSym && (start.getIndex() <= end.getIndex()))
					continue;

				// test if a partial ordering can be inferred
				List<Edge> l = finder.getPath(start, end, isVerbose);
				if (l == null)
					continue;

				// when recursion is not allowed, constraints such as "x = list x" is unsatisfiable
				if (!isRec && start.getIndex() != end.getIndex()) {
					if ((e1 instanceof ConstructorApplication && e1.getVars().contains(e2))
					 || (e2 instanceof ConstructorApplication && e2.getVars().contains(e1))) {
						ConstraintPath path = new ConstraintPath(l, finder, graph.getEnv(), cachedEnv);
						unsatPaths.addUnsatPath(path);
						continue;
					}
				}

				// ignore trivial cases
				if (e1.trivialEnd() || e2.trivialEnd()) {
					continue;
				}

				// less interesting paths
				if (e1.isBottom() || e2.isTop())
					continue;

				ConstraintPath path = new ConstraintPath(l, finder, graph.getEnv(), cachedEnv);

				if (path.isSatPath()) {
					path.incSuccCounter();
					continue;
				} else if (path.isUnsatPath()) {
					if (DEBUG) {
						System.out.println("****** Unsatisfiable path ******");
						System.out.println(path);
					}
					unsatPaths.addUnsatPath(path);
		    		path.setCause();
				}
			}
		}

		return unsatPaths;
	}
}
