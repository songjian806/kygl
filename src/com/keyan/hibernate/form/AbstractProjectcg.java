package com.keyan.hibernate.form;

import java.util.Date;

/**
 * AbstractProjectcg entity provides the base persistence definition of the
 * Projectcg entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractProjectcg implements java.io.Serializable {

	// Fields
	private String Pnum;
	private String Pusernum;
	private Integer id;
	private String PName;
	private String PPost;
	private String PDept;
	private String PTitle;
	private String PUnit;
	private String PId;
	private Date PTime;
	private String POthers;
	private String PScore;
	private String PRemarks;
	private String Second;
	private String Third;
	private String Achnum;
	private Float Point = 100f;
	private String Unitnum;
	private Integer PMembers;

	// Constructors

	public Integer getPMembers() {
		return PMembers;
	}

	public String getPusernum() {
		return Pusernum;
	}

	public void setPusernum(String pusernum) {
		Pusernum = pusernum;
	}

	public void setPMembers(Integer pMembers) {
		PMembers = pMembers;	
	}

	/** default constructor */
	public AbstractProjectcg() {
	}

	public String getPnum() {
		return Pnum;
	}

	public void setPnum(String pnum) {
		Pnum = pnum;
	}

	/** full constructor */
	public AbstractProjectcg(String PName, String PPost, String PDept,
			String PTitle, String PUnit, String PId, Date PTime,
			String POthers, String PScore, String PRemarks, Integer PMembers,
			String Second, String Third, String Achnum, Float Point,
			String Unitnum, String Pusernum, String Pnum) {
		this.PName = PName;
		this.PPost = PPost;
		this.PDept = PDept;
		this.PTitle = PTitle;
		this.PUnit = PUnit;
		this.PId = PId;
		this.PTime = PTime;
		this.POthers = POthers;
		this.PScore = PScore;
		this.PRemarks = PRemarks;
		this.Second = Second;
		this.Third = Third;
		this.Achnum = Achnum;
		// this.Point = Point;
		this.Unitnum = Unitnum;
		this.PMembers = PMembers;
		this.Pusernum = Pusernum;
		this.Pnum = Pnum;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPName() {
		return this.PName;
	}

	public void setPName(String PName) {
		this.PName = PName;
	}

	public String getPPost() {
		return this.PPost;
	}

	public void setPPost(String PPost) {
		this.PPost = PPost;
	}

	public String getPDept() {
		return this.PDept;
	}

	public void setPDept(String PDept) {
		this.PDept = PDept;
	}

	public String getPTitle() {
		return this.PTitle;
	}

	public void setPTitle(String PTitle) {
		this.PTitle = PTitle;
	}

	public String getPUnit() {
		return this.PUnit;
	}

	public void setPUnit(String PUnit) {
		this.PUnit = PUnit;
	}

	public String getPId() {
		return this.PId;
	}

	public void setPId(String PId) {
		this.PId = PId;
	}

	public Date getPTime() {
		return this.PTime;
	}

	public void setPTime(Date PTime) {
		this.PTime = PTime;
	}

	public String getPOthers() {
		return this.POthers;
	}

	public void setPOthers(String POthers) {
		this.POthers = POthers;
	}

	public String getPScore() {
		return this.PScore;
	}

	public void setPScore(String PScore) {
		this.PScore = PScore;
	}

	public String getPRemarks() {
		return this.PRemarks;
	}

	public void setPRemarks(String PRemarks) {
		this.PRemarks = PRemarks;
	}

	public String getSecond() {
		return Second;
	}

	public void setSecond(String second) {
		Second = second;
	}

	public String getThird() {
		return Third;
	}

	public void setThird(String third) {
		Third = third;
	}

	public String getAchnum() {
		return Achnum;
	}

	public void setAchnum(String achnum) {
		Achnum = achnum;
	}

	public Float getPoint() {
		return Point;
	}

	public void setPoint(Float point) {
		Point = point;
	}

	public String getUnitnum() {
		return Unitnum;
	}

	public void setUnitnum(String unitnum) {
		Unitnum = unitnum;
	}

}