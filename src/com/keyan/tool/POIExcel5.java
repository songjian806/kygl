package com.keyan.tool;

import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.keyan.hibernate.form.Mode;

public class POIExcel5 {
public POIExcel5() {
		
	}
	//@SuppressWarnings("deprecation")
	@SuppressWarnings("deprecation")
	public void exportExcel(List list,String name,OutputStream out,String s){
		HSSFWorkbook wb=new HSSFWorkbook();
		HSSFSheet sheet=wb.createSheet(name);
		 HSSFRow row=null;
		if(s.equals("mode"))
		{
			   row=sheet.createRow((short) 0);
			   
			    row.createCell((short) 0).setCellValue("排序");
			    row.createCell((short) 1).setCellValue("项目名");
			    row.createCell((short) 2).setCellValue("所属院系");
			    row.createCell((short) 3).setCellValue("参加人员");
			    row.createCell((short) 4).setCellValue("负责人");
			    row.createCell((short) 5).setCellValue("项目分类");
			    row.createCell((short) 6).setCellValue("项目经费");
			    row.createCell((short) 7).setCellValue("时间");
			    row.createCell((short) 8).setCellValue("是否拨款）");
			    row.createCell((short) 9).setCellValue("审核状态）");
			    row.createCell((short) 10).setCellValue("备注");
			  
		for(int i=0;i<list.size();i++)
		   {
		
			
		     row=sheet.createRow((short) i+1);
		   Mode mode=(Mode)list.get(i);
		    row.createCell((short) 0).setCellValue(mode.getId());
		    row.createCell((short) 1).setCellValue(mode.getXmname());
		    row.createCell((short) 2).setCellValue(mode.getPici());
		    row.createCell((short) 3).setCellValue(mode.getrenyuan());
		    row.createCell((short) 4).setCellValue(mode.getJFName());
		    row.createCell((short) 5).setCellValue(mode.getFenlei());
		    row.createCell((short) 6).setCellValue(mode.getXmjingfei());
		    row.createCell((short) 7).setCellValue(mode.getTime().toString().split(" ")[0]);
		    row.createCell((short) 8).setCellValue(mode.getBokuanzt());
		   // row.createCell((short) 9).setCellValue(zhuanli.getZTime().toString().split(" ")[0]);
		    row.createCell((short) 9).setCellValue(mode.getJFScore());
		  
		    row.createCell((short) 10).setCellValue(mode.getBeizhu());

		
		   }
		try{
			wb.write(out);
		}catch(Exception e){
			System.out.println("POIExcel5.exportExcel()"+e.getMessage());
		}
	}
		

		
	}
}

