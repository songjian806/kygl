package com.keyan.hibernate.form;

import java.util.Date;

/**
 * AbstractZhuanli entity provides the base persistence definition of the
 * Zhuanli entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractZhuanli implements java.io.Serializable {

	// Fields
	private String Zusernum;

	private String Znamenum;
	private Integer id;
	private String ZName;
	private String ZPost;
	private String ZDept;
	private String ZTitle;
	private String ZType;
	private String ZId;
	private String ZState;
	private String ZNum;
	private Date ZTime;
	private String ZAward;
	private String ZOthers;
	private String ZScore;
	private String ZRemarks;
	private String Second;
	private String Third;
	private String Achnum;
	private Float Point = 120f;
	private String Unitnum;
	private Integer ZMembers;

	// Constructors
	public String getZusernum() {
		return Zusernum;
	}

	public void setZusernum(String zusernum) {
		Zusernum = zusernum;
	}

	public Integer getZMembers() {
		return ZMembers;
	}

	public void setZMembers(Integer zMembers) {
		ZMembers = zMembers;
	}

	/** default constructor */
	public AbstractZhuanli() {
	}

	/** full constructor */
	public AbstractZhuanli(String ZName, String ZPost, String ZDept,
			String ZTitle, String ZType, String ZId, String ZState,
			String ZNum, Date ZTime, String ZAward, String ZOthers,
			String ZScore, String ZRemarks, Integer ZMembers, String Second,
			String Third, String Achnum, Float Point, String Unitnum,
			String Zusernum, String Znamenum) {
		this.ZName = ZName;
		this.ZPost = ZPost;
		this.ZDept = ZDept;
		this.ZTitle = ZTitle;
		this.ZType = ZType;
		this.ZId = ZId;
		this.ZState = ZState;
		this.ZNum = ZNum;
		this.ZTime = ZTime;
		this.ZAward = ZAward;
		this.ZOthers = ZOthers;
		this.ZScore = ZScore;
		this.ZRemarks = ZRemarks;
		this.Second = Second;
		this.Third = Third;
		this.Achnum = Achnum;
		// this.Point = Point;
		this.Unitnum = Unitnum;
		this.ZMembers = ZMembers;
		this.Zusernum = Zusernum;
		this.Znamenum = Znamenum;

	}

	// Property accessors

	public String getZnamenum() {
		return Znamenum;
	}

	public void setZnamenum(String znamenum) {
		Znamenum = znamenum;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getZName() {
		return this.ZName;
	}

	public void setZName(String ZName) {
		this.ZName = ZName;
	}

	public String getZPost() {
		return this.ZPost;
	}

	public void setZPost(String ZPost) {
		this.ZPost = ZPost;
	}

	public String getZDept() {
		return this.ZDept;
	}

	public void setZDept(String ZDept) {
		this.ZDept = ZDept;
	}

	public String getZTitle() {
		return this.ZTitle;
	}

	public void setZTitle(String ZTitle) {
		this.ZTitle = ZTitle;
	}

	public String getZType() {
		return this.ZType;
	}

	public void setZType(String ZType) {
		this.ZType = ZType;
	}

	public String getZId() {
		return this.ZId;
	}

	public void setZId(String ZId) {
		this.ZId = ZId;
	}

	public String getZState() {
		return this.ZState;
	}

	public void setZState(String ZState) {
		this.ZState = ZState;
	}

	public String getZNum() {
		return this.ZNum;
	}

	public void setZNum(String ZNum) {
		this.ZNum = ZNum;
	}

	public Date getZTime() {
		return this.ZTime;
	}

	public void setZTime(Date ZTime) {
		this.ZTime = ZTime;
	}

	public String getZAward() {
		return this.ZAward;
	}

	public void setZAward(String ZAward) {
		this.ZAward = ZAward;
	}

	public String getZOthers() {
		return this.ZOthers;
	}

	public void setZOthers(String ZOthers) {
		this.ZOthers = ZOthers;
	}

	public String getZScore() {
		return this.ZScore;
	}

	public void setZScore(String ZScore) {
		this.ZScore = ZScore;
	}

	public String getZRemarks() {
		return this.ZRemarks;
	}

	public void setZRemarks(String ZRemarks) {
		this.ZRemarks = ZRemarks;
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