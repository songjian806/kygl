package com.keyan.hibernate.form;

/**
 * AbstractPici entity provides the base persistence definition of the Pici
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractPici implements java.io.Serializable {

	// Fields

	private Integer id;
	private String pcname;
	private String pcstate;
	private String pccome;
	private String pcclasify;
	private String pcstar;
	private String pcfinish;
	private String pcremark;

	// Constructors

	/** default constructor */
	public AbstractPici() {
	}

	/** full constructor */
	public AbstractPici(String pcname, String pcstate, String pccome,
			String pcclasify, String pcstar, String pcfinish, String pcremark) {
		this.pcname = pcname;
		this.pcstate = pcstate;
		this.pccome = pccome;
		this.pcclasify = pcclasify;
		this.pcstar = pcstar;
		this.pcfinish = pcfinish;
		this.pcremark = pcremark;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPcname() {
		return this.pcname;
	}

	public void setPcname(String pcname) {
		this.pcname = pcname;
	}

	public String getPcstate() {
		return this.pcstate;
	}

	public void setPcstate(String pcstate) {
		this.pcstate = pcstate;
	}

	public String getPccome() {
		return this.pccome;
	}

	public void setPccome(String pccome) {
		this.pccome = pccome;
	}

	public String getPcclasify() {
		return this.pcclasify;
	}

	public void setPcclasify(String pcclasify) {
		this.pcclasify = pcclasify;
	}

	public String getPcstar() {
		return this.pcstar;
	}

	public void setPcstar(String pcstar) {
		this.pcstar = pcstar;
	}

	public String getPcfinish() {
		return this.pcfinish;
	}

	public void setPcfinish(String pcfinish) {
		this.pcfinish = pcfinish;
	}

	public String getPcremark() {
		return this.pcremark;
	}

	public void setPcremark(String pcremark) {
		this.pcremark = pcremark;
	}

}