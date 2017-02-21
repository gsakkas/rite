package sherrloc.constraint.ast;

import java.util.ArrayList;
import java.util.List;

/**
 * Meet of constraint elements
 */
public class MeetElement extends EnumerableElement {
	
	/**
	 * @param elements A list of meet components
	 */
	public MeetElement(List<Element> elements) {
		super ("", elements);
		flat();
	}
	
	/**
	 * flatten nested meet elements
	 */
	private void flat () {
		List<Element> flat = new ArrayList<Element>();
		for (Element e : elements) {
			if (e instanceof MeetElement) {
				flat.addAll(((MeetElement) e).elements);
			}
			else
				flat.add(e);
		}
		elements = flat;
	}
	
	@Override
	public String toString( ) {
		return infixToString();
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
		return "meet";
	}
		
	@Override
	public boolean equals (Object o) {
		if (this==o)
			return true;
		
		if (o instanceof MeetElement) {
			return super.equals(o) && pos.equals(((MeetElement) o).pos);
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return super.hashCode()+2434;
	}
	
	@Override
	public boolean isTop() {
		for (Element e : elements) {
			if (!e.isTop())
				return false;
		}
		return true;
	}
	
	@Override
	public boolean isBottom() {
		for (Element e : elements) {
			if (e.isBottom())
				return true;
		}
		return false;
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
	public Element getBaseElement() {
		List<Element> baseElements =  new ArrayList<Element>();
		for (Element e : elements) {
			baseElements.add(e.getBaseElement());
		}
		return new MeetElement(baseElements);
	}
}
