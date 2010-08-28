<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>
登录
</title>
<link rel="icon" href="../favicon.ico" type="image/x-icon"/>
<link href="../css/oushi_vote.css" rel="stylesheet" type="text/css"/>
<script language="JavaScript" src="../js/login_yz.js" type="" ></script>
</head>
<body bgcolor="#e3e3e3">
<center><h1>欧时网投票系统后台登录</h1><hr/>
<form action="" name="form_login" method="POST">
<table width="200" border="1">
<tr>
<td>用户名:</td><td><input type="text" name="admin_name" style="width:100px; line-height:20px;"/></td>
</tr>
<tr>
<td>密码:</td><td><input type="password" name="admin_pwd" style="width:100px; line-height:20px;"/></td>
</tr>
<tr>
<td align="center" colspan="2"><input type="submit" name="sub" value="登录" onClick="return fun_login();"/>&nbsp;&nbsp;
<input type="reset" name="res" value="重置" /></td>
</tr>
</table>
</form>
<%
String flag_login = (String)session.getAttribute("flag_login");
if(flag_login == null)flag_login = "";
else if(flag_login.equals("y")){
  flag_login = "";
  response.sendRedirect("vote_admin.jsp");
  return;
}
else flag_login = "您的用户名或密码不正确请重试！！！";
%>
<font color="red"><%=flag_login%></font>
</center>
</body>
</html>
