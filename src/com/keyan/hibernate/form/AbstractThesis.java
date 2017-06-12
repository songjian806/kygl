package com.keyan.hibernate.form;

import java.util.Date;

/**
 * AbstractThesis entity provides the base persistence definition of the Thesis
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractThesis implements java.io.Serializable {

	// Fields

	private Integer id;
	private String TName;
	private String TPost;
	private String TUnit;
	private String TTitle;
	private String TPeriodical;
	private String TCnid;
	private String TIssnid;
	private Date TTime;
	private String TOthers;
	private String TScore;
	private String TRemarks;
	private String Second;
	private String Third;
	private String Achnum;
	private Float Point;
	private String Unitnum;
	private Integer TMembers;
	private String Tusernum;
	private String Tnum;

	// Constructors

	public String getTusernum() {
		return Tusernum;
	}

	public void setTusernum(String tusernum) {
		Tusernum = tusernum;
	}

	public Integer getTMembers() {
		return TMembers;
	}

	public void setTMembers(Integer tMembers) {
		TMembers = tMembers;
	}

	/** default constructor */
	public AbstractThesis() {
	}

	public String getTnum() {
		return Tnum;
	}

	public void setTnum(String tnum) {
		Tnum = tnum;
	}

	/** full constructor */
	public AbstractThesis(String TName, String TPost, String TUnit,
			String TTitle, String TPeriodical, String TCnid, String TIssnid,
			Date TTime, String TOthers, String TScore, String TRemarks,
			Integer TMembers, String Second, String Third, String Achnum,
			Float Point, String Unitnum, String Tusernum, String Tnum) {
		this.TName = TName;
		this.TPost = TPost;
		this.TUnit = TUnit;
		this.TTitle = TTitle;
		this.TPeriodical = TPeriodical;
		this.TCnid = TCnid;
		this.TIssnid = TIssnid;
		this.TTime = TTime;
		this.TOthers = TOthers;
		this.TScore = TScore;
		this.TRemarks = TRemarks;
		this.Second = Second;
		this.Third = Third;
		this.Achnum = Achnum;
		// this.Point = Point;
		this.Unitnum = Unitnum;
		this.TMembers = TMembers;
		this.Tusernum = Tusernum;
		this.Tnum = this.Tnum;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTTitle() {
		return this.TTitle;
	}

	public void setTTitle(String TTitle) {
		this.TTitle = TTitle;
	}

	public String getTPeriodical() {
		return this.TPeriodical;
	}

	public void setTPeriodical(String TPeriodical) {
		this.TPeriodical = TPeriodical;
	}

	public String getTCnid() {
		return this.TCnid;
	}

	public void setTCnid(String TCnid) {
		this.TCnid = TCnid;
	}

	public String getTIssnid() {
		return this.TIssnid;
	}

	public void setTIssnid(String TIssnid) {
		this.TIssnid = TIssnid;
	}

	public Date getTTime() {
		return this.TTime;
	}

	public void setTTime(Date TTime) {
		this.TTime = TTime;
	}

	public String getTOthers() {
		return this.TOthers;
	}

	public void setTOthers(String TOthers) {
		this.TOthers = TOthers;
	}

	public String getTScore() {
		return this.TScore;
	}

	public void setTScore(String TScore) {
		this.TScore = TScore;
	}

	public String getTRemarks() {
		return this.TRemarks;
	}

	public void setTRemarks(String TRemarks) {
		this.TRemarks = TRemarks;
	}

	public String getTName() {
		return this.TName;
	}

	public void setTName(String TName) {
		this.TName = TName;
	}

	public String getTPost() {
		return this.TPost;
	}

	public void setTPost(String TPost) {
		this.TPost = TPost;
	}

	public String getTUnit() {
		return this.TUnit;
	}

	public void setTUnit(String TUnit) {
		this.TUnit = TUnit;
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