package com.keyan.hibernate.form;

/**
 * Keshitable entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Keshitable extends AbstractKeshitable implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Keshitable() {
	}

	/** full constructor */
	public Keshitable(String keshiName, Integer deptId, Integer type) {
		super(keshiName, deptId, type);
	}

}
