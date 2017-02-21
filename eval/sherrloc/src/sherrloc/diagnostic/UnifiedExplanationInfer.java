package sherrloc.diagnostic;

import java.util.HashSet;
import java.util.Set;

import sherrloc.constraint.ast.Element;
import sherrloc.diagnostic.explanation.Entity;
import sherrloc.diagnostic.explanation.ExprEntity;
import sherrloc.diagnostic.explanation.HypothesisEntity;
import sherrloc.graph.ConstraintPath;
import sherrloc.graph.Node;

/**
 * An experimental inference algorithm that finds a smallest combination of
 * expressions and missing hypothesis that best explain all program analysis
 * errors. This algorithm simply ranks the combined suggestions by size. Despite
 * its simplicity, the result is still useful since this approach is automatic.
 */
public class UnifiedExplanationInfer extends InferenceEngine {

	/**
	 * @param paths
	 *            All unsatisfiable paths identified in constraint analysis
	 */
	public UnifiedExplanationInfer(UnsatPaths paths, DiagnosticOptions opt) {
		super(paths, opt);
	}
	
	@Override
	public Set<Entity> getCandidates() {
    	Set<Entity> cand = new HashSet<Entity>();

    	for (ConstraintPath path : paths.getPaths())
    		cand.add(new HypothesisEntity(path.getMinHypo()));

		for (ConstraintPath path : paths.getPaths()) {
			for (Node n : path.getAllNodes()) {
				Element e = n.getElement();
				if (!e.getPosition().isEmpty())
					cand.add(new ExprEntity(e.toSnippetString(), e
							.getPosition().toString(), 0));
			}
		}
    	
    	return cand;
	}
	
	@Override
	public HeuristicSearch getAlogithm(Set<Entity> candidates) {
		return new MinCutFinder(paths, candidates.toArray(new Entity[candidates.size()]), options.getNSubopt());
	}
	
	@Override
	public String HTMLinfo() {
		return "<H4>Combined results (experimental):</H4>\n";
	}
	
	@Override
	public String info() {
		return "Combined results (experimental):\n";
	}
}
