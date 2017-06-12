package com.keyan.hibernate.form;

import java.util.Date;

/**
 * Info entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Info extends AbstractInfo implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Info() {
	}

	/** full constructor */
	public Info(String infoform, String infoto, String context, String fujian,
			Date infotime) {
		super(infoform, infoto, context, fujian, infotime);
	}

}
