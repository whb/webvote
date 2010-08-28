package com.voting.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voting.logic.Works_info_discuss_info_logic;
public class Discuss_status_servlet extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
    public void init() throws ServletException {
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        //得到传来的参数
        String discuss_status = request.getParameter("status");
        String discuss_id = request.getParameter("id");
        //判断原来的状态取反
        if(discuss_status.equals("0"))discuss_status = "1";
        else if(discuss_status.equals("1"))discuss_status = "0";
        else discuss_status = "0";
        //修改数据库中的记录
        new Works_info_discuss_info_logic().update_discuss_status(discuss_id,discuss_status);
        //跳转回评论管理页
        response.sendRedirect("manage/discuss_admin.jsp");
    }
    public void destroy() {
    }
}
