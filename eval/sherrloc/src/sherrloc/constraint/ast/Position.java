package sherrloc.constraint.ast;

/**
 * The position of constraint elements and constraints in the source code. The
 * position information is used to 1) map errors in constraints back into source
 * code 2) distinguish uses of same constructor at different locations to
 * improve precision
 */
public class Position {
	private final int lineStart;
	private final int colStart;
	private final int lineEnd;
	private final int colEnd;
	private String snippet;
	private String file;
	private static Position emptyPosition = null;

	/**
	 * @param snippet
	 *            A snippet of source code for more meaningful error reports
	 * @param file
	 *            The source file
	 * @param lStart
	 *            Line start
	 * @param colStart
	 *            Column start
	 * @param lEnd
	 *            Line end
	 * @param colEnd
	 *            Column end
	 */
	public Position(String snippet, String file, int lStart, int colStart,
			int lEnd, int colEnd) {
		this.snippet = snippet;
		this.file = file;
		this.lineStart = lStart;
		this.lineEnd = lEnd;
		if (colStart < colEnd) {
			this.colStart = colStart;
			this.colEnd = colEnd;
		} else {
			this.colEnd = colStart;
			this.colStart = colEnd;
		}
	}

	/**
	 * @return A singleton for empty position
	 */
	public static Position EmptyPosition() {
		if (emptyPosition == null)
			emptyPosition = new Position("", "", -1, -1, -1, -1);
		return emptyPosition;
	}

	/**
	 * @return Start line number
	 */
	public int getLineStart() {
		return lineStart;
	}

	/**
	 * @return End line number
	 */
	public int getLineEnd() {
		return lineEnd;
	}

	/**
	 * @return Start column number
	 */
	public int getColStart() {
		return colStart;
	}

	/**
	 * @return End column number
	 */
	public int getColEnd() {
		return colEnd;
	}

	/**
	 * @return Code snippet when availble in the constraints
	 */
	public String getSnippet() {
		return snippet;
	}

	/**
	 * @param snippet
	 *            Code snippet for the position
	 */
	public void setSnippet(String snippet) {
		this.snippet = snippet;
	}

	/**
	 * @return Source file name
	 */
	public String getFile() {
		return file;
	}

	/**
	 * @param file
	 *            Source file name
	 */
	public void setFile(String file) {
		this.file = file;
	}

	/**
	 * @return True if the position is in a single line
	 */
	public boolean sameline() {
		return lineStart == lineEnd;
	}

	/**
	 * @return True if no position information is available
	 */
	public boolean isEmpty() {
		return lineStart == -1 || snippet.equals("");
	}

	@Override
	public String toString() {
          return "(" + lineStart + "," + colStart + ")-(" + lineEnd + "," + colEnd + ")";
		// if (lineStart == -1)
		// 	return "";

		// String ret = "";
		// if (!file.equals(""))
		// 	ret += file + ":";

		// if (sameline())
		// 	return ret + lineStart + "," + colStart + "-" + colEnd;
		// else
		// 	return ret + lineStart + "," + colStart + "-" + lineEnd + ","
		// 			+ colEnd;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Position) {
			return toString().equals(obj.toString());
		}
		return false;
	}

	@Override
	public int hashCode() {
		return toString().hashCode();
	}
}
