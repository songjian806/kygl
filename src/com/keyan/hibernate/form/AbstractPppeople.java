package com.keyan.hibernate.form;

/**
 * AbstractPppeople entity provides the base persistence definition of the
 * Pppeople entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractPppeople implements java.io.Serializable {

	// Fields

	private Integer ppid;
	private String ppname;
	private Integer pid;
	private Integer ppnum;
	private String ppdept;
	private Integer ppwork;
	private String pptype;
	private String ppusernum;

	// Constructors

	/** default constructor */
	public AbstractPppeople() {
	}

	/** full constructor */
	public AbstractPppeople(String ppname, Integer pid, Integer ppnum,
			String ppdept, Integer ppwork, String pptype, String ppusernum) {
		this.ppname = ppname;
		this.pid = pid;
		this.ppnum = ppnum;
		this.ppdept = ppdept;
		this.ppwork = ppwork;
		this.pptype = pptype;
		this.ppusernum = ppusernum;
	}

	// Property accessors

	public String getPpusernum() {
		return ppusernum;
	}

	public void setPpusernum(String ppusernum) {
		this.ppusernum = ppusernum;
	}

	public Integer getPpid() {
		return this.ppid;
	}

	public void setPpid(Integer ppid) {
		this.ppid = ppid;
	}

	public String getPpname() {
		return this.ppname;
	}

	public void setPpname(String ppname) {
		this.ppname = ppname;
	}

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getPpnum() {
		return this.ppnum;
	}

	public void setPpnum(Integer ppnum) {
		this.ppnum = ppnum;
	}

	public String getPpdept() {
		return this.ppdept;
	}

	public void setPpdept(String ppdept) {
		this.ppdept = ppdept;
	}

	public Integer getPpwork() {
		return this.ppwork;
	}

	public void setPpwork(Integer ppwork) {
		this.ppwork = ppwork;
	}

	public String getPptype() {
		return this.pptype;
	}

	public void setPptype(String pptype) {
		this.pptype = pptype;
	}

}