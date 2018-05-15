package emmy.physiognomy.model;

public class PhysiognomyData {
	// file name
	private String filename;

	// folder name
	private String folderName;

	// eyebrow，[style code, match degree, length of eye, distance of eyebrows, wide of the image of eyebrow part only]
	private String[] browStyle;

	// left eye，[style code, match degree]
	private String[] leftEye;

	// right eye，[style code, match degree]
	private String[] rightEye;

	// overlapped eyes，[style code, match degree]
	private String[] avgEye;

	// lips，[style code]
	private String lipStyle;

	// eyes' top5 matched result for charting
	private String leftEyeData;
	private String rightEyeData;
	private String avgEyeData;

	// distance of eyebrows for charting
	private String browData;

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFolderName() {
		return folderName;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}

	public String[] getBrowStyle() {
		return browStyle;
	}

	public void setBrowStyle(String[] browStyle) {
		this.browStyle = browStyle;
	}

	public String[] getLeftEye() {
		return leftEye;
	}

	public void setLeftEye(String[] leftEye) {
		this.leftEye = leftEye;
	}

	public String[] getRightEye() {
		return rightEye;
	}

	public void setRightEye(String[] rightEye) {
		this.rightEye = rightEye;
	}

	public String[] getAvgEye() {
		return avgEye;
	}

	public void setAvgEye(String[] avgEye) {
		this.avgEye = avgEye;
	}

	public String getLipStyle() {
		return lipStyle;
	}

	public void setLipStyle(String lipStyle) {
		this.lipStyle = lipStyle;
	}

	public String getLeftEyeData() {
		return leftEyeData;
	}

	public void setLeftEyeData(String leftEyeData) {
		this.leftEyeData = leftEyeData;
	}

	public String getRightEyeData() {
		return rightEyeData;
	}

	public void setRightEyeData(String rightEyeData) {
		this.rightEyeData = rightEyeData;
	}

	public String getAvgEyeData() {
		return avgEyeData;
	}

	public void setAvgEyeData(String avgEyeData) {
		this.avgEyeData = avgEyeData;
	}

	public String getBrowData() {
		return browData;
	}

	public void setBrowData(String browData) {
		this.browData = browData;
	}
}
