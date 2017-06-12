package com.keyan.hibernate.form;

import java.util.Date;

public class Mode extends AbstractMode implements java.io.Serializable {

	public Mode() {
	}

	public Mode(String bokuanzt, String beizhu, String JingFei,
			String xmjingfei, String JFScore, String xmname, String pici,
			String renyuan, String JFName, String fenlei, Date time,
			String musernum) {
		super(JingFei, xmjingfei, xmjingfei, xmname, pici, renyuan, JFName,
				JFScore, time, beizhu, bokuanzt, musernum);
	}
}
