package com.keyan.hibernate.form;

/**
 * Depttable entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Depttable extends AbstractDepttable implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Depttable() {
	}

	/** full constructor */
	public Depttable(String deptName, String leader, Integer jiaoshoucount,
			Integer fujiaoshou, Integer jiangshi, Integer zhujiao,
			Integer keshi, Integer jigou) {
		super(deptName, leader, jiaoshoucount, fujiaoshou, jiangshi, zhujiao,
				keshi, jigou);
	}

}
