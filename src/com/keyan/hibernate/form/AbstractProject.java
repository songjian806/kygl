package com.keyan.hibernate.form;

import java.util.Date;

/**
 * AbstractProject entity provides the base persistence definition of the
 * Project entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractProject implements java.io.Serializable {

	// Fields

	private Integer pid;
	private String pname;
	private String pcomes;
	private String ppeople;
	private String ptype;
	private String pdept;
	private String psource;
	private String pothers;
	private String psp1;
	private String psp2;
	private String plx1;
	private String plx2;
	private String pjx1;
	private String pjx2;
	private Date pspt;
	private Date plxt;
	private Date pjxt;

	// Constructors

	/** default constructor */
	public AbstractProject() {
	}

	/** minimal constructor */
	public AbstractProject(String pname) {
		this.pname = pname;
	}

	/** full constructor */
	public AbstractProject(String pname, String pcomes, String ppeople,
			String ptype, String pdept, String psource, String pothers,
			String psp1, String psp2, String plx1, String plx2, String pjx1,
			String pjx2, Date pspt, Date plxt, Date pjxt) {
		this.pname = pname;
		this.pcomes = pcomes;
		this.ppeople = ppeople;
		this.ptype = ptype;
		this.pdept = pdept;
		this.psource = psource;
		this.pothers = pothers;
		this.psp1 = psp1;
		this.psp2 = psp2;
		this.plx1 = plx1;
		this.plx2 = plx2;
		this.pjx1 = pjx1;
		this.pjx2 = pjx2;
		this.pspt = pspt;
		this.plxt = plxt;
		this.pjxt = pjxt;
	}

	// Property accessors

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

	public String getPcomes() {
		return this.pcomes;
	}

	public void setPcomes(String pcomes) {
		this.pcomes = pcomes;
	}

	public String getPpeople() {
		return this.ppeople;
	}

	public void setPpeople(String ppeople) {
		this.ppeople = ppeople;
	}

	public String getPtype() {
		return this.ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPdept() {
		return this.pdept;
	}

	public void setPdept(String pdept) {
		this.pdept = pdept;
	}

	public String getPsource() {
		return this.psource;
	}

	public void setPsource(String psource) {
		this.psource = psource;
	}

	public String getPothers() {
		return this.pothers;
	}

	public void setPothers(String pothers) {
		this.pothers = pothers;
	}

	public String getPsp1() {
		return this.psp1;
	}

	public void setPsp1(String psp1) {
		this.psp1 = psp1;
	}

	public String getPsp2() {
		return this.psp2;
	}

	public void setPsp2(String psp2) {
		this.psp2 = psp2;
	}

	public String getPlx1() {
		return this.plx1;
	}

	public void setPlx1(String plx1) {
		this.plx1 = plx1;
	}

	public String getPlx2() {
		return this.plx2;
	}

	public void setPlx2(String plx2) {
		this.plx2 = plx2;
	}

	public String getPjx1() {
		return this.pjx1;
	}

	public void setPjx1(String pjx1) {
		this.pjx1 = pjx1;
	}

	public String getPjx2() {
		return this.pjx2;
	}

	public void setPjx2(String pjx2) {
		this.pjx2 = pjx2;
	}

	public Date getPspt() {
		return this.pspt;
	}

	public void setPspt(Date pspt) {
		this.pspt = pspt;
	}

	public Date getPlxt() {
		return this.plxt;
	}

	public void setPlxt(Date plxt) {
		this.plxt = plxt;
	}

	public Date getPjxt() {
		return this.pjxt;
	}

	public void setPjxt(Date pjxt) {
		this.pjxt = pjxt;
	}

}