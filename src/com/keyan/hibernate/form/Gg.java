package com.keyan.hibernate.form;

import java.sql.Timestamp;

/**
 * Gg entity. @author MyEclipse Persistence Tools
 */
public class Gg extends AbstractGg implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Gg() {
	}

	/** full constructor */
	public Gg(String context, Timestamp shijian) {
		super(context, shijian);
	}

}
