
function fun_login()
{
  if(fun_admin_name())
  {
    return false;
  }
  else if(fun_admin_pwd())
  {
    return false;
  }
  else
  {
    document.form_login.action="../admin_login_servlet";
    return true;
  }
}
function fun_admin_name()
{
if(document.form_login.admin_name.value == "")
    {
        alert("用户名不能为空！！");
        document.form_login.admin_name.focus();
        return true;
    }
    else if(document.form_login.admin_name.value.indexOf(' ') >= 0)
    {
        alert("用户名不能包含空格！！");
        document.form_login.admin_name.focus();
        return true;
    }
    else if(document.form_login.admin_name.value.length > 30)
    {
        alert("用户名超长！！");
        document.form_login.admin_name.focus();
        return true;
    }
   //校验文本框输入内容的非法字符的方法
    else if(document.form_login.admin_name.value.indexOf('=') >= 0 ||
            document.form_login.admin_name.value.indexOf('\'') >= 0 ||
            document.form_login.admin_name.value.indexOf('\\') >= 0 ||
            document.form_login.admin_name.value.indexOf('\/') >= 0 ||
            document.form_login.admin_name.value.indexOf('--') >= 0 ||
            document.form_login.admin_name.value.indexOf('//') >= 0)
    {
        alert("用户名包含了非法字符！！");
        document.form_login.name_admin.focus();
        return true;
    }
    else
    {
        return false;
    }
}
function fun_admin_pwd()
{
if(document.form_login.admin_pwd.value == "")
    {
        alert("密码不能为空！！");
        document.form_login.admin_pwd.focus();
        return true;
    }
    else if(document.form_login.admin_pwd.value.indexOf(' ') >= 0)
    {
        alert("密码不能包含空格！！");
        document.form_login.admin_pwd.focus();
        return true;
    }
    else if(document.form_login.admin_pwd.value.length > 30)
    {
        alert("密码超长！！");
        document.form_login.admin_pwd.focus();
        return true;
    }
   //校验文本框输入内容的非法字符的方法
    else if(document.form_login.admin_pwd.value.indexOf('=') >= 0 ||
            document.form_login.admin_pwd.value.indexOf('\'') >= 0 ||
            document.form_login.admin_pwd.value.indexOf('\\') >= 0 ||
            document.form_login.admin_pwd.value.indexOf('\/') >= 0 ||
            document.form_login.admin_pwd.value.indexOf('--') >= 0 ||
            document.form_login.admin_pwd.value.indexOf('//') >= 0)
    {
        alert("密码包含了非法字符！！");
        document.form_login.admin_pwd.focus();
        return true;
    }
    else
    {
        return false;
    }
}
