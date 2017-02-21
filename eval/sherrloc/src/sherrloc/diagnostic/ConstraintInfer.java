package sherrloc.diagnostic;

import java.util.HashSet;
import java.util.Set;

import sherrloc.constraint.ast.Constraint;
import sherrloc.diagnostic.explanation.ConstraintEntity;
import sherrloc.diagnostic.explanation.Entity;
import sherrloc.graph.ConstraintEdge;
import sherrloc.graph.ConstraintPath;
import sherrloc.graph.Edge;

/**
 * Infer the most likely wrong constraint in a program
 */
public class ConstraintInfer extends InferenceEngine {
	
	/**
	 * @param paths
	 *            All unsatisfiable paths identified in constraint analysis
	 */
	public ConstraintInfer(UnsatPaths paths, DiagnosticOptions opt) {
		super(paths, opt);		
	}
	
	@Override
	public Set<Entity> getCandidates() {
    	Set<Entity> cand = new HashSet<Entity>();
		
    	for (ConstraintPath path : paths.getPaths()) {
    		for (Edge edge : path.getEdges()) {
    			if (edge instanceof ConstraintEdge) {
    				Constraint cons = ((ConstraintEdge) edge).getConstraint();
    				cand.add(new ConstraintEntity(cons, cons.getNumSuccPaths()));
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
		return "<H4>Constraints in the source code that appear most likely to be wrong (mouse over to highlight code):</H4>\n";
	}	
	
	@Override
	public String info() {
		return "Constraints in the source code that appear most likely to be wrong: \n";
	}	
}
