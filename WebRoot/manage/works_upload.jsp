<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" pageEncoding="utf-8" import="java.util.*"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="javascript" type="text/javascript">
function checkImg(){
	var file=document.getElementById("FILE1").value
	if(file==""){
		alert("请选择上传文件");
		return false;
	}else if((file.indexOf(".JPG")!=-1)||(file.indexOf(".jpg")!=-1)||(file.indexOf(".gif")!=-1)||(file.indexOf(".GIF")!=-1)){
	   document.getElementById("flag").value='img';
		document.getElementById("myForm").submit();
	}else{
		alert("您选择的图片类型不正确！");
		return ;
	}
}
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
<title>作品发布</title>
<BODY>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0">
  <tr>
    <td class="page-title"><img src="images/page_title.gif" alt="title" width="17" height="12" align="absmiddle">&nbsp;&nbsp;作品发布</td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right"><input name="submitButton" type="button" class="long-button" id="submitButton" onclick="javascript:window.location.href='works_list.jsp'" value="作品管理" /></td>
  </tr>
</table>

<br>
<br>
<form METHOD="post" action="../AddWorks" ENCTYPE="multipart/form-data" name="myForm" id="myForm" target="_self">
<input type="hidden" name="flag" id="flag" value=""/>
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
  <tr>
      <td width="1263" bgcolor="#FFFFFF">
<table width="100%" border="0" align="center" cellpadding="1" cellspacing="0">         
          <tr> 
            <td align="right" valign="middle"><font color="#FF0000">作品标题</font></td>
            <td height="19" valign="middle">&nbsp;</td>
            <td colspan="2"><input name="title" type="text" id="title" size="50"  maxlength="20"></td>
            <td width="30%" valign="middle" class="bold-text">&nbsp;</td>
          </tr>  
          <tr> 
            <td align="right" valign="middle"><font color="#FF0000">作     者</font></td>
            <td height="19" valign="middle">&nbsp;</td>
            <td colspan="2"><input name="author" type="text" id="author" size="50"  maxlength="20" ></td>
            <td width="30%" valign="middle" class="bold-text">&nbsp;</td>
          </tr>     			     
          <tr id="tr2"> 
            <td width="8%" align="right" valign="middle"><font color="#FF0000">作者简介</font></td>
            <td width="1%" height="28" valign="middle">&nbsp;</td>
            <td colspan="3">剩余可输入字符：<font color="#FF0000"><strong><span id="left_char">1000</span></strong></font><br> 
			<textarea name="detail" cols="60" rows="10" id="detail" onKeyDown="leftChar()" onKeyUp="leftChar()" onChange="leftChar()"></textarea><font color="#FF0000">*</font> 
 </td>
          </tr>
          <tr id="tr3"> 
            <td width="8%" align="right" valign="middle"><font color="#FF0000">作品类型</font></td>
            <td width="1%" height="28" valign="middle">&nbsp;</td>
            <td >图片 <input name="types" type="radio" value="jpg" /> 视频 <input name="types" type="radio" value="flv"  onclick="showadv()"/></td>
             
          </tr>
          <tr> 
            <td align="right" valign="middle"><font color="#FF0000">选择作品</font></td>
            <td height="19" valign="middle">&nbsp;</td>
            <td colspan="2"><input name="file1" type="file" id="file1" size="50"  maxlength="20" onpropertychange="document.all.imgID.src='file:///'+this.value"></td>
            <td width="30%" valign="middle" align="left" class="bold-text">&nbsp;</td>
          </tr>
         <tr bgcolor="#f5f5f5">
     <td height="70" align="center" valign="middle"><font color="#FF0000">上传预览</font></td>
      <td height="70" align="center" valign="middle">&nbsp;</td>
     <td height="70" align="left" valign="middle"><img id="imgID" width="82" height="65" border="0" >&nbsp;
     </td>
  </tr> 
        </table></td> 
  </tr>   
</table>
<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="9%">&nbsp;</td>
    <td width="91%"><input name="submit" type="submit" class="long-button" id="submit5" value=" 提交" onClick="return checkImg()"></td>
  </tr>
</table>
</form>
</body>
</html>