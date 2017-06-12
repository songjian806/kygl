package com.keyan.hibernate.form;

import java.util.Date;

/**
 * Projectcg entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Projectcg extends AbstractProjectcg implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Projectcg() {
	}

	/** full constructor */
	public Projectcg(String PName, String PPost, String PDept,
			String PTitle, String PUnit, String PId, Date PTime,
			String POthers, String PScore, String PRemarks, Integer PMembers, String Second, String Third, String Achnum, Float Point,String Unitnum,String Pusernum,String Pnum) {
		super(PName, PPost, PDept, PTitle, PUnit, PId, PTime, POthers, PScore,
				PRemarks,PMembers, Second, Third,Achnum,Point,Unitnum,Pusernum,Pnum);
	}

}
