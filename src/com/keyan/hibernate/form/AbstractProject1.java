package com.keyan.hibernate.form;

/**
 * AbstractProject1 entity provides the base persistence definition of the
 * Project1 entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractProject1 implements java.io.Serializable {

	// Fields
	private Integer pid;
	private String pname;
	private String pnum;
	private String pcontrol;
	private String pstate1;
	private String pstate2;
	private String pstate3;
	private String pcome;
	private String pclassify;
	private String pdept;
	private String pstar;
	private String pfinish;
	private String padjuct;
	private String pform;
	private String pstatus;
	private String premark;
	private String other;

	private String usernum;

	// Constructors

	/** default constructor */
	public AbstractProject1() {
	}

	/** full constructor */
	public AbstractProject1(String pname, String pnum, String pcontrol,
			String pstate1, String pstate2, String pstate3, String pcome,
			String pclassify, String pdept, String pstar, String pfinish,
			String padjuct, String pform, String pstatus, String premark,
			String other, String usernum) {
		this.pname = pname;
		this.pnum = pnum;

		this.pcontrol = pcontrol;
		this.pstate1 = pstate1;
		this.pstate2 = pstate2;
		this.pstate3 = pstate3;
		this.pcome = pcome;
		this.pclassify = pclassify;
		this.pdept = pdept;
		this.pstar = pstar;
		this.pfinish = pfinish;
		this.padjuct = padjuct;
		this.pform = pform;
		this.pstatus = pstatus;
		this.premark = premark;
		this.other = other;

		this.usernum = usernum;
	}

	// Property accessors

	public String getUsernum() {
		return usernum;
	}

	public void setUsernum(String usernum) {
		this.usernum = usernum;
	}

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPnum() {
		return this.pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getPcontrol() {
		return this.pcontrol;
	}

	public void setPcontrol(String pcontrol) {
		this.pcontrol = pcontrol;
	}

	public String getPstate1() {
		return this.pstate1;
	}

	public void setPstate1(String pstate1) {
		this.pstate1 = pstate1;
	}

	public String getPstate2() {
		return this.pstate2;
	}

	public void setPstate2(String pstate2) {
		this.pstate2 = pstate2;
	}

	public String getPstate3() {
		return this.pstate3;
	}

	public void setPstate3(String pstate3) {
		this.pstate3 = pstate3;
	}

	public String getPcome() {
		return this.pcome;
	}

	public void setPcome(String pcome) {
		this.pcome = pcome;
	}

	public String getPclassify() {
		return this.pclassify;
	}

	public void setPclassify(String pclassify) {
		this.pclassify = pclassify;
	}

	public String getPdept() {
		return this.pdept;
	}

	public void setPdept(String pdept) {
		this.pdept = pdept;
	}

	public String getPstar() {
		return this.pstar;
	}

	public void setPstar(String pstar) {
		this.pstar = pstar;
	}

	public String getPfinish() {
		return this.pfinish;
	}

	public void setPfinish(String pfinish) {
		this.pfinish = pfinish;
	}

	public String getPadjuct() {
		return this.padjuct;
	}

	public void setPadjuct(String padjuct) {
		this.padjuct = padjuct;
	}

	public String getPform() {
		return this.pform;
	}

	public void setPform(String pform) {
		this.pform = pform;
	}

	public String getPstatus() {
		return this.pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	public String getPremark() {
		return this.premark;
	}

	public void setPremark(String premark) {
		this.premark = premark;
	}

	public String getOther() {
		return this.other;
	}

	public void setOther(String other) {
		this.other = other;
	}

}