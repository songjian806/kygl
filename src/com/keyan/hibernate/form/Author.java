package com.keyan.hibernate.form;

/**
 * Author entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Author extends AbstractAuthor implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Author() {
	}

	/** full constructor */
	public Author(String name, String post, String dept) {
		super(name, post, dept);
	}

}
