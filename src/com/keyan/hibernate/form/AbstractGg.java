package com.keyan.hibernate.form;

import java.sql.Timestamp;

/**
 * AbstractGg entity provides the base persistence definition of the Gg entity. @author
 * MyEclipse Persistence Tools
 */

public abstract class AbstractGg implements java.io.Serializable {

	// Fields

	private Integer id;
	private String context;
	private Timestamp shijian;

	// Constructors

	/** default constructor */
	public AbstractGg() {
	}

	/** full constructor */
	public AbstractGg(String context, Timestamp shijian) {
		this.context = context;
		this.shijian = shijian;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContext() {
		return this.context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Timestamp getShijian() {
		return this.shijian;
	}

	public void setShijian(Timestamp shijian) {
		this.shijian = shijian;
	}

}