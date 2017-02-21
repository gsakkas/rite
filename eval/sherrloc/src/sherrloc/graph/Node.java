package sherrloc.graph;

import sherrloc.constraint.ast.Element;


/**
 * A node in the constraint graph represents an element in the constraint
 */
public class Node  {
    private int index; 				// index in graph, used to quickly retrieve a node from graph
    private Element element;
    private boolean shouldprint;
    private boolean iscause;
          
	/**
	 * @param index
	 *            Index of all nodes in graph. Used to quickly retrieve a node
	 * @param element
	 *            An element that the constructed node represents
	 */
    public Node(int index, Element element) {
        shouldprint = false;
        iscause = false;
        this.index = index;
        this.element = element;
    }
        
	/**
	 * Mart the node as relevant to the error. Such information is useful for
	 * producing a program slicing contributing to the error
	 */
    public void setCause () {
        iscause = true;
    }
    
    /**
     * @return True if the node contributes to some error
     */
    public boolean isCause () {
        return iscause;
    }
    
    /**
     * Mark a node as printable in the DOT output
     */
    public void markAsPrint () {
    	shouldprint = true;
    }

    /**
     * @return True if the node should be printed in the DOT output
     */
    public boolean shouldPrint () {
    	return shouldprint;
    }
            
    /**
     * @return Index of the node
     */
    public int getIndex() {
		return index;
	}
    
    /**
     * @return Corresponding element in constraints
     */
    public Element getElement() {
		return element;
	}
    
	/**
	 * Increase # satisfiable path using the element that this node is
	 * representing
	 */
    public void incSuccCounter () {
        element.incSuccCounter();
    }
    
    /**
	 * @return # satisfiable path using the element that this node is
	 *         representing
	 */
    public int getSuccCounter () {
		return element.getSuccCounter();
	}
    
    /**
     * @return An unique id for the node
     */
    public String getUid () {
    	return "v"+index;
    }
    
    /**
     * @return Node representation in DOT format
     */
    public String toDotString () {
        if (isCause())
            return  getUid() + " [style=filled, fillcolor=yellow, label=\"" + element.toDotString()+ "\"];\n";
        else
            return  getUid() + " [label=\"" + element.toDotString()+ "\"];\n";
    }
            
    @Override
    public String toString() {
        return element.toDetailString();
    }
}
