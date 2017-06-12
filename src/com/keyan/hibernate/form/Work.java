package com.keyan.hibernate.form;

import java.util.Date;

/**
 * Work entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Work extends AbstractWork implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Work() {
	}

	/** full constructor */
	public Work(String WName, String WPost, String WUnit, String WTitle,
			String WPublisher, String WIsbnid, Date WTime, String WOthers,
			String WScore, String WRemarks, Integer WMembers, String Second,
			String Third, String Achnum, Float Point, String Unitnum,
			String Secondnum, String Thirdnum, String WOthersnum,
			String Wusernum, String Wnum) {
		super(WName, WPost, WUnit, WTitle, WPublisher, WIsbnid, WTime, WOthers,
				WScore, WRemarks, WMembers, Second, Third, Achnum, Point,
				Unitnum, Secondnum, Thirdnum, WOthersnum, Wusernum, Wnum);
	}

}
