package sherrloc.graph;

import java.util.HashSet;
import java.util.Set;

import sherrloc.constraint.ast.Constraint;
import sherrloc.constraint.ast.Inequality;
import sherrloc.constraint.ast.Relation;

/** 
 * Edges representing constraints
 */ 
public class ConstraintEdge extends Edge {
    private Constraint equ;
    
	/**
	 * @param e
	 *            A constraint
	 * @param from
	 *            Start node
	 * @param to
	 *            End node
	 */
    public ConstraintEdge(Constraint e, Node from, Node to) {
    	super(from, to);
        this.equ = e;
    }
    
	/**
	 * @return Get the constraint represented by the edge
	 */
    public Constraint getConstraint() {
		return equ;
	}
    
    @Override
    public String toString() {
        return equ.toString(); 
    }
    
    @Override
    public boolean equals(Object obj) {
    	if (obj instanceof ConstraintEdge)
    		return equ.equals(((ConstraintEdge) obj).getConstraint());
    	return false;
    }
    
    @Override
    public int hashCode() {
    	return equ.hashCode();
    }
    
    @Override
    public Set<Inequality> getHypothesis() {
    	if (equ.getAssumption()==null)
    		return new HashSet<Inequality>();
    	else
    		return equ.getAssumption().getInequalities();    	
    }
    
    @Override
    public boolean isDirected() {
    	return equ.getRelation()!=Relation.EQ;
    }
    
    @Override
    public void incNumSuccCounter() {
    	equ.incNumSuccPaths();
    }
        
    @Override
    public int getLength() {
    	return 1;
    }
    
    @Override
    public Edge getReverse() {
    	return new ConstraintEdge(equ, to, from);
    }
}