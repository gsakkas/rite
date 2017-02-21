package sherrloc.diagnostic;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import sherrloc.constraint.ast.Element;
import sherrloc.constraint.ast.JoinElement;
import sherrloc.constraint.ast.MeetElement;
import sherrloc.diagnostic.explanation.Entity;
import sherrloc.diagnostic.explanation.ExprEntity;
import sherrloc.graph.ConstraintPath;
import sherrloc.graph.Node;

/**
 * Infer the most likely wrong expressions in a program. Expressions are
 * distinguished by their text and position in program (provided as comments in
 * the constraint language)
 */
public class ExprInfer extends InferenceEngine {
	private Map<String, Integer> succCount;
	
	/**
	 * @param paths
	 *            All unsatisfiable paths identified in constraint analysis
	 * @param allNodes
	 *            All nodes in the constraint graph. Used to retrieve #
	 *            satisfiable paths using the expressions
	 */
	public ExprInfer(UnsatPaths paths, Set<Node> allNodes, DiagnosticOptions opt) {
		super(paths, opt);
		
        // gather # satisfiable paths using an expression (represented by string)
		succCount = new HashMap<String, Integer>();
        for (Node n : allNodes) {
        	succCount.put(n.toString(), 0);
        }
        for (Node n : allNodes) {
			int count = succCount.get(n.toString());
			succCount.put(n.toString(), count+n.getSuccCounter());
        }
	}
	
	@Override
	public Set<Entity> getCandidates() {
    	Set<Entity> cand = new HashSet<Entity>();
		
    	for (ConstraintPath path : paths.getPaths()) {
    		for (Node n : path.getAllNodes()) {
    			Element e = n.getElement();
    			if (e.getPosition().isEmpty()) {}
    			else if (e instanceof JoinElement || e instanceof MeetElement) {}
    			else {
					cand.add(new ExprEntity(e.toSnippetString(), e.getPosition()
							.toString(), succCount.get(n.toString())));
    			}
    		}
    	}
    	
    	return cand;
	}
	
	@Override
	public HeuristicSearch getAlogithm(Set<Entity> candidates) {
    	Entity[] candarr = candidates.toArray(new Entity[candidates.size()]);
		return new EntityExplanationFinder(paths, candarr, options.getNSubopt());
	}
	
	@Override
	public String HTMLinfo() {
		return "<H4>Expressions in the source code that appear most likely to be wrong (mouse over to highlight code):</H4>\n";
	}	
	
	@Override
	public String info() {
		return "Expressions in the source code that appear most likely to be wrong: \n";
	}	
}