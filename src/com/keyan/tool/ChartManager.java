package com.keyan.tool;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.time.Day;
import org.jfree.data.time.Month;
import org.jfree.data.time.TimeSeries;
import org.jfree.data.time.TimeSeriesCollection;
import org.jfree.data.xy.XYDataset;

public class ChartManager {
	public JFreeChart createPieChart(ChartNumber cn) {//饼状图图的生成函数
//		 create a dataset...
		
		DefaultPieDataset data = new DefaultPieDataset();

		data.setValue(cn.getText1(), new Double(new Integer(cn.getText2()).intValue()));
		//第一个参数为块的名称，第二个参数为块占的百分比
		data.setValue(cn.getText3(), new Double(new Integer(cn.getText4()).intValue()));
		data.setValue(cn.getText5(), new Double(new Integer(cn.getText6()).intValue()));
		data.setValue(cn.getText7(), new Double(new Integer(cn.getText8()).intValue()));
//new Integer(cn.getText2()).intValue())将从页面获取的 text2的value值转换为数值类型。作为参数
		data.setValue(cn.getText9(), new Double(new Integer(cn.getText10()).intValue()));
		data.setValue(cn.getText11(), new Double(new Integer(cn.getText12()).intValue()));

		JFreeChart chart = ChartFactory.createPieChart(
		"饼状图",//图的名称
		data,//数据
		true, true, false
		);
		return chart;
		}
	public JFreeChart createBarChart() {//柱状图图的生成函数
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		dataset.addValue(10.0, "S1", "C1");
		//第一个参数为纵坐标值//第二个参数为色块的表示值的显示第三个参数为统计分类
		dataset.addValue(4.0, "S1", "C2");
		dataset.addValue(15.0, "S1", "C3");
		dataset.addValue(14.0, "S1", "C4");
		dataset.addValue(-5.0, "S2", "C1");
		dataset.addValue(-7.0, "S2", "C2");
		dataset.addValue(14.0, "S2", "C3");
		dataset.addValue(-3.0, "S2", "C4");
		dataset.addValue(6.0, "S3", "C1");
		dataset.addValue(17.0, "S3", "C2");
		dataset.addValue(-12.0, "S3", "C3");
		dataset.addValue( 7.0, "S3", "C4");
		dataset.addValue(7.0, "S4", "C1");
		dataset.addValue(15.0, "S4", "C2");
		dataset.addValue(11.0, "S4", "C3");
		dataset.addValue(0.0, "S4", "C4");
		dataset.addValue(-8.0, "S5", "C1");
		dataset.addValue(-6.0, "S5", "C2");
		dataset.addValue(10.0, "S5", "C3");
		dataset.addValue(-9.0, "S5", "C4");
		dataset.addValue(9.0, "S6", "C1");
		dataset.addValue(8.0, "S6", "C2");
		dataset.addValue(null, "S6", "C3");
		dataset.addValue(6.0, "S6", "C4");
		dataset.addValue(-10.0, "S7", "C1");
		dataset.addValue(9.0, "S7", "C2");
		dataset.addValue(7.0, "S7", "C3");
		dataset.addValue(7.0, "S7", "C4");
		dataset.addValue(11.0, "S8", "C1");
		dataset.addValue(13.0, "S8", "C2");
		dataset.addValue(9.0, "S8", "C3");
		dataset.addValue(9.0, "S8", "C4");
		dataset.addValue(-3.0, "S9", "C1");
		dataset.addValue(7.0, "S9", "C2");
		dataset.addValue(11.0, "S9", "C3");
		dataset.addValue(-10.0, "S9", "C4");
		JFreeChart chart = ChartFactory.createBarChart3D(
		"条形图",//图的名称
		"Category",//横坐标
		"Value",//纵坐标
		dataset,//结果集
		PlotOrientation.VERTICAL,
		true,
		true,
		false
		);
		return chart;
		}
	
	
	public JFreeChart createBarChart1() {//柱状图图的生成函数
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		dataset.addValue(10.0, "S1", "C1");
		//第一个参数为纵坐标值//第二个参数为色块的表示值的显示第三个参数为统计分类
		dataset.addValue(4.0, "S1", "C2");
		dataset.addValue(15.0, "S1", "C3");
		dataset.addValue(14.0, "S1", "C4");
		dataset.addValue(-5.0, "S2", "C1");
		dataset.addValue(-7.0, "S2", "C2");
		dataset.addValue(14.0, "S2", "C3");
		dataset.addValue(-3.0, "S2", "C4");
		dataset.addValue(6.0, "S3", "C1");
		dataset.addValue(17.0, "S3", "C2");
		dataset.addValue(-12.0, "S3", "C3");
		dataset.addValue( 7.0, "S3", "C4");
		dataset.addValue(7.0, "S4", "C1");
		dataset.addValue(15.0, "S4", "C2");
		dataset.addValue(11.0, "S4", "C3");
		dataset.addValue(0.0, "S4", "C4");
		dataset.addValue(-8.0, "S5", "C1");
		dataset.addValue(-6.0, "S5", "C2");
		dataset.addValue(10.0, "S5", "C3");
		dataset.addValue(-9.0, "S5", "C4");
		dataset.addValue(9.0, "S6", "C1");
		dataset.addValue(8.0, "S6", "C2");
		dataset.addValue(null, "S6", "C3");
		dataset.addValue(6.0, "S6", "C4");
		dataset.addValue(-10.0, "S7", "C1");
		dataset.addValue(9.0, "S7", "C2");
		dataset.addValue(7.0, "S7", "C3");
		dataset.addValue(7.0, "S7", "C4");
		dataset.addValue(11.0, "S8", "C1");
		dataset.addValue(13.0, "S8", "C2");
		dataset.addValue(9.0, "S8", "C3");
		dataset.addValue(9.0, "S8", "C4");
		dataset.addValue(-3.0, "S9", "C1");
		dataset.addValue(7.0, "S9", "C2");
		dataset.addValue(11.0, "S9", "C3");
		dataset.addValue(-10.0, "S9", "C4");
		JFreeChart chart = ChartFactory.createBarChart3D(
		"条形图",//图的名称
		"Category",//横坐标
		"Value",//纵坐标
		dataset,//结果集
		PlotOrientation.VERTICAL,
		true,
		true,
		false
		);
		return chart;
		}
	
	public JFreeChart createBarChart2() {//柱状图图的生成函数
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		dataset.addValue(10.0, "S1", "C1");
		//第一个参数为纵坐标值//第二个参数为色块的表示值的显示第三个参数为统计分类
		dataset.addValue(4.0, "S1", "C2");
		dataset.addValue(15.0, "S1", "C3");
		dataset.addValue(14.0, "S1", "C4");
		dataset.addValue(-5.0, "S2", "C1");
		dataset.addValue(-7.0, "S2", "C2");
		dataset.addValue(14.0, "S2", "C3");
		dataset.addValue(-3.0, "S2", "C4");
		dataset.addValue(6.0, "S3", "C1");
		dataset.addValue(17.0, "S3", "C2");
		dataset.addValue(-12.0, "S3", "C3");
		dataset.addValue( 7.0, "S3", "C4");
		dataset.addValue(7.0, "S4", "C1");
		dataset.addValue(15.0, "S4", "C2");
		dataset.addValue(11.0, "S4", "C3");
		dataset.addValue(0.0, "S4", "C4");
		dataset.addValue(-8.0, "S5", "C1");
		dataset.addValue(-6.0, "S5", "C2");
		dataset.addValue(10.0, "S5", "C3");
		dataset.addValue(-9.0, "S5", "C4");
		dataset.addValue(9.0, "S6", "C1");
		dataset.addValue(8.0, "S6", "C2");
		dataset.addValue(null, "S6", "C3");
		dataset.addValue(6.0, "S6", "C4");
		dataset.addValue(-10.0, "S7", "C1");
		dataset.addValue(9.0, "S7", "C2");
		dataset.addValue(7.0, "S7", "C3");
		dataset.addValue(7.0, "S7", "C4");
		dataset.addValue(11.0, "S8", "C1");
		dataset.addValue(13.0, "S8", "C2");
		dataset.addValue(9.0, "S8", "C3");
		dataset.addValue(9.0, "S8", "C4");
		dataset.addValue(-3.0, "S9", "C1");
		dataset.addValue(7.0, "S9", "C2");
		dataset.addValue(11.0, "S9", "C3");
		dataset.addValue(-10.0, "S9", "C4");
		JFreeChart chart = ChartFactory.createBarChart3D(
		"条形图",//图的名称
		"Category",//横坐标
		"Value",//纵坐标
		dataset,//结果集
		PlotOrientation.VERTICAL,
		true,
		true,
		false
		);
		return chart;
		}
	
	public JFreeChart createBarChart3() {//柱状图图的生成函数
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		dataset.addValue(10.0, "S1", "C1");
		//第一个参数为纵坐标值//第二个参数为色块的表示值的显示第三个参数为统计分类
		dataset.addValue(4.0, "S1", "C2");
		dataset.addValue(15.0, "S1", "C3");
		dataset.addValue(14.0, "S1", "C4");
		dataset.addValue(-5.0, "S2", "C1");
		dataset.addValue(-7.0, "S2", "C2");
		dataset.addValue(14.0, "S2", "C3");
		dataset.addValue(-3.0, "S2", "C4");
		dataset.addValue(6.0, "S3", "C1");
		dataset.addValue(17.0, "S3", "C2");
		dataset.addValue(-12.0, "S3", "C3");
		dataset.addValue( 7.0, "S3", "C4");
		dataset.addValue(7.0, "S4", "C1");
		dataset.addValue(15.0, "S4", "C2");
		dataset.addValue(11.0, "S4", "C3");
		dataset.addValue(0.0, "S4", "C4");
		dataset.addValue(-8.0, "S5", "C1");
		dataset.addValue(-6.0, "S5", "C2");
		dataset.addValue(10.0, "S5", "C3");
		dataset.addValue(-9.0, "S5", "C4");
		dataset.addValue(9.0, "S6", "C1");
		dataset.addValue(8.0, "S6", "C2");
		dataset.addValue(null, "S6", "C3");
		dataset.addValue(6.0, "S6", "C4");
		dataset.addValue(-10.0, "S7", "C1");
		dataset.addValue(9.0, "S7", "C2");
		dataset.addValue(7.0, "S7", "C3");
		dataset.addValue(7.0, "S7", "C4");
		dataset.addValue(11.0, "S8", "C1");
		dataset.addValue(13.0, "S8", "C2");
		dataset.addValue(9.0, "S8", "C3");
		dataset.addValue(9.0, "S8", "C4");
		dataset.addValue(-3.0, "S9", "C1");
		dataset.addValue(7.0, "S9", "C2");
		dataset.addValue(11.0, "S9", "C3");
		dataset.addValue(-10.0, "S9", "C4");
		JFreeChart chart = ChartFactory.createBarChart3D(
		"条形图",//图的名称
		"Category",//横坐标
		"Value",//纵坐标
		dataset,//结果集
		PlotOrientation.VERTICAL,
		true,
		true,
		false
		);
		return chart;
		}
		public JFreeChart createTimeSeriesChart() {//这里时序图的代码不用看。
//		 here we just populate a series with random data...
		TimeSeries series = new TimeSeries("Random Data");
		Day current = new Day(1, Month.JANUARY, 2001);
		for (int i = 0; i < 100; i++) {
		series.add(current, Math.random() * 100);
		current = (Day) current.next();
		}
		XYDataset data = new TimeSeriesCollection(series);
		JFreeChart chart = ChartFactory.createTimeSeriesChart(
		"时序图",
		"Date",
		"Rate",
		data,
		true,
		true,
		false
		);
		return chart;
		}
}
