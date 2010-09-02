<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="com.voting.javabean.*,com.voting.logic.*,java.util.*" %>
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>作品列表</title>
<link href="../css/comm.css" rel="stylesheet" type="text/css">
<style type="text/css"> 
<!-- 
*{font-size:12px;font-family:Verdana, Geneva, sans-serif;line-height:14px} 
a{color:#039} 
a:hover{color:#f60} 
.pop{position:absolute;left:40%;top:40%;width:300px;height:300px;background:#eee;border:1px solid #ccc} 
.pop_head{position:relative;height:20px;background:#ccc} 
.pop_head a{position:absolute;right:8px;line-height:20px;color:#000;text-decoration:none} 
.pop_head a:hover{color:#f60;text-decoration:none} 
.pop_body{padding:8px} 
--> 
</style> 
<script language="javascript">
function del(workid){
if(confirm("确认删除吗")){
  document.editForm.works_id.value=workid;
  document.editForm.method='POST';
  document.editForm.submit();
  window.location.reload();

  }else{
  return false;
  }
}

var url = '#'; 
function show(o){ 
var o = document.getElementById(o); 
o.style.display = ""; 
} 
function hide(o){ 
var o = document.getElementById(o); 

o.style.display = "none"; 
window.location = url; 
} 
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%
    WorksInfoLogic worksInfoLogic=new WorksInfoLogic();
  	ArrayList list = (ArrayList)worksInfoLogic.getWorksInfoMsg();
	String p = request.getParameter("page");
    int tempPage = 1;
    if (p != null)
      tempPage = Integer.parseInt(p);
    int recordsCount = list.size(); //总记录数

    int pageSize = 10; //每页记录数
    int pagesCount = (recordsCount + pageSize - 1) / pageSize; //总页数

    if (tempPage < 0)
      tempPage = 1;
    if (tempPage > pagesCount)
      tempPage = pagesCount;
    int curPage = tempPage; //当前页结束页码

    int start = (curPage - 1)*pageSize; //当前页起始页码

    int end = curPage*pageSize + 1; //当前页结束页码

    int i = 0;
   
%>
<br>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0">
  <tr>
    <td class="page-title"><img src="images/page_title.gif" alt="title" width="17" height="12" align="absmiddle">&nbsp;&nbsp; 作品管理</td>
  </tr>
</table>
<br>
<div id="poster">
<form name="editForm" action="../EditWorks" method="post">
<input type="hidden" name="action" value="del" />
<input type="hidden" name="works_id"  id="works_id" value=""/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right"><input name="submitButton" type="button"  id="submitButton" onclick="javascript:window.location.href='works_upload.jsp'" value="发布作品" />&nbsp;&nbsp;<input name="submitButton" type="button"  id="submitButton" onclick="javascript:window.location.href='main.jsp'" value="返回管理" /></td>
  </tr>
</table>
<br>
<table id="bulletinListTable" width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="thetable">
  <thead>
    <tr> 
        <td align="left" height="15" valign="middle" class="right-title">作品标题</td>
       <td width="12%" align="center" valign="middle" class="right-title">作品预览</td>
        <td width="24%" align="center" valign="middle" class="right-title">发布日期</td>
        <td width="12%" align="center" valign="middle" class="right-title">操作</td>
      </tr>
  </thead>
  <% 
  Works_info works_info=new Works_info();
   Iterator it = list.iterator(); //叠代
    while (it.hasNext()) { //it.hasNext()判断有无下一条记录
      works_info = (Works_info) it.next(); //it.next()指针指向下一条
      i++;
     if (i > start && i < end){
//  for(int i=0;i<list.size();i++){  	
	//	Works_info works_info = (Works_info)list.get(i);
	%>
	  
      <tr id="item<%=works_info.getWorks_id()%>"> 
		  <td width="60%" height="28" valign="middle" class="row-line1"> 
		  <span id="title<%=works_info.getWorks_id()%>">
			<a href="../content.jsp?works_id=<%=works_info.getWorks_id()%>" class="in-table" ><%=works_info.getWorks_title()%></a>
		  </span>
	    </td>
        <td width="12%" align="center" valign="middle" class="row-line1">
		  <span id="pic<%=works_info.getWorks_id()%>">
		  <a href="javascript:void(0)"  class="in-table" onclick="show('pop<%=works_info.getWorks_id()%>')">预览</a>
          <div id="pop<%=works_info.getWorks_id()%>" class="pop" style="display:none"> 
          <div class="pop_head"><a href="javascript:void(0);" onclick="hide('pop<%=works_info.getWorks_id()%>')">关闭</a></div> 
              <div class="pop_body"><img style="display: inline; width: 290px; height: 290px;"  src="../upload/bigimages/<%=works_info.getWorks_file_name()%>"></div> 
         </div> 
		  </span>
		  </td>
		  <td width="24%" align="center" valign="middle" class="row-line1">
		  <span id="pubTime<%=works_info.getWorks_id()%>">
		  	<%=works_info.getWorks_release_time().length()>19?works_info.getWorks_release_time().substring(0,19):works_info.getWorks_release_time()%>
		  </span>
		  </td>
		  <td align="center" valign="middle" class="row-line1" nowrap="nowrap">
		  	<span id="Operation<%=works_info.getWorks_id()%>">
			<a href="works_edit.jsp?id=<%=works_info.getWorks_id()%>"><img src="../images/modp.gif" width="16" height="16" align="absmiddle" border="0" alt="编辑"></a>&nbsp;&nbsp;&nbsp;
			<a href="javascript:void(0)" onclick="return del(<%=works_info.getWorks_id()%>);"><img src="../images/delp.gif" width="16" height="16" border="0" alt="删除"></a> 
			</span>
		  </td>
	  </tr>
	<% }
  }
  %>
  <tr>
    <td align="center" colspan="6">
      <% if (curPage != 1) {  %>
    <font style='font-size: 8pt'><a href="works_list.jsp?page=1">第一页</a>
    <font style='font-size: 8pt'><a href="works_list.jsp?page=<%=curPage-1%>">上一页</a>
  <%}if (curPage != pagesCount) {%>
    <font style='font-size: 8pt'><a href="works_list.jsp?page=<%=curPage+1%>">下一页</a>
    <font style='font-size: 8pt'><a href="works_list.jsp?page=<%=pagesCount%>">最后一页</a>
  <%}%>&nbsp;&nbsp;共有<%=recordsCount%>条记录&nbsp;<%=curPage%>/<%=pagesCount%>页
    </td>
</tr>
</table>
</form>
</div>

</body>
</html>
