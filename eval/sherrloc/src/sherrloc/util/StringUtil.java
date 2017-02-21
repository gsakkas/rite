package sherrloc.util;

/**
 * Some utilities on String
 */
public class StringUtil {
	
	/** 
	 * Generate simple names for DOT files
	 * 
	 * @param name
	 * @return simplified name
	 */
	public static String getPrettyName (String name) {
    	int i=0;
    	for (; i<name.length(); i++) {
    		if (name.charAt(i)>='0' && name.charAt(i)<='9')
    			break;
    	}
    	if (i!=0)
    		return name.substring(0, i);
    	else
    		return name;
	}
	
    /**
	 * This function is used to filter out characters that can not be prettily
	 * printed in the DOT format such as " and \n
	 * 
	 * @param s
	 *            A string to output to a DOT file
	 * @return A string without " and \
	 */
    public static String sanitize (String s) {
        if (s!=null)
            return s.replace('"', '\'').replace("\\", "\\\\");
        else
            return s;
    }
}
