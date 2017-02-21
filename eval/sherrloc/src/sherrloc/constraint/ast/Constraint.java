package sherrloc.constraint.ast;

import java.util.List;

import sherrloc.util.PrettyPrinter;

/**
 * A constraint has the format of {@link Hypothesis} entails {@link Relation}
 * ({@link Element} , {@link Element}), where {@link Relation} can be <= or ==
 * 
 */
public class Constraint implements PrettyPrinter {	
	private final Position pos;
	private final Hypothesis assumption;
	private final Inequality conclusion;

	private int succPaths=0;
	
	/**
	 * Creates a constraint <code>assumption</code> entails
	 * <code>r(e1,e2)</code>. Position information is also required to trace the
	 * error cause back into program
	 * 
	 * @param e1 An element to be constrained
	 * @param e2 An element to be constrained
	 * @param r A relation on <code>e1, e2</code>
	 * @param assumption Hypothesis of the generated constraint
	 * @param pos Source program position that generates the constraint
	 */
	public Constraint(Element e1, Element e2, Relation r, Hypothesis assumption, Position pos) {
		conclusion = new Inequality(e1, e2, r);
		this.assumption = assumption;
		this.pos = pos;
	}
	
	/**
	 * Creates a constraint <code>assumption</code> entails
	 * <code>ieq</code>. Position information is also required to trace the
	 * error cause back into program
	 * 
	 * @param ieq Conclusion of the constraint
	 * @param assumption Hypothesis of the generated constraint
	 * @param pos Source program position that generates the constraint
	 */
	public Constraint(Inequality ieq, Hypothesis assumption, Position pos) {
		conclusion = ieq;
		this.assumption = assumption;
		this.pos = pos;
	}
	
	/**
	 * @return The constraint where all elements have empty positions. See
	 *         {@link Element#getBaseElement()}
	 */
	public Constraint baseConstraint () {
		return new Constraint(conclusion.baseInequality(), assumption, pos); 
	}
		
	/**
	 * @return Hypothesis <code>assumption</code> in constraint
	 *         <code>assumption</code> entails <code>r(e1,e2)</code>
	 */
	public Hypothesis getAssumption() {
		return assumption;
	}
	
	/**
	 * @return The first element in conclusion (LHS of a relation <= or ==)
	 */
	public Element getFirstElement () {
		return conclusion.getFirstElement();
	}
	
	/**
	 * @return The second element in conclusion (RHS of a relation <= or ==)
	 */
	public Element getSecondElement () {
		return conclusion.getSecondElement();
	}
	
	/**
	 * @return The relation in conclusion (<= or ==)
	 */
	public Relation getRelation () {
		return conclusion.getRelation();
	}
	
	/**
	 * @return Conclusion of the constraint
	 */
	public Inequality getConclusion() {
		return conclusion;
	}
	
	@Override
	public String toString () {
		return conclusion.toString()+pos.toString();
	}
		
	@Override
	public String toHTMLString() {
		return conclusion.toHTMLString();
	}
	
	@Override
	public String toConsoleString() {
		return conclusion.toConsoleString();
	}
	
	/**
	 * @return All variables used in the constraint
	 */
	public List<Variable> getVars () {
		return conclusion.getVars();
	}
	
	/**
	 * Increase # satisfiable paths using this constraint
	 */
	public void incNumSuccPaths () {
		succPaths ++;
	}
	
	/**
	 * @return # satisfiable paths using this constraint
	 */
	public int getNumSuccPaths () {
    	return succPaths;
    }
	
	/**
	 * @return Source code position that generates the constraint
	 */
	public Position getPos() {
		return pos;
	}
        
    @Override
    public boolean equals(Object obj) {
    	if (obj instanceof Constraint) {
			return conclusion.equals(((Constraint) obj).conclusion)
					&& pos.equals(((Constraint) obj).pos);
    	}
    	return false;
    }
    
    @Override
    public int hashCode() {
    	return conclusion.hashCode() + pos.hashCode()*3;
    }
}
