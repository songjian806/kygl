package com.keyan.tool;


import org.apache.poi.hssf.usermodel.*;

import com.keyan.hibernate.form.*;


import java.io.*;

import java.util.List;


public class POIExcel1 {
	

	public POIExcel1() {
		
	}
	//@SuppressWarnings("deprecation")
	@SuppressWarnings("deprecation")
	public void exportExcel(List list,String name,OutputStream out,String s){
		HSSFWorkbook wb=new HSSFWorkbook();
		HSSFSheet sheet=wb.createSheet(name);
		 HSSFRow row=null;
		if(s.equals("thesis"))
		{
			   row=sheet.createRow((short) 0);
			   
			    row.createCell((short) 0).setCellValue("排序");
			    row.createCell((short) 1).setCellValue("作者");
			    row.createCell((short) 2).setCellValue("职称");
			    row.createCell((short) 3).setCellValue("所在单位");
			    row.createCell((short) 4).setCellValue("论文题目");
			    row.createCell((short) 5).setCellValue("发表期刊");
			    row.createCell((short) 5).setCellValue("期刊CN刊号");
			    row.createCell((short) 5).setCellValue("期刊ISSN号");
			    row.createCell((short) 7).setCellValue("发表时间");
			    row.createCell((short) 8).setCellValue("其他完成人员");
			    row.createCell((short) 9).setCellValue("审核状态");
			    row.createCell((short) 10).setCellValue("备注");
		for(int i=0;i<list.size();i++)
		   {
		
			
		     row=sheet.createRow((short) i+1);
		    Thesis  thesis=(Thesis)list.get(i);
		    row.createCell((short) 0).setCellValue(thesis.getId());
		    row.createCell((short) 1).setCellValue(thesis.getTName());
		    row.createCell((short) 2).setCellValue(thesis.getTPost());
		    row.createCell((short) 3).setCellValue(thesis.getTUnit());
		    row.createCell((short) 4).setCellValue(thesis.getTTitle());
		    row.createCell((short) 5).setCellValue(thesis.getTPeriodical());
		    row.createCell((short) 6).setCellValue(thesis.getTCnid());
		    row.createCell((short) 6).setCellValue(thesis.getTIssnid());
		    row.createCell((short) 7).setCellValue(thesis.getTTime().toString().split(" ")[0]);
		    row.createCell((short) 8).setCellValue(thesis.getTOthers());
		    row.createCell((short) 9).setCellValue(thesis.getTScore());
		    row.createCell((short) 10).setCellValue(thesis.getTRemarks());
		
		   }
		try{
			wb.write(out);
		}catch(Exception e){
			System.out.println("POIExcel1.exportExcel()"+e.getMessage());
		}
	}
		

		
	}
}

