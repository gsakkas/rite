package sherrloc.diagnostic;

import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import sherrloc.constraint.analysis.ConstraintAnalysis;
import sherrloc.constraint.analysis.ConstraintAnalysisImpl;
import sherrloc.constraint.parse.GrmLexer;
import sherrloc.constraint.parse.parser;
import sherrloc.graph.ConstraintGraph;
import sherrloc.util.HTMLUtil;
import sherrloc.util.PrettyPrinter;

/**
 * The top level interface for error diagnosis
 */
public class ErrorDiagnosis implements PrettyPrinter {
	private DiagnosticOptions option;
	private ConstraintGraph graph;	// a constraint graph from constraints
	private ConstraintAnalysis cana;
	
	/** internal states */
	HTMLUtil util;
	
	/**
	 * @param g
	 *            A constraint graph construction from constraint file
	 * @param option
	 *            A configuration of the error diagnostic tool
	 */
	private ErrorDiagnosis(ConstraintGraph g, DiagnosticOptions option) {
		graph = g;
		this.option = option;
        util = new HTMLUtil();
        cana = new ConstraintAnalysisImpl(g.isSymmetric(), option.isVerbose(), option.isRecursive());
	}

	/**
	 * Get an analysis instance from options
	 * 
	 * @param option
	 *            Configurations
	 * @return An analysis instance
	 * @throws Exception
	 */
	static public ErrorDiagnosis getAnalysisInstance (DiagnosticOptions option) throws Exception {
	    parser p = new parser(new GrmLexer(new InputStreamReader(new FileInputStream(option.getConsFile()), "UTF-8")));
	    DiagnosisInput result = (DiagnosisInput) p.parse().value;

	    ConstraintGraph graph = new ConstraintGraph(result.getEnv(), result.getConstraints());
	    graph.generateGraph();
	    ErrorDiagnosis ret = new ErrorDiagnosis(graph, option);
	    return ret;
	}
	
	/**
	 * Get an analysis instance from a constraint file. Useful for unit tests
	 * 
	 * @param consFile
	 *            Constraint file
	 * @return An analysis instance
	 * @throws Exception
	 */
	static public ErrorDiagnosis getAnalysisInstance (String consFile, boolean isExpr) throws Exception {
		DiagnosticOptions option = new DiagnosticOptions(consFile, isExpr);
		
	    return getAnalysisInstance(option);
	}
	
	/**
	 * @return Number of unsatisfiable paths identified
	 */
	public int getUnsatPathNumber() {
	 	return cana.genErrorPaths(graph).size();
	}
	
	/**
	 * Use a error diagnosis algorithm as specified in configuration to find the
	 * most likely cause of the error
	 * 
	 * @param paths
	 *            A set of unsatisfiable paths
	 * @return The most likely cause of the error
	 */
    public String getSuggestions (UnsatPaths paths) {
    	StringBuffer sb = new StringBuffer();
    	
    	if (option.isGenHypothesis()) {
    		sb.append((new MissingHypoInfer(paths, option)).infer());
    	}
    	if (option.isGenConstraints()) {
    		sb.append((new ConstraintInfer(paths, option)).infer());
    	}
    	if (option.isGenElements()) {
    		sb.append((new ExprInfer(paths, graph.getAllNodes(), option)).infer());
    	}
    	if (option.isGenBoth()) {
    		sb.append(new UnifiedExplanationInfer(paths, option).infer());
    	}
    	
    	return sb.toString();
    }
    
    /**
     * Output the result into a format specified in configuration
     */
    public void writeToOutput () {
		if (option.isDotFile()) {
			writeToDotFile();
		}
		if (option.isToConsole())
			System.out.println(toConsoleString());
		else
			writeToHTML();
    }
        
    /**
     * Output constraint graph in DOT format
     */
    private void writeToDotFile () {
        String filename;
        filename = "error.dot";

        try {
            FileOutputStream fstream = new FileOutputStream(filename);
            OutputStreamWriter out = new OutputStreamWriter(fstream,"UTF-8");
            out.write(toDotString());
            out.close();
        } catch (IOException e) {
            System.out.println("Unable to write the DOT file to: " + filename);
        }
    }
    
    /**
     * Output error report in HTML format
     */
    private void writeToHTML () {
        try {
            FileOutputStream fstream = new FileOutputStream(option.getHtmlFileName());
            BufferedWriter out = new BufferedWriter(new OutputStreamWriter(fstream, "UTF-8"));
            out.write(toHTMLString());
            out.close();
        } catch (IOException e) {
            System.out.println("Unable to write the HTML file to: " + option.getHtmlFileName());
        }
    }
    
    @Override
    public String toHTMLString() {
    	StringBuffer sb = new StringBuffer();
    
		UnsatPaths paths = cana.genErrorPaths(graph);
        
        sb.append(HTMLUtil.getHeader());
//        sb.append(HTMLUtil.getFeedback());
    	
    	sb.append( "<!-- ======== START OF ERROR REPORT ======== -->\n" +
    			"<H2>\n" +
    			"<BR>\n" +
    			"Error Diagnostic Report </H2>\n" +
    			"<HR>\n");
    	
    	// type check succeeded
    	if (paths.size()==0) {
			sb.append("<H2>The program passed program analysis. No errors were found.</H2>");
            sb.append("<script type=\"text/javascript\">"+
                      "document.getElementById('feedback').style.display = 'none';</script>");
    	}
    	else {
    		sb.append(getSuggestions(paths));
     		sb.append("<HR>\n" + paths.toHTMLString());
            sb.append("<button onclick=\"hide_all()\">hide all highlights</button><br>\n");

			if (option.getSourceName() != null) {
				sb.append(util.genAnnotatedCode(paths, option.getSourceName())
						+ (option.getSourceName().contains("jif") ? ("<script>colorize_all(); numberSuggestions();</script>\n")
								: ("<script>numberSuggestions();</script>\n")));
			}
        }
    	sb.append(HTMLUtil.getTail());
    	return sb.toString();
    }
                
    @Override
    public String toConsoleString () {
		UnsatPaths paths = cana.genErrorPaths(graph);

        // type check succeeded
        if (paths.size()==0) {
			return ("The program passed program analysis. No errors were found.");
		} else {
			return (getSuggestions(paths));
		}
    }
    
    /** 
     * @return Output the constraint graph as a string in DOT format
     */
    public String toDotString() {
    	if (option.isWholeGraph()) 
        	graph.labelAll();
        else
        	graph.slicing();
        return graph.toDotString();
    }
    
	/**
	 * Command line interface
	 */
	public static void main(String[] args) {

		DiagnosticOptions option = new DiagnosticOptions(args);

		try {
			ErrorDiagnosis ana = ErrorDiagnosis.getAnalysisInstance(option);
			ana.writeToOutput();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
