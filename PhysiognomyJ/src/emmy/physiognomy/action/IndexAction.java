package emmy.physiognomy.action;

import com.opensymphony.xwork2.Action;

public class IndexAction implements Action {
	
	/**
	 * evoke execute function
	 */
	@Override
	public String execute() throws Exception {
		// Jump to the default page: struts.xml<result>
		return SUCCESS;
	}
}