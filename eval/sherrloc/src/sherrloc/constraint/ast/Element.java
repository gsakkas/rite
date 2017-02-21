package sherrloc.constraint.ast;

import java.util.List;

/**
 * Constraint element
 */
public abstract class Element {
	protected String name;
	protected Position pos;
	private int succCount; 		// # satisfiable path using this element
	
	/**
	 * @param name Element name.
	 * @param pos Element position in the source file
	 */
	public Element(String name, Position pos) {
		this.name = name;
		this.pos = pos;
        succCount = 0;
	}
	
	/**
	 * @return Element name.
	 */
	public String getName () {
		return name;
	}
		
	/**
	 * @return Element position in the source file
	 */
	public Position getPosition () {
		return pos;
	}
	
	/**
	 * @param pos Element position in the source file
	 */
	public void setPosition (Position pos) {
		this.pos = pos;
	}
	
	/**
	 * Increase # satisfiable path using this element
	 */
    public void incSuccCounter () {
        succCount += 1;
    }
    
    /**
     * @return # satisfiable path using this element
     */
    public int getSuccCounter () {
		return succCount;
	}
	
    /** a few print functions */

    abstract public String toString ();
	
	/**
	 * @return The code snippet corresponding to the element when available.
	 *         Return element name otherwise.
	 */
	public String toSnippetString () {
		if (pos.isEmpty())
			return name;
		else
			return pos.getSnippet();
	}		
	
	/**
	 * @return The code snippet of the element, and its position.
	 */
	public String toDetailString()  {
		return toSnippetString()+pos.toString();
	}
	
	/**
	 * @return Dot-friendly string of the element.
	 */
	abstract public String toDotString ();
	
	/**
	 * @return True when the satisfiability of a path is trivial when it ends
	 *         with the element (e.g., a variable).
	 */
	abstract public boolean trivialEnd ();
	
	/**
	 * @return All constraint variables used in the element.
	 */
	abstract public List<Variable> getVars ();
	
	/**
	 * @return True if the element contains a constraint variable.
	 */
	abstract public boolean hasVars ();
				
	/**
	 * @return True if this is the bottom element in lattice.
	 */
	abstract public boolean isBottom();
	
	/**
	 * @return True if this is the top element in lattice.
	 */
	abstract public boolean isTop();
	
	/**
	 * Same constraint elements (except variables) at different positions are
	 * treated as different elements to improve the precision of error
	 * diagnosis. However, when testing the partial ordering on elements, this
	 * method must be called, so that all duplicated elements are represented by
	 * the same base element, where the position is set to empty.
	 */
	abstract public Element getBaseElement();
}
