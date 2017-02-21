package sherrloc.constraint.ast;

/**
 * Relation on constraint elements. It can either be <= (LEQ) or == (EQ)
 */
public enum Relation {
	LEQ, EQ;

	@Override
	public String toString() {
		String s = super.toString();
		if (s.equals("LEQ"))
			return "<=";
		else
			return "==";
	}
};
