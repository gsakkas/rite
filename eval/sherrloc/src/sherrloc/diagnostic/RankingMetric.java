package sherrloc.diagnostic;

/**
 * The ranking metric used to rank error explanations. Refer to section 5.1 in
 * paper "Toward General Diagnosis of Static Errors" by Danfeng Zhang and Andrew
 * C. Myers for more insights behind this ranking metric
 */
public class RankingMetric {
	private double P1 = 3;
    private double P2 = 1;
	
    /**
     * Metric with default parameters
     */
	public RankingMetric() {
	}
	
	/**
	 * Set metric parameters to arguments
	 * 
	 * @param P1
	 *            Weight of explanation size
	 * @param P2
	 *            Weight of # satisfiable paths using the elements in
	 *            explanation
	 */
	public RankingMetric(double P1, double P2) {
		this.P1 = P1;
		this.P2 = P2;
	}
	
	/**
	 * @param setsize
	 *            Size of the suggestion
	 * @param succ
	 *            # Successful paths using elements in the suggestion
	 * @return <code>P1*setsize+P2*succ</code>
	 */
	public double getScore(double setsize, double succ) {
    	return P1*setsize + P2*succ;
    }
}
