package sherrloc.diagnostic;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import sherrloc.graph.ConstraintPath;
import sherrloc.graph.Node;
import sherrloc.util.HTMLUtil;
import sherrloc.util.PrettyPrinter;

/**
 * A set of unsatisfiable paths identified in constraint analysis
 */
public class UnsatPaths implements PrettyPrinter {
	private Set<ConstraintPath> errPaths;

	public UnsatPaths() {
		errPaths = new HashSet<ConstraintPath>();
	}

	/**
	 * Add an unsatisfiable path
	 * 
	 * @param path
	 *            An unsatisfiable path to be added
	 */
	public void addUnsatPath(ConstraintPath path) {
		errPaths.add(path);
	}

	/**
	 * @return # of unsatisfiable paths identified
	 */
	public int size() {
		return errPaths.size();
	}

	/**
	 * @return All unsatisfiable paths
	 */
	public Set<ConstraintPath> getPaths() {
		return errPaths;
	}

	@Override
	public String toHTMLString() {
		StringBuffer sb = new StringBuffer();
		sb.append("<H3>");
		sb.append(size() + " error" + (size() == 1 ? "" : "s") + " found ");
		sb.append("<button onclick=\"show_all_errors()\">show more details</button><br>\n");
		sb.append("</H3>");
		sb.append("<div id=\"all_error\">");

		sb.append("<UL>\n");
		for (ConstraintPath path : errPaths) {
			StringBuffer path_buff = new StringBuffer();
			List<Node> nodes = path.getLeqNodes();
			for (Node n : nodes) {
				path_buff.append("['pathelement', \'"
						+ n.getElement().getPosition() + "\'], ");
			}
			sb.append("<LI>\n<span class=\"path\" ");
			HTMLUtil.setShowHideActions(sb, true, path_buff.toString(), 0);
			sb.append(">");
			sb.append("A value with type " + path.getFirstElement()
					+ " is being used at type " + path.getLastElement());
			sb.append("</span>\n");
			sb.append("<button onclick=\"hide_all();show_elements_perm(true, [");
			sb.append(path_buff.toString());
			sb.append("])\" ");
			sb.append(">show it</button><br>\n");
		}
		sb.append("</UL>\n");
		sb.append("</div>\n");
		return sb.toString();
	}

	@Override
	public String toConsoleString() {
		StringBuffer sb = new StringBuffer();
		sb.append(size() + " error" + (size() == 1 ? "" : "s") + " found \n");
		sb.append(toString());
		return null;
	}

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		for (ConstraintPath path : errPaths) {
			sb.append("A value with type " + path.getFirstElement()
					+ " is being used at type " + path.getLastElement());
		}
		return sb.toString();
	}
}
