
package sherrloc.diagnostic;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.commons.cli.PosixParser;

/**
 * A configuration of the error diagnostic tool
 */
public class DiagnosticOptions {
	/** a set of options */
	private boolean wholeGraph;
	private boolean genConstraints;
	private boolean genElements;
	private boolean genHypothesis;
	private boolean genBoth;
	private boolean recursive;
	private boolean verbose;
	private boolean dotFile;
	private boolean toConsole;
	private int nSubopt;

	/** input/output files */
	private String sourceName;
	private String htmlFileName;
	private String consFile;

	/**
	 * Setup configuration without a command line. Used for unit tests
	 * 
	 * @param consFile
	 *            Input constraint file name
	 * @param isExpr
	 *            Set "True" to infer likely wrong expressions in program; set
	 *            "False" to infer likely missing hypothesis
	 */
	public DiagnosticOptions(String consFile, boolean isExpr) {
		setDefault();
		this.consFile = consFile;
		this.genElements = isExpr;
		this.genHypothesis = !isExpr;
		this.toConsole = true;
	}

	/**
	 * Get options from command line
	 * 
	 * @param args
	 *            Command line input
	 */
	public DiagnosticOptions(String[] args) {
		Options options = new Options();		
		options.addOption("c", false, "generate likely wrong constraints");
		options.addOption("d", false, "output the constraint graph as a DOT file");
		options.addOption("e", false, "generate likely wrong constraint elements");
		options.addOption("f", false, "show full constraint graph (use with -d)");
		options.addOption("h", false, "generate likely missing hypothesis");
		options.addOption("n", true,  "number of suboptimal suggestions to report. Default value is zero");
		options.addOption("o", true,  "output file");
		options.addOption("r", false, "allow recursion (e.g., x = list x)");
		options.addOption("s", true,  "the source file that generated the constraints (use with -w)");
		options.addOption("u", false, "unified report with wrong constraint elements and missing hypothesis (experimental)");
		options.addOption("v", false, "verbose mode (for evaluation)");
		options.addOption("w", false, "HTML report");

		CommandLineParser parser = new PosixParser();
		CommandLine cmd = null;
		try {
			cmd = parser.parse(options, args);
		} catch (ParseException e) {
			HelpFormatter formatter = new HelpFormatter();
			formatter.printHelp("diagnostic <options> <constraint file>", options);
			System.exit(-1);
		}

		setDefault();
		if (cmd.hasOption("c"))
			genConstraints = true;
		if (cmd.hasOption("d"))
			dotFile = true;
		if (cmd.hasOption("e"))
			genElements = true;
		if (cmd.hasOption("f"))
			wholeGraph = true;
		if (cmd.hasOption("h"))
			genHypothesis = true;
		if (cmd.hasOption("n")) {
			try {
				nSubopt = Integer.parseInt(cmd.getOptionValue("n"));
			}
			catch (NumberFormatException exp) {
				System.out.println("-n requires an integer parameter");
				System.exit(0);
			}
		}
		if (cmd.hasOption("o"))
			htmlFileName = cmd.getOptionValue("o");
		if (cmd.hasOption("r"))
			recursive = true;
		if (cmd.hasOption("s"))
			sourceName = cmd.getOptionValue("s");
		if (cmd.hasOption("u"))
			genBoth = true;
		if (cmd.hasOption("v"))
			verbose = true;
		if (cmd.hasOption("w"))
			toConsole = false;

		if (cmd.getArgs().length == 0) {
			System.out.println("Please privide a constraint file to be analyzed");
			System.exit(0);
		} else if (!genConstraints && !genElements && !genHypothesis && !genBoth) {
			System.out.println("Please set at least one of report type: -c -e -h or -u");
			System.exit(0);
		}
		consFile = cmd.getArgs()[0];
	}

	/**
	 * Set all options to default values
	 */
	private void setDefault() {
		dotFile = false;
		genBoth = false;
		genConstraints = false;
		genElements = false;
		genHypothesis = false;
		wholeGraph = false;
		toConsole = true;
		recursive = false;
		verbose = false;
		htmlFileName = "error.html";
		nSubopt = 0;
	}

	/**
	 * @return Input constraint file
	 */
	public String getConsFile() {
		return consFile;
	}

	/**
	 * @return Output HTML file when provided. The default value "error.html" is
	 *         returned otherwise
	 */
	public String getHtmlFileName() {
		return htmlFileName;
	}

	/**
	 * @return The source file of program analysis (e.g., OCaml, Jif programs)
	 *         for locating error cause in source file in the HTML output format
	 */
	public String getSourceName() {
		return sourceName;
	}

	/**
	 * @return True to output the constraint graph as a DOT file
	 */
	public boolean isDotFile() {
		return dotFile;
	}

	/**
	 * @return True to generate combined explanations (a mix of wrong
	 *         expressions and missing hypothesis in general)
	 */
	public boolean isGenBoth() {
		return genBoth;
	}

	/**
	 * @return True to generate likely wrong constraints
	 */
	public boolean isGenConstraints() {
		return genConstraints;
	}
	
	/**
	 * @return True to generate likely wrong expressions
	 */
	public boolean isGenElements() {
		return genElements;
	}

	/**
	 * @return True to generate likely missing hypothesis
	 */
	public boolean isGenHypothesis() {
		return genHypothesis;
	}

	/**
	 * @return True to allow recursion in constraints (e.g., x = list x)
	 */
	public boolean isRecursive() {
		return recursive;
	}

	/**
	 * @return True to show the error report on console
	 */
	public boolean isToConsole() {
		return toConsole;
	}

	/**
	 * @return True to collect data for evaluation
	 */
	public boolean isVerbose() {
		return verbose;
	}

	/**
	 * @return True to output the entire constraint graph when -d is set
	 */
	public boolean isWholeGraph() {
		return wholeGraph;
	}
	
	/**
	 * @return Number of suboptimal suggestions to report
	 */
	public int getNSubopt() {
		return nSubopt;
	}
}