package sherrloc.diagnostic.explanation;

import sherrloc.graph.ConstraintPath;

/**
 * Entities are the basic units of error report. In OCaml, the entities are
 * program expressions; in Jif, the entities can be security labels or
 * information-flow constraints; for missing hypothesis, the entities are
 * hypothesis.
 * <p>
 * Extend this class for other possibilities, such as a combination of both.
 */
public abstract class Entity {
	private int succ; // # satisfiable paths using the entity

	/**
	 * @param succ
	 *            # satisfiable paths using the entity
	 */
	public Entity(int succ) {
		this.succ = succ;
	}

	/**
	 * @return # satisfiable paths using the entity
	 */
	public int getSuccCount() {
		return succ;
	}

	/**
	 * Returns true if the entity "explains" an error on path p. That is, if an
	 * expression/constraint appears on path p, or a hypothesis suppresses the
	 * error on path p
	 */
	public abstract boolean explains(ConstraintPath p);

	/**
	 * Pretty print the entity for HTML
	 * 
	 * @param locBuf
	 *            Location of the explanation
	 * @param expBuf
	 *            Explanation
	 */
	public abstract void toHTML(StringBuffer locBuf, StringBuffer expBuf);

	/**
	 * Pretty print the entity for console
	 * 
	 * @param locBuf
	 *            Location of the explanation
	 * @param expBuf
	 *            Explanation
	 */
	public abstract void toConsole(StringBuffer locBuf, StringBuffer expBuf);

	/**
	 * Forces subclass to implement equals
	 */
	public abstract boolean equals(Object other);

	/**
	 * Forces subclass to implement hashCode
	 */
	public abstract int hashCode();
}
