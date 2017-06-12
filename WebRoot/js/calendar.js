//\u65e5\u5386\u63a7\u4ef6
	 function atCalendarControl(){
	  var calendar=this;
	  this.calendarPad=null;
	  this.prevMonth=null;
	  this.nextMonth=null;
	  this.prevYear=null;
	  this.nextYear=null;
	  this.goToday=null;
	  this.calendarClose=null;
	  this.calendarAbout=null;
	  this.head=null;
	  this.body=null;
	  this.today=[];
	  this.currentDate=[];
	  this.sltDate;
	  this.target;
	  this.source;

	  /************** \u52a0\u5165\u65e5\u5386\u5e95\u677f\u53ca\u9634\u5f71 *********************/
	  this.addCalendarPad=function(){
	   document.write("<div id='divCalendarpad' style='position:absolute;top:100;left:0;width:1%;height:1%;display:none;'>");
	   document.write("<iframe frameborder=0 height=168 width=110></iframe>");
	   document.write("<div style='position:absolute;top:4;left:4;width:1%;height:1%;background-color:#336699;'></div>");//width:248;height:164
	   document.write("</div>");
	   calendar.calendarPad=document.all.divCalendarpad;
	  }
	  /************** \u52a0\u5165\u65e5\u5386\u9762\u677f *********************/
	  this.addCalendarBoard=function(){
	   var BOARD=this;
	   var divBoard=document.createElement("div");
	   calendar.calendarPad.insertAdjacentElement("beforeEnd",divBoard);
	   divBoard.style.cssText="position:absolute;top:0;left:0;width:100%;height:166;border:1 outset;background-color:buttonface;";

	   var tbBoard=document.createElement("table");
	   divBoard.insertAdjacentElement("beforeEnd",tbBoard);
	   tbBoard.style.cssText="position:absolute;top:0;left:0;width:100%;height:10;font-size:9pt;";
	   tbBoard.cellPadding=0;
	   tbBoard.cellSpacing=1;
	   tbBoard.bgColor="#333333";

	  /************** \u8bbe\u7f6e\u5404\u529f\u80fd\u6309\u94ae\u7684\u529f\u80fd *********************/
	   /*********** Calendar About Button ***************/
	   trRow = tbBoard.insertRow(0);
	   calendar.calendarAbout=calendar.insertTbCell(trRow,0,"-","center");
	   calendar.calendarAbout.title="\u5173\u4e8e";
	   calendar.calendarAbout.onclick=function(){calendar.about();}
	   /*********** Calendar Head ***************/
	   tbCell=trRow.insertCell(1);
	   tbCell.colSpan=5;
	   tbCell.bgColor="#99CCFF";
	   tbCell.align="center";
	   tbCell.style.cssText = "cursor:default";
	   calendar.head=tbCell;
	   /*********** Calendar Close Button ***************/
	   tbCell=trRow.insertCell(2);
	   calendar.calendarClose = calendar.insertTbCell(trRow,2,"x","center");
	   calendar.calendarClose.title="\u9690\u85cf";
	   calendar.calendarClose.onclick=function(){calendar.hide();}

	   /*********** Calendar PrevYear Button ***************/
	   trRow = tbBoard.insertRow(1);
	   calendar.prevYear = calendar.insertTbCell(trRow,0,"&lt;&lt;","center");
	   calendar.prevYear.title="\u4e0a\u4e00\u5e74";
	   calendar.prevYear.onmousedown=function(){
		calendar.currentDate[0]--;
		calendar.show(calendar.target,calendar.currentDate[0]+"-"+calendar.currentDate[1]+"-"+calendar.currentDate[2],calendar.source);
	   }
	   /*********** Calendar PrevMonth Button ***************/
	   calendar.prevMonth = calendar.insertTbCell(trRow,1,"&lt;","center");
	   calendar.prevMonth.title="\u4e0a\u4e00\u6708";
	   calendar.prevMonth.onmousedown=function(){
		calendar.currentDate[1]--;
		if(calendar.currentDate[1]==0){
		 calendar.currentDate[1]=12;
		 calendar.currentDate[0]--;
		}
		calendar.show(calendar.target,calendar.currentDate[0]+"-"+calendar.currentDate[1]+"-"+calendar.currentDate[2],calendar.source);
	   }
	   /*********** Calendar Today Button ***************/
	   calendar.goToday = calendar.insertTbCell(trRow,2,"\u4eca\u65e5","center",3);
	   calendar.goToday.title="\u9009\u62e9\u4eca\u65e5";
	   calendar.goToday.onclick=function(){
		calendar.sltDate=calendar.currentDate[0]+"-"+calendar.currentDate[1]+"-"+calendar.currentDate[2];
		calendar.target.value=calendar.sltDate;
		calendar.hide();
		//calendar.show(calendar.target,calendar.today[0]+"-"+calendar.today[1]+"-"+calendar.today[2],calendar.source);
	   }
	   /*********** Calendar NextMonth Button ***************/
	   calendar.nextMonth = calendar.insertTbCell(trRow,3,"&gt;","center");
	   calendar.nextMonth.title="\u4e0b\u4e00\u6708";
	   calendar.nextMonth.onmousedown=function(){
		calendar.currentDate[1]++;
		if(calendar.currentDate[1]==13){
		 calendar.currentDate[1]=1;
		 calendar.currentDate[0]++;
		}
		calendar.show(calendar.target,calendar.currentDate[0]+"-"+calendar.currentDate[1]+"-"+calendar.currentDate[2],calendar.source);
	   }
	   /*********** Calendar NextYear Button ***************/
	   calendar.nextYear = calendar.insertTbCell(trRow,4,"&gt;&gt;","center");
	   calendar.nextYear.title="\u4e0b\u4e00\u5e74";
	   calendar.nextYear.onmousedown=function(){
		calendar.currentDate[0]++;
		calendar.show(calendar.target,calendar.currentDate[0]+"-"+calendar.currentDate[1]+"-"+calendar.currentDate[2],calendar.source);
	   }

	   trRow = tbBoard.insertRow(2);
	   var cnDateName = new Array("\u5468\u65e5","\u5468\u4e00","\u5468\u4e8c","\u5468\u4e09","\u5468\u56db","\u5468\u4e94","\u5468\u516d");
	   for (var i = 0; i < 7; i++) {
		tbCell=trRow.insertCell(i)
		tbCell.innerText=cnDateName[i];
		tbCell.align="center";
		tbCell.width=35;
		tbCell.style.cssText="cursor:default;border:1 solid #99CCCC;background-color:#99CCCC;";
	   }

	   /*********** Calendar Body ***************/
	   trRow = tbBoard.insertRow(3);
	   tbCell=trRow.insertCell(0);
	   tbCell.colSpan=7;
	   tbCell.height=97;
	   tbCell.vAlign="top";
	   tbCell.bgColor="#F0F0F0";
	   var tbBody=document.createElement("table");
	   tbCell.insertAdjacentElement("beforeEnd",tbBody);
	   tbBody.style.cssText="position:relative;top:0;left:0;width:245;height:103;font-size:9pt;"
	   tbBody.cellPadding=0;
	   tbBody.cellSpacing=1;
	   calendar.body=tbBody;
	  }
	  /************** \u52a0\u5165\u529f\u80fd\u6309\u94ae\u516c\u5171\u6837\u5f0f *********************/
	  this.insertTbCell=function(trRow,cellIndex,TXT,trAlign,tbColSpan){
	   var tbCell=trRow.insertCell(cellIndex);
	   if(tbColSpan!=undefined) tbCell.colSpan=tbColSpan;

	   var btnCell=document.createElement("button");
	   tbCell.insertAdjacentElement("beforeEnd",btnCell);
	   btnCell.value=TXT;
	   btnCell.style.cssText="width:100%;border:1 outset;background-color:buttonface;";
	   btnCell.onmouseover=function(){
		btnCell.style.cssText="width:100%;border:1 outset;background-color:#F0F0F0;";
	   }
	   btnCell.onmouseout=function(){
		btnCell.style.cssText="width:100%;border:1 outset;background-color:buttonface;";
	   }
	  // btnCell.onmousedown=function(){
	  //  btnCell.style.cssText="width:100%;border:1 inset;background-color:#F0F0F0;";
	  // }
	   btnCell.onmouseup=function(){
		btnCell.style.cssText="width:100%;border:1 outset;background-color:#F0F0F0;";
	   }
	   btnCell.onclick=function(){
		btnCell.blur();
	   }
	   return btnCell;
	  }
	  this.setDefaultDate=function(){
	   var dftDate=new Date();
	   calendar.today[0]=dftDate.getYear();
	   calendar.today[1]=dftDate.getMonth()+1;
	   calendar.today[2]=dftDate.getDate();
	  }

	  /****************** Show Calendar *********************/
	  this.show=function(targetObject,defaultDate,sourceObject){
	   if(targetObject==undefined) {
		alert("\u672a\u8bbe\u7f6e\u76ee\u6807\u5bf9\u50cf. \n\u65b9\u6cd5: ATCALENDAR.show(obj \u76ee\u6807\u5bf9\u50cf,string \u9ed8\u8ba4\u65e5\u671f,obj \u70b9\u51fb\u5bf9\u50cf);\n\n\u76ee\u6807\u5bf9\u50cf:\u63a5\u53d7\u65e5\u671f\u8fd4\u56de\u503c\u7684\u5bf9\u50cf.\n\u9ed8\u8ba4\u65e5\u671f:\u683c\u5f0f\u4e3a\"yyyy-mm-dd\",\u7f3a\u7701\u4e3a\u5f53\u65e5\u65e5\u671f.\n\u70b9\u51fb\u5bf9\u50cf:\u70b9\u51fb\u8fd9\u4e2a\u5bf9\u50cf\u5f39\u51facalendar,\u9ed8\u8ba4\u4e3a\u76ee\u6807\u5bf9\u50cf.\n");
		return false;
	   }
	   else    calendar.target=targetObject;
	   if(sourceObject==undefined) calendar.source=calendar.target;
	   else calendar.source=sourceObject;

	   var firstDay;
	   var Cells=new Array();
	   if(defaultDate==undefined || defaultDate==""){
		var theDate=new Array();
		calendar.head.innerText = calendar.today[0]+"-"+calendar.today[1]+"-"+calendar.today[2];
		theDate[0]=calendar.today[0]; theDate[1]=calendar.today[1]; theDate[2]=calendar.today[2];
	   }
	   else{
		var reg=/^\d{4}-\d{1,2}-\d{1,2}$/
		if(!defaultDate.match(reg)){
		 alert("\u9ed8\u8ba4\u65e5\u671f\u7684\u683c\u5f0f\u4e0d\u6b63\u786e\n\n\u9ed8\u8ba4\u65e5\u671f\u53ef\u63a5\u53d7\u683c\u5f0f\u4e3a:'yyyy-mm-dd'");
		 return;
		}
		var theDate=defaultDate.split("-");
		calendar.head.innerText = defaultDate;
	   }
	   calendar.currentDate[0]=theDate[0];
	   calendar.currentDate[1]=theDate[1];
	   calendar.currentDate[2]=theDate[2];
	   theFirstDay=calendar.getFirstDay(theDate[0],theDate[1]);
	   theMonthLen=theFirstDay+calendar.getMonthLen(theDate[0],theDate[1]);
	   //calendar.setEventKey();

	   calendar.calendarPad.style.display="";
	   var theRows = Math.ceil((theMonthLen)/7);
	   //\u6e05\u9664\u65e7\u7684\u65e5\u5386;
	   while (calendar.body.rows.length > 0) {
		calendar.body.deleteRow(0)
	   }
	   //\u5efa\u7acb\u65b0\u7684\u65e5\u5386;
	   var n=0;day=0;
	   for(i=0;i<theRows;i++){
		theRow=calendar.body.insertRow(i);
		for(j=0;j<7;j++){
		 n++;
		 if(n>theFirstDay && n<=theMonthLen){
		  day=n-theFirstDay;
		  calendar.insertBodyCell(theRow,j,day);
		 }
		 else{
		  var theCell=theRow.insertCell(j);
		  theCell.style.cssText="background-color:#F0F0F0;cursor:default;";
		 }
		}
	   }

	   //****************\u8c03\u6574\u65e5\u5386\u4f4d\u7f6e**************//
	   var offsetPos=calendar.getAbsolutePos(calendar.source);//\u8ba1\u7b97\u5bf9\u50cf\u7684\u4f4d\u7f6e;
           calendar.calendarPad.style.pixelHeight = 168;
	   if((document.body.offsetHeight-(offsetPos.y+calendar.source.offsetHeight-document.body.scrollTop))<calendar.calendarPad.style.pixelHeight){
		var calTop=offsetPos.y-calendar.calendarPad.style.pixelHeight;
	   }
	   else{
		var calTop=offsetPos.y+calendar.source.offsetHeight;
	   }
	   if((document.body.offsetWidth-(offsetPos.x+calendar.source.offsetWidth-document.body.scrollLeft))>calendar.calendarPad.style.pixelWidth){
		var calLeft=offsetPos.x;
	   }
	   else{
		var calLeft=calendar.source.offsetLeft+calendar.source.offsetWidth;
	   }
	   //alert(offsetPos.x);
	   calendar.calendarPad.style.pixelLeft=calLeft;
	   calendar.calendarPad.style.pixelTop=calTop;
	  }
	  /****************** \u8ba1\u7b97\u5bf9\u50cf\u7684\u4f4d\u7f6e *************************/
	  this.getAbsolutePos = function(el) {
	   var r = { x: el.offsetLeft, y: el.offsetTop };
	   if (el.offsetParent) {
		var tmp = calendar.getAbsolutePos(el.offsetParent);
		r.x += tmp.x;
		r.y += tmp.y;
	   }
	   return r;
	  };
	  //************* \u63d2\u5165\u65e5\u671f\u5355\u5143\u683c **************/
	  this.insertBodyCell=function(theRow,j,day,targetObject){
	   var theCell=theRow.insertCell(j);
	   if(j==0) var theBgColor="#FF9999";
	   else var theBgColor="#FFFFFF";
	   if(day==calendar.currentDate[2]) var theBgColor="#CCCCCC";
	   if(day==calendar.today[2]) var theBgColor="#99FFCC";
	   theCell.bgColor=theBgColor;
	   theCell.innerText=day;
	   theCell.align="center";
	   theCell.width=35;
	   theCell.style.cssText="border:1 solid #CCCCCC;cursor:hand;";
	   theCell.onmouseover=function(){
		theCell.bgColor="#FFFFCC";
		theCell.style.cssText="border:1 outset;cursor:hand;";
	   }
	   theCell.onmouseout=function(){
		theCell.bgColor=theBgColor;
		theCell.style.cssText="border:1 solid #CCCCCC;cursor:hand;";
	   }
	   theCell.onmousedown=function(){
		theCell.bgColor="#FFFFCC";
		theCell.style.cssText="border:1 inset;cursor:hand;";
	   }
	   theCell.onclick=function(){
		if(calendar.currentDate[1].length<2) calendar.currentDate[1]="0"+calendar.currentDate[1];
		if(day.toString().length<2) day="0"+day;
		calendar.sltDate=calendar.currentDate[0]+"-"+calendar.currentDate[1]+"-"+day;
		calendar.target.value=calendar.sltDate;
		calendar.hide();
	   }
	  }
	  /************** \u53d6\u5f97\u6708\u4efd\u7684\u7b2c\u4e00\u5929\u4e3a\u661f\u671f\u51e0 *********************/
	  this.getFirstDay=function(theYear, theMonth){
	   var firstDate = new Date(theYear,theMonth-1,1);
	   return firstDate.getDay();
	  }
	  /************** \u53d6\u5f97\u6708\u4efd\u5171\u6709\u51e0\u5929 *********************/
	  this.getMonthLen=function(theYear, theMonth) {
	   theMonth--;
	   var oneDay = 1000 * 60 * 60 * 24;
	   var thisMonth = new Date(theYear, theMonth, 1);
	   var nextMonth = new Date(theYear, theMonth + 1, 1);
	   var len = Math.ceil((nextMonth.getTime() - thisMonth.getTime())/oneDay);
	   return len;
	  }
	  /************** \u9690\u85cf\u65e5\u5386 *********************/
	  this.hide=function(){
	   //calendar.clearEventKey();
	   calendar.calendarPad.style.display="none";
	  }
	  /************** \u4ece\u8fd9\u91cc\u5f00\u59cb *********************/
	  this.setup=function(defaultDate){
	   calendar.addCalendarPad();
	   calendar.addCalendarBoard();
	   calendar.setDefaultDate();
	  }
	  /************** \u5173\u4e8eAgetimeCalendar *********************/
	  this.about=function(){
	   var strAbout = "\u5173\u4e8e\u65e5\u5386\n\n";
	   strAbout+="-\t: \u5173\u4e8e\n";
	   strAbout+="x\t: \u9690\u85cf\n";
	   strAbout+="<<\t: \u4e0a\u4e00\u5e74\n";
	   strAbout+="<\t: \u4e0a\u4e00\u6708\n";
	   strAbout+="\u4eca\u65e5\t: \u8fd4\u56de\u5f53\u524d\u65e5\u671f\n";
	   strAbout+=">\t: \u4e0b\u4e00\u6708\n";
	   strAbout+=">>\t: \u4e0b\u4e00\u5e74\n";
	   alert(strAbout);
	  }

	  calendar.setup();
	 }

//\u5224\u65ad\u65e5\u671f\u7684\u903b\u8f91(\u8d77\u59cb\u65e5\u671f\u5e94\u5c0f\u4e8e\u622a\u6b62\u65e5\u671f)
function chechDatelogic(strStart,strEnd)
{
    var arr1 = strStart.split("-");
    var arr2 = strEnd.split("-");
    var date1 = new Date(arr1[0],parseInt(arr1[1].replace(/^0/,""),10) - 1,arr1[2]);
    var date2 = new Date(arr2[0],parseInt(arr2[1].replace(/^0/,""),10) - 1,arr2[2]);

	if(arr1[1].length == 1)
        arr1[1] = "0" + arr1[1];
    if(arr1[2].length == 1)
        arr1[2] = "0" + arr1[2];
    if(arr2[1].length == 1)
        arr2[1] = "0" + arr2[1];
    if(arr2[2].length == 1)
        arr2[2]="0" + arr2[2];

    var d1 = arr1[0] + arr1[1] + arr1[2];
    var d2 = arr2[0] + arr2[1] + arr2[2];
    if(parseInt(d1,10) > parseInt(d2,10)){
	   alert("\u8d77\u59cb\u65e5\u671f\u665a\u4e8e\u7ec8\u6b62\u65e5\u671f!\u8bf7\u60a8\u91cd\u65b0\u586b\u5199\u8d77\u59cb\u65e5\u671f\u548c\u622a\u6b62\u65e5\u671f!");
	   //document.postform.bdate.focus();
       return false;
	}else{
       return true;
	}
}
