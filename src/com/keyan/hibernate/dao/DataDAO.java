package com.keyan.hibernate.dao;

import java.io.File;
import java.io.IOException;
import java.util.Date;

public class DataDAO {
	private String str = null;

	public void backup1() {
		Date d = new Date();
		File file = new File(str);
		File file2 = new File("D:\\kygl\\");
		if (!file2.exists()) {
			file2.mkdir();
		}
		File[] f = file.listFiles();
		for (int i = 0; i < f.length; i++) {
			File fille1 = new File("D:\\kygl\\" + f[i].getName());
			f[i].renameTo(fille1);
		}
		Date d1 = new Date();
	}

	public void backup() {
		str = "D:\\mysql51\\bin\\mysqldump -u root -p123456 kygl>  d:\\kygl.sql";
		try {
			Runtime rt = Runtime.getRuntime();
			rt.exec("cmd /c " + str);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("something wrong!");
		}
	}

	public void load(String str1) {
		str = "D:\\mysql51\\bin\\mysql -u root -p123456 kygl < " + str1;
		try {
			Runtime rt = Runtime.getRuntime();
			rt.exec("cmd /c " + str);
			System.out.println("successly!");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("something wrong!");
		}
	}

	public static void main(String[] ss) {
		DataDAO dataDAO = new DataDAO();
		dataDAO.backup();
	}

}
