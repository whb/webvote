<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.voting.logic.Works_info_discuss_info_logic" %>
<%@ page import="com.voting.javabean.Works_info_discuss_info_bean" %>
<%
  String flag_login = (String) session.getAttribute("flag_login");
  if (flag_login == null || flag_login.equals("n")) {
    session.invalidate();
    response.sendRedirect("login.jsp");
    return;
  }
%>
<html>
<head>
<title>
评论管理
</title>
<link rel="icon" href="../favicon.ico" type="image/x-icon"/>
<link href="../css/oushi_vote.css" rel="stylesheet" type="text/css"/>
<script language="JavaScript" src="../js/vote_admin_yz.js" type="" ></script>
</head>
<body bgcolor="#e3e3e3">
<center>
<h1>评论管理</h1><hr/>
<div align="right" style="width:95%; line-height:30px;"><a href="../dead_servlet">退出</a></div>
<table width="95%" border="1" align="center">
<tr align="center">
<td width="5%">序号</td>
<td width="25%">作品名称</td>
<td width="10%">作者</td>
<td width="35%">评论内容</td>
<td width="20%">评论时间</td>
<td width="5%">审核</td>
</tr>
<%
ArrayList list = new Works_info_discuss_info_logic().getWorks_info_discuss_info();
Works_info_discuss_info_bean widib = new Works_info_discuss_info_bean();
%>
<%----------------------------------------------------------------------------%>
<%
    String p = request.getParameter("page");
    int tempPage = 1;
    if (p != null)
      tempPage = Integer.parseInt(p);
    int recordsCount = list.size(); //总记录数
//    System.out.println(recordsCount);
    int pageSize = 20; //每页记录数
    int pagesCount = (recordsCount + pageSize - 1) / pageSize; //总页数
//    System.out.println(pagesCount);
    if (tempPage < 0)
      tempPage = 1;
    if (tempPage > pagesCount)
      tempPage = pagesCount;
    int curPage = tempPage; //当前页结束页码
//    System.out.println(curPage);
    int start = (curPage - 1)*pageSize; //当前页起始页码
//    System.out.println(start);
    int end = curPage*pageSize + 1; //当前页结束页码
//    System.out.println(end);
    int i = 0;
    Iterator it = list.iterator(); //叠代
    while (it.hasNext()) { //it.hasNext()判断有无下一条记录
      widib = (Works_info_discuss_info_bean) it.next(); //it.next()指针指向下一条
      i++;
     if (i > start && i < end){%>
<%----------------------------------------------------------------------------%>
<tr align="center">
<td><%=i%></td>
<td><%=widib.getWorks_title()%></td>
<td><%=widib.getWorks_author()%></td>
<td><%=widib.getDiscuss_commond()%></td>
<td><%=widib.getDiscuss_time()%></td>
<td>
<%
String str_status = widib.getDiscuss_status();
String temp = str_status;
if(str_status.equals("0"))str_status = "<font color='red'>待审</font>";
else str_status = "<font color='blue'>通过</font>";
%>
  <a href="../discuss_status_servlet?id=<%=widib.getDiscuss_id()%>&status=<%=temp%>"><%=str_status%></a>
</td>
</tr>
<%----------------------------------------------------------------------------%>
<%}}%>
 <tr>
    <td align="center" colspan="6">
      <% if (curPage != 1) {  %>
    <a href="discuss_admin.jsp?page=1">第一页</a>
    <a href="discuss_admin.jsp?page=<%=curPage-1%>">上一页</a>
  <%}if (curPage != pagesCount) {%>
    <a href="discuss_admin.jsp?page=<%=curPage+1%>">下一页</a>
    <a href="discuss_admin.jsp?page=<%=pagesCount%>">最后一页</a>
  <%}%>&nbsp;&nbsp;共有<%=recordsCount%>条记录&nbsp;<%=curPage%>/<%=pagesCount%>页
    </td>
</tr>
<%----------------------------------------------------------------------------%>
</table>
<br/><br/><br/>
<a href="">XXXXXXX</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:history.go(-1)">返回查询</a>
</center>
</body>
</html>
