/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.keyan.struts.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 03-05-2011
 * 
 * XDoclet definition:
 * @struts.form name="Pppeople"
 */
public class PppeopleForm extends ActionForm {
	/*
	 * Generated fields
	 */
	private Integer ppid;
	/** pptype property */
	private String pptype;

	/** ppwoke property */
	private Integer ppwork;

	/** ppname property */
	private String ppname;

	/** ppusernum property */
	private String ppusernum;

	

	/** pid property */
	private Integer pid;
    
	/** ppnum property */
	private Integer ppnum;

	/*
	 * Generated Methods
	 */
	private String ppdept;
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
	 * Returns the pptype.
	 * @return String
	 */
	public String getPptype() {
		return pptype;
	}

	/** 
	 * Set the pptype.
	 * @param pptype The pptype to set
	 */
	public void setPptype(String pptype) {
		this.pptype = pptype;
	}

	public String getPpusernum() {
		return ppusernum;
	}

	public void setPpusernum(String ppusernum) {
		this.ppusernum = ppusernum;
	}

	/** 
	 * Returns the ppname.
	 * @return String
	 */
	public String getPpname() {
		return ppname;
	}

	/** 
	 * Set the ppname.
	 * @param ppname The ppname to set
	 */
	public void setPpname(String ppname) {
		this.ppname = ppname;
	}

	/** 
	 * Returns the ppdept.
	 * @return String
	 */
	public String getPpdept() {
		return ppdept;
	}

	/** 
	 * Set the ppdept.
	 * @param ppdept The ppdept to set
	 */
	public void setPpdept(String ppdept) {
		this.ppdept = ppdept;
	}
    public Integer getPpid() {
		return ppid;
	}

	public void setPpid(Integer ppid) {
		this.ppid = ppid;
	}

	public void setPpwork(Integer ppwork) {
		this.ppwork = ppwork;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public void setPpnum(Integer ppnum) {
		this.ppnum = ppnum;
	}

	

	public Integer getPpwork() {
		return ppwork;
	}

	public Integer getPpnum() {
		return ppnum;
	}

	public Integer getPid() {
		return pid;
	}
}