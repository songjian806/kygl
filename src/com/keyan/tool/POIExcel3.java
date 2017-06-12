package com.keyan.tool;

import org.apache.poi.hssf.usermodel.*;

import com.keyan.hibernate.form.*;


import java.io.*;

import java.util.List;


public class POIExcel3 {
	

	public POIExcel3() {
		
	}
	//@SuppressWarnings("deprecation")
	@SuppressWarnings("deprecation")
	public void exportExcel(List list,String name,OutputStream out,String s){
		HSSFWorkbook wb=new HSSFWorkbook();
		HSSFSheet sheet=wb.createSheet(name);
		 HSSFRow row=null;
		if(s.equals("zhuanli"))
		{
			   row=sheet.createRow((short) 0);
			   
			    row.createCell((short) 0).setCellValue("排序");
			    row.createCell((short) 1).setCellValue("发明人");
			    row.createCell((short) 2).setCellValue("职称");
			    row.createCell((short) 3).setCellValue("所在单位");
			    row.createCell((short) 4).setCellValue("专利名称");
			    row.createCell((short) 5).setCellValue("专利类型");
			    row.createCell((short) 6).setCellValue("项目名称及编号");
			    row.createCell((short) 7).setCellValue("状态");
			    row.createCell((short) 8).setCellValue("申请（授权号）");
			    row.createCell((short) 9).setCellValue("申请（授权日）");
			    row.createCell((short) 10).setCellValue("奖励");
			    row.createCell((short) 11).setCellValue("其他参编人员");
			    row.createCell((short) 12).setCellValue("审核状态");
			    row.createCell((short) 13).setCellValue("备注（等级）");
		for(int i=0;i<list.size();i++)
		   {
		
			
		     row=sheet.createRow((short) i+1);
		     Zhuanli  zhuanli=(Zhuanli)list.get(i);
		    row.createCell((short) 0).setCellValue(zhuanli.getId());
		    row.createCell((short) 1).setCellValue(zhuanli.getZName());
		    row.createCell((short) 2).setCellValue(zhuanli.getZPost());
		    row.createCell((short) 3).setCellValue(zhuanli.getZDept());
		    row.createCell((short) 4).setCellValue(zhuanli.getZTitle());
		    row.createCell((short) 5).setCellValue(zhuanli.getZType());
		    row.createCell((short) 6).setCellValue(zhuanli.getZId());
		    row.createCell((short) 7).setCellValue(zhuanli.getZState());
		    row.createCell((short) 8).setCellValue(zhuanli.getZNum());
		    row.createCell((short) 9).setCellValue(zhuanli.getZTime().toString().split(" ")[0]);
		    row.createCell((short) 10).setCellValue(zhuanli.getZAward());
		    row.createCell((short) 11).setCellValue(zhuanli.getZOthers());
		    row.createCell((short) 12).setCellValue(zhuanli.getZScore());
		    row.createCell((short) 13).setCellValue(zhuanli.getZRemarks());
		
		   }
		try{
			wb.write(out);
		}catch(Exception e){
			System.out.println("POIExcel3.exportExcel()"+e.getMessage());
		}
	}
		

		
	}
}

