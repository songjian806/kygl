package com.keyan.hibernate.form;

import java.util.Date;

/**
 * Zhuanli entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Zhuanli extends AbstractZhuanli implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Zhuanli() {
	}

	/** full constructor */
	public Zhuanli(String ZName, String ZPost, String ZDept, String ZTitle,
			String ZType, String ZId, String ZState, String ZNum, Date ZTime,
			String ZAward, String ZOthers, String ZScore, String ZRemarks,
			Integer ZMembers, String Second, String Third, String Achnum,
			Float Point, String Unitnum, String Zusernum, String Znamenum) {
		super(ZName, ZPost, ZDept, ZTitle, ZType, ZId, ZState, ZNum, ZTime,
				ZAward, ZOthers, ZScore, ZRemarks, ZMembers, Second, Third,
				Achnum, Point, Unitnum, Zusernum, Znamenum);
	}

}
