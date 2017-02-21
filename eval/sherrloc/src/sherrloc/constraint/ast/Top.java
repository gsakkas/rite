package sherrloc.constraint.ast;

/**
 * The top element in a lattice
 */
public class Top extends Constructor {

	/**
	 * @param p Position of the element in source code
	 */
	public Top(Position p) {
		super("⊤", 0, false, p);
	}
	
	@Override
	public Constructor clone () {
		return new Top(pos);
	}	
	
	@Override
	public boolean isTop() {
		return true;
	}
	
	@Override
	public Element getBaseElement() {
		return new Top(Position.EmptyPosition());
	}
}
