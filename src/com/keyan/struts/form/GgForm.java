package com.keyan.struts.form;


import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 10-05-2010
 * 
 * XDoclet definition:
 * @struts.form name="ggForm"
 */
public class GgForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** context property */
	private String context;

	/*
	 * Generated Methods
	 */

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	/** 
	 * Returns the context.
	 * @return String
	 */
	public String getContext() {
		return context;
	}

	/** 
	 * Set the context.
	 * @param context The context to set
	 */
	public void setContext(String context) {
		this.context = context;
	}
}