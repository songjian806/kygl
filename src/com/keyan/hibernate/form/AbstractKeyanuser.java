package com.keyan.hibernate.form;

/**
 * AbstractKeyanuser entity provides the base persistence definition of the
 * Keyanuser entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public abstract class AbstractKeyanuser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String password;
	private String username;
	private String userclasify;
	private String level;
	private String userdept;
	private String name;
	private String post;
	private String postnum;
	private String tel;
	private String addr;
	private String unitnum;
	private String Email;
	private String deptnum;
	private String checked;
	// Constructors

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	public String getDeptnum() {
		return deptnum;
	}

	public void setDeptnum(String deptnum) {
		this.deptnum = deptnum;
	}

	/** default constructor */
	public AbstractKeyanuser() {
	}

	/** full constructor */
	public AbstractKeyanuser(String password, String username,
			String userclasify, String level, String userdept, String name,
			String post, String postnum, String tel, String addr,
			String unitnum, String Email,String checked) {
		this.password = password;
		this.username = username;
		this.userclasify = userclasify;
		this.level = level;
		this.userdept = userdept;
		this.name = name;
		this.post = post;
		this.postnum = postnum;
		this.tel = tel;
		this.addr = addr;
		this.unitnum = unitnum;
		this.Email = Email;
this.checked=checked;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserclasify() {
		return this.userclasify;
	}

	public void setUserclasify(String userclasify) {
		this.userclasify = userclasify;
	}

	public String getUserdept() {
		return this.userdept;
	}

	public void setUserdept(String userdept) {
		this.userdept = userdept;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getPostnum() {
		return postnum;
	}

	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getUnitnum() {
		return unitnum;
	}

	public void setUnitnum(String unitnum) {
		this.unitnum = unitnum;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}
}