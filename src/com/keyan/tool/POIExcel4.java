package com.keyan.tool;

import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.keyan.hibernate.form.Pici;
import com.keyan.hibernate.form.Pppeople;
import com.keyan.hibernate.form.Project1;


public class POIExcel4 {
	

	public POIExcel4() {
		
	}
	//@SuppressWarnings("deprecation")
	@SuppressWarnings("deprecation")
	public void exportExcel(List list,String name,OutputStream out,String s){
		HSSFWorkbook wb=new HSSFWorkbook();
		HSSFSheet sheet=wb.createSheet(name);
		 HSSFRow row=null;
		
			   row=sheet.createRow((short) 0);
			   
			    row.createCell((short) 0).setCellValue("项目名称");
			    row.createCell((short) 1).setCellValue("项目批次");
			    row.createCell((short) 2).setCellValue("项目成员");
			    row.createCell((short) 3).setCellValue("负责人");
			    row.createCell((short) 4).setCellValue("审核状态");
			   
		for(int i=0;i<list.size();i++)
		   {
		
			
		     row=sheet.createRow((short) i+1);
		     Project1  project1=(Project1)list.get(i);
		   
		    row.createCell((short) 0).setCellValue(project1.getPname());
		    row.createCell((short) 1).setCellValue(project1.getPnum());
		    //row.createCell((short) 2).setCellValue(project1.getPpeople());
		    row.createCell((short) 3).setCellValue(project1.getPcontrol());
		    row.createCell((short) 4).setCellValue(project1.getPstate2());
		   
		 
		
		   }
		try{
			wb.write(out);
		}catch(Exception e){
			System.out.println("POIExcel3.exportExcel()"+e.getMessage());
		}
	}
		
	public void exportExcel1(List list,String name,OutputStream out,String s){
		HSSFWorkbook wb=new HSSFWorkbook();
		HSSFSheet sheet=wb.createSheet(name);
		 HSSFRow row=null;
		
			   row=sheet.createRow((short) 0);
			   
			    row.createCell((short) 0).setCellValue("批次名称");
			    row.createCell((short) 1).setCellValue("批次状态");
			    row.createCell((short) 2).setCellValue("申报数量");
			    row.createCell((short) 3).setCellValue("通过数量");
			    row.createCell((short) 4).setCellValue("开始日期");
			    row.createCell((short) 5).setCellValue("结束日期");
			   
		for(int i=0;i<list.size();i++)
		   {
		
			
		     row=sheet.createRow((short) i+1);
		     Pici  pici=(Pici)list.get(i);
		   
		    row.createCell((short) 0).setCellValue(pici.getPcname());
		    row.createCell((short) 1).setCellValue(pici.getPcstate());
		    row.createCell((short) 2).setCellValue(pici.getPcclasify());
		    row.createCell((short) 3).setCellValue(pici.getPccome());
		    row.createCell((short) 4).setCellValue(pici.getPcstar());
		    row.createCell((short) 5).setCellValue(pici.getPcfinish());
		   
		 
		
		   }
		try{
			wb.write(out);
		}catch(Exception e){
			System.out.println("POIExcel3.exportExcel()"+e.getMessage());
		}
	}
		
	public void exportExcel2(List list,String name,OutputStream out,String s){
		HSSFWorkbook wb=new HSSFWorkbook();
		HSSFSheet sheet=wb.createSheet(name);
		 HSSFRow row=null;
		
			   row=sheet.createRow((short) 0);
			   
			    row.createCell((short) 0).setCellValue("署名顺序");
			    row.createCell((short) 1).setCellValue("成员姓名");
			    row.createCell((short) 2).setCellValue("所在单位");
			    row.createCell((short) 3).setCellValue("贡献率");
			    row.createCell((short) 4).setCellValue("成员类型");
			    
			   
		for(int i=0;i<list.size();i++)
		   {
		
			
		     row=sheet.createRow((short) i+1);
		     Pppeople  pici=(Pppeople)list.get(i);
		   
		    row.createCell((short) 0).setCellValue(pici.getPpnum().toString());
		    row.createCell((short) 1).setCellValue(pici.getPpname());
		    row.createCell((short) 2).setCellValue(pici.getPpdept());
		    
		    row.createCell((short) 3).setCellValue(pici.getPpwork());
		    row.createCell((short) 4).setCellValue(pici.getPptype());
		  
		    
		   
		 
		
		   }
		try{
			wb.write(out);
		}catch(Exception e){
			System.out.println("POIExcel3.exportExcel()"+e.getMessage());
		}
	}
}

