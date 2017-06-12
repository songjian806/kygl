package com.keyan.hibernate.form;

import java.util.Date;

/**
 * Thesis entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Thesis extends AbstractThesis implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Thesis() {
	}

	/** full constructor */
	public Thesis(String TName, String TPost, String TUnit, String TTitle,
			String TPeriodical, String TCnid, String TIssnid, Date TTime,
			String TOthers, String TScore, String TRemarks, Integer TMembers,
			String Second, String Third, String Achnum, Float Point,
			String Unitnum, String Tusernum, String Tnum) {
		super(TName, TPost, TUnit, TTitle, TPeriodical, TCnid, TIssnid, TTime,
				TOthers, TScore, TRemarks, TMembers, Second, Third, Achnum,
				Point, Unitnum, Tusernum, Tnum);
	}

}
