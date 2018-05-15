package emmy.physiognomy.action;

import com.opensymphony.xwork2.Action;

public class DetailAction implements Action {
	
	/**
	 * evoke execute function
	 */
	@Override
	public String execute() throws Exception {
		// Jump to default page: struts.xml<result>
		return SUCCESS;
	}
}