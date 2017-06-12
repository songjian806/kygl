package com.keyan.hibernate.form;

/**
 * AbstractAuthor entity provides the base persistence definition of the Author
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */
// 初始化作者属性
public abstract class AbstractAuthor implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String post;
	private String dept;

	// Constructors

	/** default constructor */
	public AbstractAuthor() {
	}

	/** full constructor */
	public AbstractAuthor(String name, String post, String dept) {
		this.name = name;
		this.post = post;
		this.dept = dept;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPost() {
		return this.post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getDept() {
		return this.dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

}