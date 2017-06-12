package com.keyan.hibernate.form;

import java.util.Date;

/**
 * AbstractWork entity provides the base persistence definition of the Work
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractWork implements java.io.Serializable {

	// Fields

	private Integer id;
	private String WName;
	private String WPost;
	private String WUnit;
	private String WTitle;
	private String WPublisher;
	private String WIsbnid;
	private Date WTime;
	private String WOthers;
	private String WScore;
	private String WRemarks;
	private String Second;
	private String Third;
	private String Achnum;
	private Float Point = 80f;
	private String Unitnum;
	private Integer WMembers;
	private String Wusernum;
	private String WOthersnum;
	private String Wnum;

	public String getWusernum() {
		return Wusernum;
	}

	public void setWusernum(String wusernum) {
		Wusernum = wusernum;
	}

	public String getWOthersnum() {
		return WOthersnum;
	}

	public void setWOthersnum(String wOthersnum) {
		WOthersnum = wOthersnum;
	}

	public String getSecondnum() {
		return Secondnum;
	}

	public void setSecondnum(String secondnum) {
		Secondnum = secondnum;
	}

	public String getThirdmnum() {
		return Thirdmnum;
	}

	public void setThirdmnum(String thirdmnum) {
		Thirdmnum = thirdmnum;
	}

	private String Secondnum;
	private String Thirdmnum;

	// Constructors

	public Integer getWMembers() {
		return WMembers;
	}

	public void setWMembers(Integer wMembers) {
		WMembers = wMembers;
	}

	/** default constructor */
	public AbstractWork() {
	}

	/** full constructor */
	public AbstractWork(String WName, String WPost, String WUnit,
			String WTitle, String WPublisher, String WIsbnid, Date WTime,
			String WOthers, String WScore, String WRemarks, Integer WMembers,
			String Second, String Third, String Achnum, Float Point,
			String Unitnum, String Secondnum, String Thirdnum,
			String WOthersnum, String Wusernum, String Wnum) {
		this.WName = WName;
		this.WPost = WPost;
		this.WUnit = WUnit;
		this.WTitle = WTitle;
		this.WPublisher = WPublisher;
		this.WIsbnid = WIsbnid;
		this.WTime = WTime;
		this.WOthers = WOthers;
		this.WScore = WScore;
		this.WRemarks = WRemarks;
		this.Second = Second;
		this.Third = Third;
		this.Achnum = Achnum;
		this.Unitnum = Unitnum;
		this.WMembers = WMembers;
		this.Secondnum = Secondnum;
		this.Thirdmnum = Thirdnum;
		this.WOthersnum = WOthersnum;
		this.Wusernum = Wusernum;
		this.Wnum = Wnum;
	}

	// Property accessors

	public String getWnum() {
		return Wnum;
	}

	public void setWnum(String wnum) {
		Wnum = wnum;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getWName() {
		return this.WName;
	}

	public void setWName(String WName) {
		this.WName = WName;
	}

	public String getWPost() {
		return this.WPost;
	}

	public void setWPost(String WPost) {
		this.WPost = WPost;
	}

	public String getWUnit() {
		return this.WUnit;
	}

	public void setWUnit(String WUnit) {
		this.WUnit = WUnit;
	}

	public String getWTitle() {
		return this.WTitle;
	}

	public void setWTitle(String WTitle) {
		this.WTitle = WTitle;
	}

	public String getWPublisher() {
		return this.WPublisher;
	}

	public void setWPublisher(String WPublisher) {
		this.WPublisher = WPublisher;
	}

	public String getWIsbnid() {
		return this.WIsbnid;
	}

	public void setWIsbnid(String WIsbnid) {
		this.WIsbnid = WIsbnid;
	}

	public Date getWTime() {
		return this.WTime;
	}

	public void setWTime(Date WTime) {
		this.WTime = WTime;
	}

	public String getWOthers() {
		return this.WOthers;
	}

	public void setWOthers(String WOthers) {
		this.WOthers = WOthers;
	}

	public String getWScore() {
		return this.WScore;
	}

	public void setWScore(String nintegerteger) {
		this.WScore = nintegerteger;
	}

	public String getWRemarks() {
		return this.WRemarks;
	}

	public void setWRemarks(String WRemarks) {
		this.WRemarks = WRemarks;
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