package com.keyan.hibernate.form;

/**
 * AbstractPost entity provides the base persistence definition of the Post
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractPost implements java.io.Serializable {

	// Fields

	private Integer id;
	private String postnum;
	private String postname;
	private Float task;

	// Constructors

	/** default constructor */
	public AbstractPost() {
	}

	/** full constructor */
	public AbstractPost(String postnum, String postname, Float task) {
		this.postnum = postnum;
		this.postname = postname;
		this.task = task;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPostnum() {
		return this.postnum;
	}

	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}

	public String getPostname() {
		return this.postname;
	}

	public void setPostname(String postname) {
		this.postname = postname;
	}

	public Float getTask() {
		return this.task;
	}

	public void setTask(Float task) {
		this.task = task;
	}

}