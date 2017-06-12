package com.keyan.hibernate.form;

import java.util.Date;

/**
 * Mtable entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Mtable extends AbstractMtable implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Mtable() {
	}

	/** full constructor */
	public Mtable(String meetingName, String meetingType, Date startTime,
			Date endTime, String courseName, String address, Integer type1) {
		super(meetingName, meetingType, startTime, endTime, courseName,
				address, type1);
	}

}
