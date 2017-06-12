package com.keyan.hibernate.form;

import java.util.Date;

/**
 * AbstractInfo entity provides the base persistence definition of the Info
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractInfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String infoform;
	private String infoto;
	private String context;
	private String fujian;
	private Date infotime;

	// Constructors

	/** default constructor */
	public AbstractInfo() {
	}

	/** full constructor */
	public AbstractInfo(String infoform, String infoto, String context,
			String fujian, Date infotime) {
		this.infoform = infoform;
		this.infoto = infoto;
		this.context = context;
		this.fujian = fujian;
		this.infotime = infotime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getInfoform() {
		return this.infoform;
	}

	public void setInfoform(String infoform) {
		this.infoform = infoform;
	}

	public String getInfoto() {
		return this.infoto;
	}

	public void setInfoto(String infoto) {
		this.infoto = infoto;
	}

	public String getContext() {
		return this.context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getFujian() {
		return this.fujian;
	}

	public void setFujian(String fujian) {
		this.fujian = fujian;
	}

	public Date getInfotime() {
		return this.infotime;
	}

	public void setInfotime(Date infotime) {
		this.infotime = infotime;
	}

}