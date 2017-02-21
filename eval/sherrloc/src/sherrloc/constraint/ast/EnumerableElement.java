package sherrloc.constraint.ast;

import java.util.ArrayList;
import java.util.List;

/**
 * A constraint element with parameters, such as constructor applications, join
 * and meet elements
 */
public abstract class EnumerableElement extends Element {
	protected List<Element> elements;

	/**
	 * @param name Constructor name
	 * @param elements A list of parameters
	 */
	public EnumerableElement(String name, List<Element> elements) {
		super(name, Position.EmptyPosition());
		this.elements = elements;
	}

	/**
	 * @return A list of parameters
	 */
	public List<Element> getElements() {
		return elements;
	}

	/**
	 * @return the symbol of the current element, such as ->, *, meet, join
	 */
	abstract String getSymbol();

	@Override
	public String toString() {
		String symbol = getSymbol();
		String ret = "";
		// infix
		if (symbol.equals("->") || symbol.equals("*") || symbol.equals("<-")) {
			return infixToString();
		} else {
			ret += symbol;
			for (Element e : elements)
				ret += " (" + e.toString() + ")";
		}
		return ret;
	}

	@Override
	public String toSnippetString() {
		if (!pos.isEmpty()) {
			return pos.getSnippet();
		}
		String symbol = getSymbol();
		String ret = "";
		// infix
		if (symbol.equals("->") || symbol.equals("*") || symbol.equals("<-")) {
			return infixToSnippetString();
		} else {
			ret += symbol;
			for (Element e : elements)
				ret += " (" + e.toSnippetString() + ")";
		}
		return ret;
	}

	@Override
	public String toDotString() {
		String symbol = getSymbol();
		String ret = "";
		// infix
		if (symbol.equals("->") || symbol.equals("*")) {
			return infixToDotString();
		} else {
			ret += symbol;
			for (Element e : elements)
				ret += " (" + e.toDotString() + ")";
		}
		return ret;
	}

	/**
	 * @return Pretty print in infix format
	 */
	protected String infixToString() {
		String symbol = getSymbol();
		String ret = "";
		// infix
		ret += "(" + elements.get(0).toString() + ")";
		for (int j = 1; j < elements.size(); j++)
			ret += symbol + "(" + elements.get(j).toString() + ")";
		return ret;
	}

	
	/**
	 * @return Pretty print in infix format
	 */
	protected String infixToSnippetString() {
		String symbol = getSymbol();
		String ret = "";
		// infix
		ret += "(" + elements.get(0).toSnippetString() + ")";
		for (int j = 1; j < elements.size(); j++)
			ret += symbol + "(" + elements.get(j).toSnippetString() + ")";
		return ret;
	}

	/**
	 * @return Pretty print in infix format
	 */
	protected String infixToDotString() {
		String symbol = getSymbol();
		String ret = "";
		// infix
		ret += "(" + elements.get(0).toDotString() + ")";
		for (int j = 1; j < elements.size(); j++)
			ret += symbol + "(" + elements.get(j).toDotString() + ")";
		return ret;
	}

	@Override
	public List<Variable> getVars() {
		List<Variable> ret = new ArrayList<Variable>();
		for (Element e : elements) {
			ret.addAll(e.getVars());
		}
		return ret;
	}

	@Override
	public boolean hasVars() {
		for (Element e : elements)
			if (e.hasVars())
				return true;
		return false;
	}

	@Override
	public boolean equals(Object o) {
		if (o instanceof EnumerableElement) {
			if (!pos.equals(((EnumerableElement) o).pos))
				return false;
			
			List<Element> list2 = ((EnumerableElement) o).elements;
			for (Element e : elements) {
				if (!list2.contains(e))
					return false;
			}
			for (Element e : list2) {
				if (!elements.contains(e))
					return false;
			}
		}
		return true;
	}

	@Override
	public int hashCode() {
		int ret = 1;
		for (Element e : elements) {
			ret += e.hashCode();
		}
		return ret+pos.hashCode();
	}
}
