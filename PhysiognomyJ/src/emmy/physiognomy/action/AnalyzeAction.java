package emmy.physiognomy.action;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import emmy.physiognomy.bo.PhysiognomyBO;
import emmy.physiognomy.model.AnalyzeResult;

public class AnalyzeAction implements Action {

	private File image; // uploaded file
	private String imageFileName; // file name
	private String imageContentType; // file type
	private String absolutePath;// file directory 
	private String folderName;// folder name

	/**
	 * evoke execute fuction
	 */
	@Override
	public String execute() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();

		// Save file
		this.saveFile();

		PhysiognomyBO physiognomyBO = new PhysiognomyBO();
		// Analyze image
	
		AnalyzeResult analyzeResult = physiognomyBO.analyze(absolutePath, imageFileName, folderName);

		// Save analysis result to session
		session.setAttribute("analyzeResult", analyzeResult);

		// Jump to default page: struts.xml<result>
		return SUCCESS;
	}

	/**
	 * Save file
	 */
	private void saveFile() {
		// trigger processor if not empty
		if (image != null && imageFileName != null && imageFileName.length() != 0) {
			// get the filename suffix
			int last = imageFileName.lastIndexOf(".");

			String type = imageFileName.substring(last);

			// Create file name
			imageFileName = "origin" + type;

			// Generate random unique code by java build in UUID
			String randomCode = UUID.randomUUID().toString();

			// File name
			folderName = randomCode;

			// Get file directory
			absolutePath = ServletActionContext.getServletContext().getRealPath("/uploadImages") + "/" + folderName
					+ "/";

			// Create file object based on file directory and file name
			File saveFile = new File(absolutePath + imageFileName);

			// Create folder
			saveFile.getParentFile().mkdirs();
			try {
				// Save file
				FileUtils.copyFile(image, saveFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getAbsolutePath() {
		return absolutePath;
	}

	public void setAbsolutePath(String absolutePath) {
		this.absolutePath = absolutePath;
	}

	public String getFolderName() {
		return folderName;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}
}