package com.keyan.tool;

import org.apache.poi.hssf.usermodel.*;

import com.keyan.hibernate.form.*;


import java.io.*;

import java.util.List;


public class POIExcel2 {
	

	public POIExcel2() {
		
	}
	//@SuppressWarnings("deprecation")
	@SuppressWarnings("deprecation")
	public void exportExcel(List list,String name,OutputStream out,String s){
		HSSFWorkbook wb=new HSSFWorkbook();
		HSSFSheet sheet=wb.createSheet(name);
		 HSSFRow row=null;
		if(s.equals("projectcg"))
		{
			   row=sheet.createRow((short) 0);
			   
			    row.createCell((short) 0).setCellValue("排序");
			    row.createCell((short) 1).setCellValue("作者");
			    row.createCell((short) 2).setCellValue("职称");
			    row.createCell((short) 3).setCellValue("所在单位");
			    row.createCell((short) 4).setCellValue("项目名称");
			    row.createCell((short) 5).setCellValue("项目鉴定或鉴定单位名称");
			    row.createCell((short) 6).setCellValue("项目鉴定编号、获奖证书编号");
			    row.createCell((short) 7).setCellValue("项目鉴定时间、成果颁奖时间");
			    row.createCell((short) 8).setCellValue("其他参编人员");
			    row.createCell((short) 9).setCellValue("审核状态");
			    row.createCell((short) 10).setCellValue("备注（等级）");
		for(int i=0;i<list.size();i++)
		   {
		
			
		     row=sheet.createRow((short) i+1);
		     Projectcg  projectcg=(Projectcg)list.get(i);
		    row.createCell((short) 0).setCellValue(projectcg.getId());
		    row.createCell((short) 1).setCellValue(projectcg.getPName());
		    row.createCell((short) 2).setCellValue(projectcg.getPPost());
		    row.createCell((short) 3).setCellValue(projectcg.getPDept());
		    row.createCell((short) 4).setCellValue(projectcg.getPTitle());
		    row.createCell((short) 5).setCellValue(projectcg.getPUnit());
		    row.createCell((short) 6).setCellValue(projectcg.getPId());
		    row.createCell((short) 7).setCellValue(projectcg.getPTime().toString().split(" ")[0]);
		    row.createCell((short) 8).setCellValue(projectcg.getPOthers());
		    row.createCell((short) 9).setCellValue(projectcg.getPScore());
		    row.createCell((short) 10).setCellValue(projectcg.getPRemarks());
		
		   }
		try{
			wb.write(out);
		}catch(Exception e){
			System.out.println("POIExcel2.exportExcel()"+e.getMessage());
		}
	}
		

		
	}
}

