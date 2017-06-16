package com.keyan.hibernate.form;

/**
 * Keyanuser entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Keyanuser extends AbstractKeyanuser implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Keyanuser() {
	}

	/** full constructor */
	public Keyanuser(String password, String username, String userclasify,String level,String userdept, String name, String post, String postnum, String tel, String addr, String unitnum, String Email,String checked) {
		super(password, username, userclasify,level,userdept,name,post,postnum,tel,addr, unitnum,Email,checked);
	}

}
