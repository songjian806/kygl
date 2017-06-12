package com.keyan.tool;

import org.apache.poi.hssf.usermodel.*;

import com.keyan.hibernate.form.*;


import java.io.*;

import java.util.List;


public class POIExcel {
	

	public POIExcel() {
		
	}
	//@SuppressWarnings("deprecation")
	@SuppressWarnings("deprecation")
	public void exportExcel(List list,String name,OutputStream out,String s){
		HSSFWorkbook wb=new HSSFWorkbook();
		HSSFSheet sheet=wb.createSheet(name);
		 HSSFRow row=null;
		if(s.equals("work"))
		{
			   row=sheet.createRow((short) 0);
			   
			    row.createCell((short) 0).setCellValue("排序");
			    row.createCell((short) 1).setCellValue("主编");
			    row.createCell((short) 2).setCellValue("职称");
			    row.createCell((short) 3).setCellValue("所在单位");
			    row.createCell((short) 4).setCellValue("论著（教材）名称");
			    row.createCell((short) 5).setCellValue("出版社");
			    row.createCell((short) 6).setCellValue("ISBN书号");
			    row.createCell((short) 7).setCellValue("发表时间");
			    row.createCell((short) 8).setCellValue("其他参编人员");
			    row.createCell((short) 9).setCellValue("审核状态");
			    row.createCell((short) 10).setCellValue("备注");
		for(int i=0;i<list.size();i++)
		   {
		
			
		     row=sheet.createRow((short) i+1);
		    Work  work=(Work)list.get(i);
		    row.createCell((short) 0).setCellValue(work.getId());
		    row.createCell((short) 1).setCellValue(work.getWName());
		    row.createCell((short) 2).setCellValue(work.getWPost());
		    row.createCell((short) 3).setCellValue(work.getWUnit());
		    row.createCell((short) 4).setCellValue(work.getWTitle());
		    row.createCell((short) 5).setCellValue(work.getWPublisher());
		    row.createCell((short) 6).setCellValue(work.getWIsbnid());
		    row.createCell((short) 7).setCellValue(work.getWTime().toString().split(" ")[0]);
		    row.createCell((short) 8).setCellValue(work.getWOthers());
		    row.createCell((short) 9).setCellValue(work.getWScore());
		    row.createCell((short) 10).setCellValue(work.getWRemarks());
		
		   }
		try{
			wb.write(out);
		}catch(Exception e){
			System.out.println("POIExcel.exportExcel()"+e.getMessage());
		}
	}
		

		
	}
}

