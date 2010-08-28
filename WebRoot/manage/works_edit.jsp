<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" pageEncoding="utf-8"%>
<%@ page import="com.voting.javabean.*,com.voting.logic.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="javascript" type="text/javascript">
function leftChar(){
	charMaxLen = 1000;
	if(charMaxLen-document.myForm.detail.value.length<0){
		alert('文字超出限制');
		return false;
	}else{
	document.getElementById('left_char').innerHTML = charMaxLen-document.myForm.detail.value.length;
	}
}
function showadv(){
if(document.myForm.types[1].checked==true){
var tr=document.getElementById("tr3");
var td=tr.insertCell();
td.innerHTML="请输入视频地址:<input name='workaddr' id='workaddr' type='text' size='12'/>";
}else{
}
}  


</script>

<head>
<title>作品编辑</title>
<BODY>
<%
String works_id=request.getParameter("id");
if(works_id==null||works_id.equals("")){
response.sendRedirect("works_list.jsp");
return;
}
WorksInfoLogic worksInfoLogic=new WorksInfoLogic();
Works_info works_info=worksInfoLogic.getWorksInfoMsgByID(Integer.parseInt(works_id));
%>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0">
  <tr>
    <td class="page-title"><img src="images/page_title.gif" alt="title" width="17" height="12" align="absmiddle">&nbsp;&nbsp;作品编辑</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right"><input name="submitButton" type="button" class="long-button" id="submitButton" onclick="javascript:window.location.href='works_list.jsp'" value="作品管理" />
  </tr>
</table>

<br>
<br>

<form method="post" action="../EditWorks" ENCTYPE="multipart/form-data" name="myForm" id="myForm" target="_self">
<input type="hidden" name="imgname" id="imgname" value="<%=works_info.getWorks_file_name()%>"/>
<input type="hidden" name="action" id="action" value="edit"/>
<input type="hidden" name="works_id" id="works_id" value="<%=works_id%>"/>
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
  <tr>
      <td width="1263" bgcolor="#FFFFFF">
<table width="100%" border="0" align="center" cellpadding="1" cellspacing="0">         
          <tr> 
            <td align="right" valign="middle"><font color="#FF0000">作品标题</font></td>
            <td height="19" valign="middle">&nbsp;</td>
            <td colspan="2"><input name="title" type="text" id="title" size="50"  maxlength="20" value="<%=works_info.getWorks_title()%>"></td>
            <td width="30%" valign="middle" class="bold-text">&nbsp;</td>
          </tr>  
          <tr> 
            <td align="right" valign="middle"><font color="#FF0000">作     者</font></td>
            <td height="19" valign="middle">&nbsp;</td>
            <td colspan="2"><input name="author" type="text" id="author" size="50"  maxlength="20" value="<%=works_info.getWorks_author() %>" ></td>
            <td width="30%" valign="middle" class="bold-text">&nbsp;</td>
          </tr>     			     
          <tr id="tr2"> 
            <td width="8%" align="right" valign="middle"><font color="#FF0000">作者简介</font></td>
            <td width="1%" height="28" valign="middle">&nbsp;</td>
            <td colspan="3">剩余可输入字符：<font color="#FF0000"><strong><span id="left_char">1000</span></strong></font><br> 
			<textarea name="detail" cols="60" rows="10" id="detail" onKeyDown="leftChar()" onKeyUp="leftChar()" onChange="leftChar()"><%=works_info.getWorks_recommond() %></textarea><font color="#FF0000">*</font> 
 </td>
          </tr>
          <tr id="tr3"> 
            <td width="8%" align="right" valign="middle"><font color="#FF0000">作品类型</font></td>
            <td width="1%" height="28" valign="middle">&nbsp;</td>
            <%String works_type=works_info.getWorks_type();%>
            <td >图片 <input name="types" type="radio" value="jpg" <%=works_type.equals("jpg")?"checked='checked'":""%>/> 视频 <input name="types" type="radio" value="flv"  <%=works_type.equals("flv")?"checked='checked'":""%>  onclick="showadv()"/>
            <%if(works_type.equals("flv")){ %> 视频地址:<input name='workaddr' id='workaddr' type='text' size='12' value="<%=works_info.getWorks_addr()%>"/><%}%></td>
             
          </tr>
          <tr> 
            <td align="right" valign="middle"><font color="#FF0000">选择作品</font></td>
            <td height="19" valign="middle">&nbsp;</td>
            <td colspan="2"><input name="file1" type="file" id="file1" size="50"  maxlength="20"></td>
            <td width="30%" valign="middle" class="bold-text">&nbsp;</td>
          </tr> 
        </table></td> 
  </tr>   
</table>
<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="9%">&nbsp;</td>
    <td width="91%"><input name="sub1" type="submit" class="long-button" id="submit5" value=" 提交" /></td>
  </tr>
</table>
</form>
</body>
</html>