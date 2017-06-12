package com.keyan.hibernate.form;

/**
 * Pppeople entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Pppeople extends AbstractPppeople implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Pppeople() {
	}

	/** full constructor */
	public Pppeople(String ppname, Integer pid, Integer ppnum, String ppdept,
			Integer ppwork, String pptype,String ppusernum) {
		super(ppname, pid, ppnum, ppdept, ppwork, pptype,ppusernum);
	}

}
