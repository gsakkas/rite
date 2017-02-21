package sherrloc.diagnostic;

import java.util.Set;

import sherrloc.constraint.ast.Constraint;
import sherrloc.constraint.ast.Hypothesis;

/**
 * Result of parser
 */
public class DiagnosisInput {
	private Hypothesis env;
	private Set<Constraint> constraints;

	/**
	 * @param env
	 *            Global assumptions
	 * @param cons
	 *            A set of constraints
	 */
	public DiagnosisInput(Hypothesis env, Set<Constraint> cons) {
		this.env = env;
		constraints = cons;
	}

	/**
	 * @return Global assumptions
	 */
	public Hypothesis getEnv() {
		return env;
	}

	/**
	 * @return A set of constraints in the input file
	 */
	public Set<Constraint> getConstraints() {
		return constraints;
	}
}
