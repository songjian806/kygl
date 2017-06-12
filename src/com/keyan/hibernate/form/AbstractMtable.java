package com.keyan.hibernate.form;

import java.util.Date;

/**
 * AbstractMtable entity provides the base persistence definition of the Mtable
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractMtable implements java.io.Serializable {

	// Fields

	private Integer id;
	private String meetingName;
	private String meetingType;
	private Date startTime;
	private Date endTime;
	private String courseName;
	private String address;
	private Integer type1;

	// Constructors

	/** default constructor */
	public AbstractMtable() {
	}

	/** full constructor */
	public AbstractMtable(String meetingName, String meetingType,
			Date startTime, Date endTime, String courseName, String address,
			Integer type1) {
		this.meetingName = meetingName;
		this.meetingType = meetingType;
		this.startTime = startTime;
		this.endTime = endTime;
		this.courseName = courseName;
		this.address = address;
		this.type1 = type1;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMeetingName() {
		return this.meetingName;
	}

	public void setMeetingName(String meetingName) {
		this.meetingName = meetingName;
	}

	public String getMeetingType() {
		return this.meetingType;
	}

	public void setMeetingType(String meetingType) {
		this.meetingType = meetingType;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getCourseName() {
		return this.courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getType1() {
		return this.type1;
	}

	public void setType1(Integer type1) {
		this.type1 = type1;
	}

}