package sherrloc.constraint.ast;

import java.util.ArrayList;
import java.util.List;

/**
 * Join of constraint elements
 */
public class JoinElement extends EnumerableElement {

	/**
	 * @param elements A list of join components
	 */
	public JoinElement(List<Element> elements) {
		super("", elements);
		flat();
	}
	
	/**
	 * flatten nested join elements
	 */
	private void flat () {
		List<Element> flat = new ArrayList<Element>();
		for (Element e : elements) {
			if (e instanceof JoinElement) {
				flat.addAll(((JoinElement) e).elements);
			}
			else
				flat.add(e);
		}
		elements = flat;
	}
	
	@Override
	public String toString( ) {
		return infixToString()+pos;
	}
	
	@Override
	public String toSnippetString() {
		if (!pos.isEmpty()) {
			return pos.getSnippet();
		}
		return infixToSnippetString();
	}
	
	@Override
	public String toDotString() {
		return infixToDotString();
	}
	
	@Override
	String getSymbol() {
		return "join";
	}
		
	@Override
	public boolean trivialEnd() {
		for (Element e : elements) {
			if (e.trivialEnd())
				return true;
		}
		return false;
	}
	
	@Override
	public boolean equals (Object o) {
		if (this == o)
			return true;
		
		if (o instanceof JoinElement) {
			return super.equals(o) && pos.equals(((JoinElement) o).pos);
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return super.hashCode()+9010;
	}
	
	@Override
	public boolean isTop() {
		for (Element e : elements) {
			if (e.isTop())
				return true;
		}
		return false;
	}
	
	@Override
	public boolean isBottom() {
		for (Element e : elements) {
			if (!e.isBottom())
				return false;
		}
		return true;
	}
	
	@Override
	public Element getBaseElement() {
		List<Element> baseElements =  new ArrayList<Element>();
		for (Element e : elements) {
			baseElements.add(e.getBaseElement());
		}
		return new JoinElement(baseElements);
	}	
}
