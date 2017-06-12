package com.keyan.hibernate.form;

/**
 * Post entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Post extends AbstractPost implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Post() {
	}

	/** full constructor */
	public Post(String postnum, String postname, Float task) {
		super(postnum, postname, task);
	}

}
