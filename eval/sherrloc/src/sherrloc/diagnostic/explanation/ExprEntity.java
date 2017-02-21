package sherrloc.diagnostic.explanation;

import sherrloc.graph.ConstraintPath;
import sherrloc.graph.Node;

/**
 * A basic unit of expression (constraint element) explanation
 */
public class ExprEntity extends Entity {
	final private String expr;
	final private String snippet;
	final private String loc;

	/**
	 * @param snippet
	 *            Expression in program
	 * @param loc
	 *            Location of the expression
	 * @param succ
	 *            # satisfiable paths using the constraint
	 */
	public ExprEntity(String snippet, String loc, int succ) {
		super(succ);
		this.snippet = snippet;
		this.expr = snippet + loc;
		this.loc = loc;
	}

	@Override
	public boolean explains(ConstraintPath p) {
		for (Node n : p.getAllNodes()) {
			if (n.toString().equals(expr))
				return true;
		}
		return false;
	}

	@Override
	public void toHTML(StringBuffer locBuf, StringBuffer expBuf) {
		locBuf.append("['pathelement', \'" + loc + "\'], ");
		expBuf.append("<code>" + snippet + "</code>" + " [loc: " + loc + "]    ");
	}

	@Override
	public void toConsole(StringBuffer locBuf, StringBuffer expBuf) {
		locBuf.append(loc);
		expBuf.append(snippet);
	}

	@Override
	public String toString() {
		return expr;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof ExprEntity) {
			return expr.equals(((ExprEntity) obj).expr);
		}
		return false;
	}

	@Override
	public int hashCode() {
		return expr.hashCode();
	}
}
