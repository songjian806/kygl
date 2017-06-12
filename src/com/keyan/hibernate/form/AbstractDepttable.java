package com.keyan.hibernate.form;

/**
 * AbstractDepttable entity provides the base persistence definition of the
 * Depttable entity.
 * 
 * @author MyEclipse Persistence Tools
 */
// 初始化部门
public abstract class AbstractDepttable implements java.io.Serializable {

	// Fields

	private Integer id;
	private String deptName;
	private String leader;
	private Integer jiaoshoucount;
	private Integer fujiaoshou;
	private Integer jiangshi;
	private Integer zhujiao;
	private Integer keshi;
	private Integer jigou;

	// Constructors

	/** default constructor */
	public AbstractDepttable() {
	}

	/** full constructor */
	public AbstractDepttable(String deptName, String leader,
			Integer jiaoshoucount, Integer fujiaoshou, Integer jiangshi,
			Integer zhujiao, Integer keshi, Integer jigou) {
		this.deptName = deptName;
		this.leader = leader;
		this.jiaoshoucount = jiaoshoucount;
		this.fujiaoshou = fujiaoshou;
		this.jiangshi = jiangshi;
		this.zhujiao = zhujiao;
		this.keshi = keshi;
		this.jigou = jigou;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getLeader() {
		return this.leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public Integer getJiaoshoucount() {
		return this.jiaoshoucount;
	}

	public void setJiaoshoucount(Integer jiaoshoucount) {
		this.jiaoshoucount = jiaoshoucount;
	}

	public Integer getFujiaoshou() {
		return this.fujiaoshou;
	}

	public void setFujiaoshou(Integer fujiaoshou) {
		this.fujiaoshou = fujiaoshou;
	}

	public Integer getJiangshi() {
		return this.jiangshi;
	}

	public void setJiangshi(Integer jiangshi) {
		this.jiangshi = jiangshi;
	}

	public Integer getZhujiao() {
		return this.zhujiao;
	}

	public void setZhujiao(Integer zhujiao) {
		this.zhujiao = zhujiao;
	}

	public Integer getKeshi() {
		return this.keshi;
	}

	public void setKeshi(Integer keshi) {
		this.keshi = keshi;
	}

	public Integer getJigou() {
		return this.jigou;
	}

	public void setJigou(Integer jigou) {
		this.jigou = jigou;
	}

}