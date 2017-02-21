package sherrloc.diagnostic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import sherrloc.diagnostic.explanation.Entity;
import sherrloc.diagnostic.explanation.Explanation;

/**
 * Super class of all explanation inference algorithms.
 */
public abstract class InferenceEngine {

	protected UnsatPaths paths;
	protected DiagnosticOptions options;

	/**
	 * @param paths
	 *            A set of unsatisfiable paths (errors) to be explained
	 */
	public InferenceEngine(UnsatPaths paths, DiagnosticOptions opt) {
		this.paths = paths;
		this.options = opt;
	}

	/**
	 * @return Best explanation of the errors observed in constraint graph
	 */
	public String infer( ) {
		final Set<Entity> cand = getCandidates();
		HeuristicSearch algorithm = getAlogithm(cand);

		StringBuffer sb = new StringBuffer();
		long startTime = System.currentTimeMillis();
		Set<Explanation> results = algorithm.findOptimal();
		long endTime = System.currentTimeMillis();
		if (options.isVerbose())
			System.out.println("ranking_time: " + (endTime - startTime));

		if (!options.isToConsole())
			sb.append("\n" + HTMLinfo());
		else
			sb.append(info());

		List<Explanation> list = new ArrayList<Explanation>();
		for (Explanation set : results) {
			list.add(set);
		}
		Collections.sort(list);

		double best = Double.MAX_VALUE;
		int i = 0;
		if (!options.isToConsole())
			sb.append("<UL>\n");
		for (; i < list.size(); i++) {
			if (list.get(i).getWeight() > best)
				break;
			best = list.get(i).getWeight();
			if (options.isToConsole())
				sb.append("- " + list.get(i).toConsoleString() + "\n");
			else
				sb.append("<LI> " + list.get(i).toHTMLString());
		}
		if (!options.isToConsole())
			sb.append("</UL>\n");
		if (options.isVerbose())
			System.out.println("top_rank_size: " + i);
		if (i < list.size()) {
			if (!options.isToConsole()) {
				sb.append("<button onclick=\"show_more_expr()\">show/hide more</button><br>\n");
				sb.append("<div id=\"more_expr\">");
				for (; i < list.size(); i++) {
					sb.append(list.get(i).toHTMLString());
				}
				sb.append("</div>\n");
			} else {
				sb.append("Other less likely suggestions: \n");
				for (; i < list.size(); i++) {
					sb.append(list.get(i).toConsoleString());
				}
			}
		}
		return sb.toString();
	}

	/**
	 * @return A set of entities that the inference is performed on
	 */
	public abstract Set<Entity> getCandidates();

	/**
	 * @param candidates
	 *            Basic elements of possible explanations
	 * @return Return an instance of heuristic search algorithm to use
	 */
	public abstract HeuristicSearch getAlogithm(Set<Entity> candidates);

	/**
	 * @return A string describing the nature of returned entities in HTML
	 *         format
	 */
	public abstract String HTMLinfo();

	/**
	 * @return A string describing the nature of returned entities in plain text
	 *         format
	 */
	public abstract String info();
}
