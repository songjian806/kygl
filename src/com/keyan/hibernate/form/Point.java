package com.keyan.hibernate.form;

/**
 * Point entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Point implements java.io.Serializable {

	// Fields

	private Integer id;
	private String achNum;
	private String achName;
	private Float point;

	// Constructors

	/** default constructor */
	public Point() {
	}

	/** full constructor */
	public Point(String achNum, String achName, Float point) {
		this.achNum = achNum;
		this.achName = achName;
		this.point = point;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAchNum() {
		return this.achNum;
	}

	public void setAchNum(String achNum) {
		this.achNum = achNum;
	}

	public String getAchName() {
		return this.achName;
	}

	public void setAchName(String achName) {
		this.achName = achName;
	}

	public Float getPoint() {
		return this.point;
	}

	public void setPoint(Float point) {
		this.point = point;
	}

}