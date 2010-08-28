<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%
  Date date=new Date();
  int f=date.getDate()+date.getMonth()+date.getYear();
  String flag_login = (String) session.getAttribute("flag_login");
  if (flag_login==null) {
    session.invalidate();
    response.sendRedirect("login.htm");
    return;
  }else{
 int flag=Integer.parseInt(flag_login);
  if(flag!=f){
    session.invalidate();
    response.sendRedirect("login.htm");
    return;}
  }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><TITLE>欧时网投票系统后台管理页面</TITLE>
<LINK href="../css/comm.css" type=text/css rel=stylesheet>
<LINK media=screen href="../css/dynCalendar.css" type=text/css rel=stylesheet>
<STYLE type=text/css>
.num {
	COLOR: #ff0000
}
</STYLE>

<STYLE type=text/css>
.unnamed1 {
	FONT-WEIGHT: bold; COLOR: #ff0000; FONT-FAMILY: "Arial", "Helvetica", "sans-serif"
}
.STYLE1 {color: #FF0000}
</STYLE>

<META content="MSHTML 6.00.6000.16674" name=GENERATOR></HEAD>
<BODY leftMargin=0 topMargin=0 marginheight="0" marginwidth="0"><BR>
<DIV align=center>
<FIELDSET><LEGEND style="FONT-SIZE: 15px">后台管理</LEGEND><BR>
<TABLE cellSpacing=0 cellPadding=0 width="98%" align=center border=0>
  <TBODY>
  <TR>
    <TD class=ErrorMsg>管理员<span class="STYLE1"><%=(String)session.getAttribute("name")%></span>欢迎你</TD>
  </TR></TBODY></TABLE><BR>
<TABLE class=thetable cellSpacing=0 cellPadding=4 width="98%" align=center 
border=0>
  <THEAD>
  <TR>
    <TD class=line-0010-bbbbbb vAlign=top bgColor=#e5e5e5 colSpan=4 
      height=25>作品管理</TD></TR></THEAD>
  <TBODY>
  <TR align=left>
    <TD vAlign=center width="23%" height=26>发布作品：</TD>
    <TD class=unnamed1 vAlign=center width="28%"><A class=in-table 
      href="works_upload.jsp">点击</A> 
    </TD>
   </TR>
  <TR align=left>
    <TD vAlign=center height=26>编辑作品 ：</TD>
    <TD vAlign=center><A class=in-table 
      href="works_edit.jsp">点击</A> 
    </TD>
    </TR></TBODY></TABLE><BR>
<TABLE class=thetable cellSpacing=0 cellPadding=4 width="98%" align=center 
border=0>
  <THEAD>
  <TR>
    <TD class=line-0010-bbbbbb vAlign=top bgColor=#e5e5e5 colSpan=4 
      height=25>评论管理</TD></TR></THEAD>
  <TBODY>
  <TR align=left>
    <TD width="47%" height=26 vAlign=center>审核：</TD>
    <TD width="53%" vAlign=center class=unnamed1><A class=in-table 
      href="discuss_edit.jsp">点击</A></TD>
    </TR>
  
 </TBODY></TABLE><BR>
 <TABLE class=thetable cellSpacing=0 cellPadding=4 width="98%" align=center 
border=0>
  <THEAD>
  <TR>
    <TD class=line-0010-bbbbbb vAlign=top bgColor=#e5e5e5 colSpan=4 
      height=25><A  href="../dead_servlet" class="STYLE1" >退出系统</A></TD>
  </TR></THEAD>
  <TBODY>
  
  
 </TBODY></TABLE>
</FIELDSET> 
</DIV></BODY></HTML>

