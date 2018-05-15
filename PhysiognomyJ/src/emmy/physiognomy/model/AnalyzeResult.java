package emmy.physiognomy.model;

public class AnalyzeResult {
	// state of analyze processor，state value: success、no_facemore_face、fail
	private String code;
	// Chinese resource statement of eyes
	private String statementCN1;
	// Chinese resource statement of eyebrows
	private String statementCN2;
	// Chinese resource statement of lips
	private String statementCN3;

	// English statement of eyes
	private String statementEN1;
	// English resource statement of eyebrows
	private String statementEN2;
	// English resource statement of lips
	private String statementEN3;

	// analysis result
	private PhysiognomyData physiognomyData;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getStatementCN1() {
		return statementCN1;
	}

	public void setStatementCN1(String statementCN1) {
		this.statementCN1 = statementCN1;
	}

	public String getStatementCN2() {
		return statementCN2;
	}

	public void setStatementCN2(String statementCN2) {
		this.statementCN2 = statementCN2;
	}

	public String getStatementCN3() {
		return statementCN3;
	}

	public void setStatementCN3(String statementCN3) {
		this.statementCN3 = statementCN3;
	}

	public String getStatementEN1() {
		return statementEN1;
	}

	public void setStatementEN1(String statementEN1) {
		this.statementEN1 = statementEN1;
	}

	public String getStatementEN2() {
		return statementEN2;
	}

	public void setStatementEN2(String statementEN2) {
		this.statementEN2 = statementEN2;
	}

	public String getStatementEN3() {
		return statementEN3;
	}

	public void setStatementEN3(String statementEN3) {
		this.statementEN3 = statementEN3;
	}

	public PhysiognomyData getPhysiognomyData() {
		return physiognomyData;
	}

	public void setPhysiognomyData(PhysiognomyData physiognomyData) {
		this.physiognomyData = physiognomyData;
	}
}
