package sherrloc.diagnostic.explanation;

import sherrloc.constraint.ast.Constraint;
import sherrloc.graph.ConstraintEdge;
import sherrloc.graph.ConstraintPath;
import sherrloc.graph.Edge;

/**
 * A basic unit of constraint explanation
 */
public class ConstraintEntity extends Entity {
	final private Constraint cons;
	
	/**
	 * @param cons A constraint
	 * @param succ # satisfiable paths using the constraint
	 */
	public ConstraintEntity(Constraint cons, int succ) {
		super(succ);
		this.cons = cons;
	}
	
	@Override
	public boolean explains(ConstraintPath p) {
		for (Edge edge : p.getEdges()) {
			if (edge instanceof ConstraintEdge && ((ConstraintEdge) edge).getConstraint().equals(cons)) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public void toHTML(StringBuffer locBuf, StringBuffer expBuf) {
		locBuf.append("['left', \'"+cons.getPos()+"\'], ");
		expBuf.append(cons.toHTMLString());
	}
	
	@Override
	public void toConsole(StringBuffer locBuf, StringBuffer expBuf) {
		locBuf.append(cons.getPos() + ", ");
		expBuf.append(cons.toConsoleString() + ", ");
	}

	@Override
	public String toString() {
		return cons.toConsoleString() + cons.getPos();
	}
	
	@Override
	public boolean equals(Object other) {
		if (other instanceof ConstraintEntity) {
			return cons.equals(((ConstraintEntity) other).cons);
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return cons.hashCode();
	}
}
