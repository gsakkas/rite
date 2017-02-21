package sherrloc.util;

/**
 * Generate proper strings for different output formats
 */
public interface PrettyPrinter {

	/**
	 * Proper string for the HTML format
	 */
	public String toHTMLString ();
		
	/**
	 * Proper string for the console (plain text)
	 */
	public String toConsoleString ();
}
