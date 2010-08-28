<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.voting.javabean.*,com.voting.logic.*,java.util.*" %>
<%
response.addHeader("pragma", "no-cache");
response.addHeader("cache-control", "no-cache,must-revalidate");
response.addHeader("expires", "0"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<TITLE>作品预览</TITLE>
<meta http-equiv="title" content="作品预览"/> 
<meta name="keywords" content="作品预览" />
<meta name="description" content="作品预览" />
<link rel="stylesheet" href="css/css.css">
<script language="javascript" src="js/make.js"></script>
</HEAD>
<body>
<br><br>
<form name="form1"><input type="hidden" id="works_id" name="works_id" value=""/></form>
<%

String works_id="";
int work_id=1;
if(request.getParameter("works_id")!=null){
works_id=request.getParameter("works_id");
work_id=Integer.parseInt(works_id);
}
WorksInfoLogic worksInfoLogic=new WorksInfoLogic();
Works_info works_info1=(Works_info)worksInfoLogic.getWorksInfoMsgByID(work_id);
String srcFileName=works_info1.getWorks_file_name();
%>
<center>
<!--图片显示框--><div id="container"><div style="width: 800px;" id="imgContainer">
<div style="width: 650px;" id="detailImg">
	<table title="下一张" style="width: 650px; height: 565px;">
	  <tbody>
	  <tr>
	   <td valign="middle" align="center" id="picWrap">
	    <img style="width: 636px; height: 525px;" src="upload/bigimages/<%=srcFileName%>" id="srcPic">
	   </td>
	   <td>
		<!---小图列表开始--->
		<div id="album" style="padding:5px">
		<div class="preNormal" id="slidePre"></div>
		<div id="smallImgs">
		  <div id="imgList">
          <%
		  
		  ArrayList list=worksInfoLogic.getWorksInfoMsg();
		  for(int i=0;i<list.size();i++){
		  Works_info  works_info=(Works_info)list.get(i);
		  int id=works_info.getWorks_id();
		  String fileName=works_info.getWorks_file_name();
		  %>
		  <div id="pn_<%=i%>" class=<%=id==work_id?"select":"noselect"%> >
           
			<table cellspacing="0">
			  <tbody><tr><td valign="middle" align="center"><img style="display: inline; width: 80px; height: 100px;" name=<%=i%> title="第<%=i%>张" id=<%=id%> src="upload/minimages/<%=fileName%>" rel="upload/bigimages/<%=fileName%>"></td></tr></tbody></table>
			</div>
			<%}%>
		</div>
		</div>
		<div class="nextNormal" id="slideNext"></div>
		</div>
		<!---小图列表结束--->	   
	   </td>
	  </tr>
	  </tbody>
	</table>
	<table style="width: 545px;" id="picInfo"><!--<tbody><tr><td width="25%">图片尺寸：<span class="fontBar" id="size">426x550</span></td><td width="18%">图片大小：<span class="fontBar" id="fileSize">30k</span></td><td width="18%" align="left">图片格式：<span class="fontBar" id="fileType">jpg</span></td><td align="right"><span class="rate">预览图比例：<span class="fontBar" id="rate">95%</span></span></td><td style="width: 70px;" align="left"><a href="javascript:void(0)" class="zoomsrc" id="zoomSrc">查看原图</a></td></tr></tbody>--></table>
<div id="desc"><table style="width: 545px;" id="picInfo">
<%
DiscussInfoLogic discussInfoLogic=new DiscussInfoLogic();
ArrayList discussList=discussInfoLogic.getDiscussInfo(work_id);
if(discussList.size()>0){
for(int i=0;i<discussList.size();i++){
Discuss_info discuss_info=(Discuss_info)discussList.get(i);
%>
<tr><td align="left">评论内容:</td><td align="left"><%=discuss_info.getDiscuss_commond()%></td><td align="left">评论时间:</td><td align="left"><%=discuss_info.getDiscuss_time().substring(0,19)%></td></tr>
<%
}
}else{
%>
<tr><td cal align="center">暂无评论</td></tr>
<% 
}
 %>

</table></div>
</div>

<script>
var Tweener = {
    easeNone: function(t, b, c, d) {
        return c*t/d + b;
    },
	easein: function(t, b, c, d) {
		return c*(t/=d)*t + b; 
	},
	easeinout: function(t, b, c, d) {
		if (t < d/2) return 2*c*t*t/(d*d) + b;
		var ts = t - d/2;
		return -2*c*ts*ts/(d*d) + 2*c*ts/d + c/2 + b;	
	}
};

function $( id ){
  return document.getElementById(id);
}
var list = $('imgList');
var imgs = list.getElementsByTagName('img');
var px = list.clientHeight/imgs.length;
var PLHeight = px*4;
var index = 1;   
var selected = 2;//定位
var run;
$('slideNext').onclick = function (){
  Nrun();
};
$('slideNext').onmouseover = function (){
  this.className = 'nextHover';
}
$('slideNext').onmouseout = function (){
  this.className = 'nextNormal';
}
$('slidePre').onclick = function (){
  Prun();
};
$('slidePre').onmouseover = function (){
  this.className = 'preHover';
}
$('slidePre').onmouseout = function (){
  this.className = 'preNormal';
}
$('picWrap').onclick = function (){
    if(index>imgs.length-1)return;
    Nrun();
	$('srcPic').src = imgs[index].getAttribute('rel');
	for(k=0;k<imgs.length;k++){
	  if(k==parseInt(index)+1){
	    $('pn_'+k).className = 'select';
	  }else{
	    $('pn_'+k).className = 'noselect';
	  }
	}
	index++;
}
for(i=0;i<imgs.length;i++){
  imgs[i].onclick = function (){
    $('srcPic').src = this.getAttribute('rel');
	for(k=0;k<imgs.length;k++){
	
	  if(k==this.name){

	    $('pn_'+k).className = 'select';
		makeDiscuss(this.id,'desc');
		// $('works_id').value=this.id;
		
		//$('desc').innerHTML="sdfdfdfdfdf";
		//window.location.href="content.jsp?works_id="+$('works_id').value;
	  }else{
	    $('pn_'+k).className = 'noselect';
	  }
	}
	
	var b = list.style.marginTop ? parseInt(list.style.marginTop) : 0;
	var runc = (this.name-selected)*px + b;//需要滚动像素
	index = this.name;
	if(index>selected){
	   Nrun( runc );
	}
	if(runc<0){
	  Prun( Math.abs(runc) );
	}
  }
}

//上
	function Prun( runc ){
		var b = list.style.marginTop ? parseInt(list.style.marginTop) : 0;
		var c = typeof runc == 'number' ? runc : px ;
		var t=0,ttl=10,d =5;
		clearInterval(run);
		if(b)run = setInterval(function (){
					var top = Tweener.easeinout(t,b,c,d);
					if(top>=0){
					  list.style.marginTop  = '0px';
					  clearInterval(run);
					  return;
					}
					list.style.marginTop  = top+'px';
					if(t<d){
					  t++; 
					}else{
					  clearInterval(run);
					}
				},ttl)
	};
//下
	function Nrun( runc ){
		var b = list.style.marginTop ? -parseInt(list.style.marginTop) : 0;
		var c = typeof runc == 'number' ? runc : px ;
		var d = 5;
		var t=0,ttl=10;
		clearInterval(run);
		run = setInterval(function (){
					var top = Tweener.easeinout(t,b,c,d);
					if(top>=list.clientHeight-PLHeight){
					  list.style.marginTop  = -list.clientHeight+PLHeight+'px';
					  clearInterval(run);
					  return;
					}
					list.style.marginTop  = -top+'px';
					if(t<d){
					  t++; 
					}else{
					  clearInterval(run);
					}
				},ttl)
	};
</script>
</div><div id="ecomContainer"><div id="imContainer"></div></div></div>

<div style="clear: both;"></div>
<!-- 页尾声明-->
</center>
<br><br>
<!--
<div>代码整理：<a href="http://www.lycode.com" target="_blank" style="color:blue">代码库</a>　来源：<a href="http://www.lycode.com" target="_blank">原创</a>  样式来源 : <a href="http://www.baidu.com" target="_blank">百度</a><br>
＊尊重他人劳动成果，转载请自觉注明出处！注：此代码仅供学习交流，请勿用于商业用途。
</div>
-->
</body></html>