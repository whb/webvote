package com.voting.servlet;

import javax.servlet.*;


import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import com.voting.logic.Admin_login_logic;

public class Admin_login_servlet extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
    public void init() throws ServletException {
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
    	response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String admin_name = request.getParameter("admin_name");
        String admin_pwd = request.getParameter("admin_pwd");
        Date date=new Date();
       int num=date.getDate()+date.getMonth()+date.getYear();
        int flag = new Admin_login_logic().admin_login(admin_name,admin_pwd);
        if(flag == 0){
        	out.println("<script language=\"javascript\">alert('用户名或密码错误!请重新登录!');window.location.href='manage/login.htm';</script>");
            //response.sendRedirect("manage/login.htm");
           // return;
        }else{
            session.setAttribute("flag_login",num+"");
            session.setAttribute("name",admin_name);
            response.sendRedirect("manage/main.jsp");
            return;
        }
    }
    public void destroy() {
    }
}
