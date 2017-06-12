package com.keyan.hibernate.form;

/**
 * Project1 entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Project1 extends AbstractProject1 implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Project1() {
	}

	/** full constructor */
	public Project1(String pname, String pnum,  String pcontrol,
			String pstate1, String pstate2, String pstate3, String pcome,
			String pclassify, String pdept, String pstar, String pfinish,
			String padjuct, String pform, String pstatus, String premark,
			String other,String usernum) {
		super(pname, pnum, pcontrol, pstate1, pstate2, pstate3, pcome,
				pclassify, pdept, pstar, pfinish, padjuct, pform, pstatus,
				premark, other,usernum);
	}

}
