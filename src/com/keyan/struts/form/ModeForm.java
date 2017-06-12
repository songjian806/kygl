package com.keyan.struts.form;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class ModeForm extends ActionForm {
	private FormFile file;
	private String id;
	private String xmname;
	private String  pici;
	private String  jf_name;
	private String  fuzeren;
	private String  fenlei;
	private String  time;
	private String  jf_score;
	private String renyuan;
	private String beizhu;
	private String musernum;
	public String getMusernum() {
		return musernum;
	}
	public void setMusernum(String musernum) {
		this.musernum = musernum;
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
	public void setRenyuan(String renyuan) {
		this.renyuan = renyuan;
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
	
	public String getJf_name() {
		return jf_name;
	}
	public void setJf_name(String jf_name) {
		this.jf_name = jf_name;
	}
	public String getJf_score() {
		return jf_score;
	}
	public void setJf_score(String jf_score) {
		this.jf_score = jf_score;
	}
	public String getFuzeren() {
		return fuzeren;
	}
	public void setFuzeren(String fuzeren) {
		this.fuzeren = fuzeren;
	}
	public String getFenlei() {
		return fenlei;
	}
	public void setFenlei(String fenlei) {
		this.fenlei = fenlei;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	private String xmjingfei;
	private String bokuanzt ;
	public FormFile getFile() {
		return file;
	}
	public void setFile(FormFile file) {
		this.file = file;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXmjingfei() {
		return xmjingfei;
	}
	public void setXmjingfei(String xmjingfei) {
		this.xmjingfei = xmjingfei;
	}
	public String getBokuanzt() {
		return bokuanzt;
	}
	public void setBokuanzt(String bokuanzt) {
		this.bokuanzt = bokuanzt;
	}
	
	
}
