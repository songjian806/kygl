package com.keyan.hibernate.form;

/**
 * AbstractKeshitable entity provides the base persistence definition of the
 * Keshitable entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractKeshitable implements java.io.Serializable {

	// Fields

	private Integer id;
	private String keshiName;
	private Integer deptId;
	private Integer type;

	// Constructors

	/** default constructor */
	public AbstractKeshitable() {
	}

	/** full constructor */
	public AbstractKeshitable(String keshiName, Integer deptId, Integer type) {
		this.keshiName = keshiName;
		this.deptId = deptId;
		this.type = type;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getKeshiName() {
		return this.keshiName;
	}

	public void setKeshiName(String keshiName) {
		this.keshiName = keshiName;
	}

	public Integer getDeptId() {
		return this.deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

}