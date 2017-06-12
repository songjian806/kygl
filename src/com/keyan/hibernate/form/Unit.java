package com.keyan.hibernate.form;

/**
 * Unit entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Unit implements java.io.Serializable {

	// Fields

	private Integer id;
	private String unitnum;
	private String unitname;
	private String secretary;
	private String tel;
	private String email;

	// Constructors

	/** default constructor */
	public Unit() {
	}

	/** full constructor */
	public Unit(String unitnum, String unitname, String secretary, String tel,
			String email) {
		this.unitnum = unitnum;
		this.unitname = unitname;
		this.secretary = secretary;
		this.tel = tel;
		this.email = email;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUnitnum() {
		return this.unitnum;
	}

	public void setUnitnum(String unitnum) {
		this.unitnum = unitnum;
	}

	public String getUnitname() {
		return this.unitname;
	}

	public void setUnitname(String unitname) {
		this.unitname = unitname;
	}

	public String getSecretary() {
		return this.secretary;
	}

	public void setSecretary(String secretary) {
		this.secretary = secretary;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}