package sherrloc.constraint.ast;

import java.util.ArrayList;
import java.util.List;

import sherrloc.util.StringUtil;

/**
 * This class represents constraint variable to be inferred
 */
public class Variable extends Element {
	
	/**
	 * @param name Variable name
	 */
	public Variable(String name) {
		super(name, Position.EmptyPosition());
	}
		
	@Override
	public List<Variable> getVars () {
		List<Variable> ret = new ArrayList<Variable>();
		ret.add(this);
		return ret;
	}
	
	@Override
	public boolean hasVars() {
		return true;
	}
	
	@Override
	public boolean equals(Object o) {
		if (o instanceof Variable) {
			return this.name==((Variable)o).name;
		}
		return false;
	}
		
	@Override
	public String toString() {
		return toSnippetString();
	}
	
	@Override
	public int hashCode() {
		return name.hashCode();
	}
	
	@Override
	public String toDotString() {
		return StringUtil.getPrettyName(name);
	}
		
	@Override
	public boolean isBottom() {
		return false;
	}
	
	@Override
	public boolean isTop() {
		return false;
	}
	
	@Override
	public boolean trivialEnd() {
		return true;
	}
	
	@Override
	public Element getBaseElement() {
		return this;
	}
}
