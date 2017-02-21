package sherrloc.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import sherrloc.constraint.ast.Position;
import sherrloc.diagnostic.UnsatPaths;
import sherrloc.graph.ConstraintEdge;
import sherrloc.graph.ConstraintPath;
import sherrloc.graph.Edge;
import sherrloc.graph.Node;

/**
 * Several methods for generating HTML output
 */
public class HTMLUtil {
	
	/**
	 * @return Feedback form
	 */
    public static String getFeedback() {
    	StringBuffer sb = new StringBuffer();
    	sb.append("<div id=feedback class=feedback>\r\n");
    	sb.append("<form method=\"POST\" action=\"submit.pl\" accept-charset=\"UTF-8\">");

    	sb.append("Please rate this error diagnosis:<br>\r\n");

    	sb.append("<input type=\"radio\" name=\"helpfulness\" value=\"1\"> 1. not helpful\r\n");
    	sb.append("<input type=\"radio\" name=\"helpfulness\" value=\"2\"> 2. somewhat helpful\r\n");
    	sb.append("<input type=\"radio\" name=\"helpfulness\" value=\"3\"> 3. helpful\r\n");
    	sb.append("<input type=\"radio\" name=\"helpfulness\" value=\"4\"> 4. very helpful\r\n");
    	sb.append("<input type=\"radio\" name=\"helpfulness\" value=\"5\"> 5. extremely helpful\r\n");
    	
    	sb.append("<p>How does it compare in usefulness to the error message you get from OCaml?<br>\r\n");
    	sb.append("<input type=\"radio\" name=\"comparison\" value=\"1\"> 1. much worse\r\n");
    	sb.append("<input type=\"radio\" name=\"comparison\" value=\"2\"> 2. worse\r\n");
    	sb.append("<input type=\"radio\" name=\"comparison\" value=\"3\"> 3. about the same\r\n");
    	sb.append("<input type=\"radio\" name=\"comparison\" value=\"4\"> 4. better\r\n");
    	sb.append("<input type=\"radio\" name=\"comparison\" value=\"5\"> 5. much better\r\n");
    	
    	sb.append("<p>If you think you know where the error is in the program, please enter the line number:</p>");
    	sb.append("<input type=\"text\" name=\"errorloc\" />");
    	
    	sb.append("<p>If you have any other comments about how this diagnosis " +
    			"(or this tool) could be improved, you may enter them here:</p>\r\n");
    	sb.append("<textarea name=\"comments\" rows=\"2\" cols=\"50\" /></textarea>\r\n");
    	sb.append("<input type=\"submit\" value=\"Submit\"></div>\r\n");
    	sb.append("</form>\r\n");
    	sb.append("<button id=\"hide_button\" onclick=\"hide_feedback_form()\">show/hide</button>\r\n");
	
    	sb.append("</div>\r\n");
    	
    	return sb.toString();
    }
    
    /**
     * @return HTML header
     */
    public static String getHeader () {

    	return "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
    			"<HTML xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"en-US\" xml:lang=\"en-US\">\n" +
    			"<HEAD>\n" +
    			"<meta http-equiv=\"Content-Type\" content=\"text/html\"; charset=\"utf-8\" />\n" +
    			"<TITLE>\n" +
    			"Error Diagnostic Report\n" +
    			"</TITLE>\n" +
    			"<SCRIPT type=\"text/javascript\">\n" +
    					"function windowTitle()\n" +
    					"{\n" +
    					"\tif (location.href.indexOf('is-external=true') == -1) {\n" +
    					"\t\tparent.document.title=\"report\";\n" +
    					"\t}\n" +
    					"}\n" +
    			"</SCRIPT>\n" +
    			
    			"\n<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\"/>\n" +
    			"\n<script src=\"errors.js\"></script>\n" +
    			"\n<script src=\"colorize.js\"></script>\n" +
    			
    			"\n</HEAD>\n" +
    			
    			"\n<BODY BGCOLOR=\"white\" onload=\"windowTitle();\">\n" +
    			"\n";
    }
    
    /**
     * @return HTML tail
     */
    public static String getTail () {
    	return 	"\n\n" +
    			"</BODY>\n" +
    			"</HTML>";
    }

    /**
	 * Enable show/hide all locations provided as a parameter
	 * 
	 * @param sb
	 *            A string buffer to be appended
	 * @param isPath
	 *            True if try to set actions for a constraint path; False for an
	 *            explanation
	 * @param loc
	 *            A string of locations to be highlighted
	 * @param id
	 *            Explanation id, only used when <code>isPath</code> is false
	 */
    public static void setShowHideActions(StringBuffer sb, boolean isPath, String loc, int id) {
		String num = isPath?"true":"false"; 
		sb.append(" onmouseover=\"show_elements("+num+", [");
		sb.append(loc+"]) ");
		if (!isPath)
			sb.append("; show_cut("+id+") ");
		sb.append("\"");
		sb.append(" onmouseout=\"hide_elements("+num+", [");
		sb.append(loc+"]) ");
		if (!isPath)
			sb.append("; hide_cut("+id+") ");
		sb.append("\"");
	}
    
    /**
	 * Wrap the source code so that all locations needed to be highlighted
	 * (e.g., constraint paths, explanations) with "span" annotations for code
	 * highlighting
	 * 
	 * @param unsatPaths
	 *            Unsatisfiable paths identified by constraint analysis
	 * @param sourceName
	 *            Source file
	 * @return Annotated source code so that all locations needed to be
	 *         highlighted are properly labeled
	 */
    public String genAnnotatedCode (UnsatPaths unsatPaths, String sourceName) {
    	StringBuffer sb = new StringBuffer();
    	sb.append("\n<pre class=\"code\" id=\"code\">\n");
    	
    	/** collect all position information, and sort them*/
    	List<LineColumnPair> startList = new ArrayList<LineColumnPair>();
    	List<LineColumnPair> endList = new ArrayList<LineColumnPair>();
    	List<LineColumnPair> emptyList = new ArrayList<LineColumnPair>(); 	// the set where start=end
    	Set<Position> posSet = new HashSet<Position>();						// positions require highlighting
  
    	for (ConstraintPath path : unsatPaths.getPaths()) {
    		Set<Node> nodes = path.getAllNodes();
    		for (Node node : nodes) {
    			Position p = node.getElement().getPosition();
    			if (sourceName.contains(p.getFile())) {
    				posSet.add(p);
    			}
    		}
    		
    		List<Edge> edges = path.getEdges();
    		for (Edge edge : edges) {
    			if(edge instanceof ConstraintEdge) {
    				Position p = ((ConstraintEdge)edge).getConstraint().getPos(); 
    				if (sourceName.contains(p.getFile())) {
    					posSet.add(p);
    				}
    			}
    		}
    	}
    	
    	for (Position pos : posSet) {
			if (!pos.isEmpty()) {
				if (pos.getLineStart() == pos.getLineEnd()
						&& pos.getColStart() == pos.getColEnd())
					emptyList.add(new LineColumnPair(pos.getLineStart(), pos.getColStart(), 
							pos.getLineEnd(), pos.getColEnd(), pos.toString()));
				else {
					startList.add(new LineColumnPair(pos.getLineStart(), pos.getColStart(), 
							pos.getLineEnd(), pos.getColEnd(), pos.toString()));
					endList.add(new LineColumnPair(pos.getLineEnd(), pos.getColEnd(), 
							pos.getLineEnd(), pos.getColEnd(), pos.toString()));
				}
			}
    	}
    	
    	Collections.sort(startList);
    	Collections.sort(endList);
    	Collections.sort(emptyList);
    	
    	int startIndex = 0;
    	int endIndex = 0;
    	int emptyIndex = 0;
		LineColumnPair start, end, empty;
		if (startList.isEmpty())
			start = new LineColumnPair(-1, -1, -1, -1, "");
		else 
			start = startList.get(startIndex++);
		if (endList.isEmpty())
			end = new LineColumnPair(-1, -1, -1, -1, "");
		else
			end = endList.get(endIndex++);
		if (emptyList.isEmpty())
			empty = new LineColumnPair(-1, -1, -1, -1, "");
		else
			empty = emptyList.get(emptyIndex++);
		
    	// add annotations to the source
    	try {
			FileInputStream fstream = new FileInputStream(sourceName);
			BufferedReader in = new BufferedReader(new InputStreamReader(fstream, "UTF-8"));
			String current;
			int currentline = 0;
			while ((current = in.readLine()) != null) {
				currentline++;
				sb.append("<span class=lineno>" + currentline);
				sb.append(".</span>");

				if (end.line != currentline && start.line != currentline && empty.line != currentline) {
					sb.append(current);
					sb.append("\n");
					continue;
				}
				
				int col = 0;
				char[] chars = current.toCharArray();
				for ( ; col<chars.length; col++) {
					// handle end annotation first
					while (end.line==currentline && end.column==col) {
						sb.append("</span>");
						if (endIndex<endList.size())
							end = endList.get(endIndex++);
						else
							break;
					}
					// handle the annotations where start = end
					while (empty.line==currentline && empty.column==col) {
						sb.append("<span class=\"moreinfor\" id=\""+empty.id+"\">");
						sb.append("</span>");
						if (emptyIndex<emptyList.size())
							empty = emptyList.get(emptyIndex++);
						else
							break;
					}
					while (start.line==currentline && start.column==col) {
						sb.append("<span class=\"moreinfor\" id=\""+start.id+"\">");
						if (startIndex<startList.size())
							start = startList.get(startIndex++);
						else
							break;
					}
					sb.append(chars[col]);
				}
				// handle the possible end annotation after the last character
				while (end.line==currentline && end.column>=col) {
					sb.append("</span>");
					if (endIndex<endList.size())
						end = endList.get(endIndex++);
					else
						break;
				}
				sb.append("\n");
			}
			in.close();
		} catch (IOException e) {
			sb.append("Failed to read file: " + sourceName);
		}
		sb.append("</pre>\n");
		return sb.toString();
	}
    
    /**
     * Used to facilitate the ordering of <line, column> pair
     */
    private class LineColumnPair implements Comparable<LineColumnPair> {
    	int line;
    	int column;
    	// the following two field are only used to break ties
    	int endline;
    	int endcol;
    	String id; 
    	
    	public LineColumnPair(int line, int column, int endline, int endcol, String id) {
    		this.line = line;
    		this.column = column;
    		this.endline = endline;
    		this.endcol = endcol;
    		this.id = id;
		}
    	
    	public int compareTo(LineColumnPair p) {
    		if (line!=p.line)
    			return new Integer(line).compareTo(p.line);
    		if (column!=p.column)
    			return new Integer(column).compareTo(p.column);
    		// order is reverse
    		if (endline!=p.endline)
    			return new Integer(p.endline).compareTo(endline);
    		if (endcol!=p.endcol)
    			return new Integer(p.endcol).compareTo(endcol);
    		return 0;
    	}
    	    	
    	@Override
    	public int hashCode() {
    		return id.hashCode();
    	}
    	
    }
}
