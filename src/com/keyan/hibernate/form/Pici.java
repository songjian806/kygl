package com.keyan.hibernate.form;

/**
 * Pici entity.
 * 
 * @author MyEclipse Persistence Tools
 */
public class Pici extends AbstractPici implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Pici() {
	}

	/** full constructor */
	public Pici(String pcname, String pcstate, String pccome, String pcclasify,
			String pcstar, String pcfinish, String pcremark) {
		super(pcname, pcstate, pccome, pcclasify, pcstar, pcfinish, pcremark);
	}

}
