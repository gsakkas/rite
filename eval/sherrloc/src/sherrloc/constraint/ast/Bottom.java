package sherrloc.constraint.ast;

/**
 * The bottom element in a lattice
 */
public class Bottom extends Constructor {
	
	/**
	 * @param p Position of the element in source code
	 */
	public Bottom(Position p) {
		super("⊥", 0, false, p);
	}
	
	@Override
	public Bottom clone () {
		return new Bottom(pos);
	}
		
	@Override
	public boolean isBottom() {
		return true;
	}
	
	@Override
	public Element getBaseElement() {
		return new Bottom(Position.EmptyPosition());
	}
}
