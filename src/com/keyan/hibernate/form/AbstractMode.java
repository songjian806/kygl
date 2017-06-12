package com.keyan.hibernate.form;

import java.util.Date;

/**
 * AbstractAuthor entity provides the base persistence definition of the Author
 * entity.
 * 
 * @author MyEclipse Persistence Tools
 */
// 初始化作者属性
public abstract class AbstractMode implements java.io.Serializable {

	// Fields
	private String beizhu;
	private String xmname;
	private String pici;
	private String renyuan;
	private String JFName;
	private String fenlei;
	private Date time;
	private Integer id;
	private String JingFei;
	private String xmjingfei;
	private String JFScore;
	private String bokuanzt;
	private String musernum;

	public AbstractMode() {

	}

	;

	public AbstractMode(String JingFei, String xmjingfei, String JFScore,
			String xmname, String pici, String renyuan, String JFName,
			String fenlei, Date time, String beizhu, String bokuanzt,
			String musernum) {
		this.fenlei = fenlei;
		this.xmname = xmname;
		this.pici = pici;
		this.renyuan = renyuan;
		this.JFName = JFName;
		this.fenlei = fenlei;
		this.time = time;
		this.JingFei = JingFei;
		this.JFScore = JFScore;
		this.xmjingfei = xmjingfei;
		this.beizhu = beizhu;
		this.bokuanzt = bokuanzt;
		this.musernum = musernum;
	}

	public String getBokuanzt() {
		return bokuanzt;
	}

	public void setBokuanzt(String bokuanzt) {
		this.bokuanzt = bokuanzt;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getRenyuan() {
		return renyuan;
	}

	public String getMusernum() {
		return musernum;
	}

	public void setMusernum(String musernum) {
		this.musernum = musernum;
	}

	public void setRenyuan(String renyuan) {
		this.renyuan = renyuan;
	}

	public String getJFName() {
		return JFName;
	}

	public void setJFName(String jFName) {
		JFName = jFName;
	}

	public String getJFScore() {
		return JFScore;
	}

	public void setJFScore(String jFScore) {
		JFScore = jFScore;
	}

	public Integer getId() {
		return id;
	}

	public String getXmname() {
		return xmname;
	}

	public void setXmname(String xmname) {
		this.xmname = xmname;
	}

	public String getPici() {
		return pici;
	}

	public void setPici(String pici) {
		this.pici = pici;
	}

	public String getrenyuan() {
		return renyuan;
	}

	public void setrenyuan(String renyuan) {
		this.renyuan = renyuan;
	}

	public String getFenlei() {
		return fenlei;
	}

	public void setFenlei(String fenlei) {
		this.fenlei = fenlei;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getJingFei() {
		return JingFei;
	}

	public void setJingFei(String jingFei) {
		JingFei = jingFei;
	}

	public String getXmjingfei() {
		return xmjingfei;
	}

	public void setXmjingfei(String xmjingfei) {
		this.xmjingfei = xmjingfei;
	}

	// Constructors

}