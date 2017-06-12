package com.keyan.hibernate.form;

import java.util.Date;

/**
 * Project entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Project extends AbstractProject implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Project() {
	}

	/** minimal constructor */
	public Project(String pname) {
		super(pname);
	}

	/** full constructor */
	public Project(String pname, String pcomes, String ppeople, String ptype,
			String pdept, String psource, String pothers, String psp1,
			String psp2, String plx1, String plx2, String pjx1, String pjx2,
			Date pspt, Date plxt, Date pjxt) {
		super(pname, pcomes, ppeople, ptype, pdept, psource, pothers, psp1,
				psp2, plx1, plx2, pjx1, pjx2, pspt, plxt, pjxt);
	}

}
