package com.voting.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Dead_servlet extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
    public void init() throws ServletException {
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        HttpSession session = request.getSession(true);
        session.invalidate();
        response.sendRedirect("manage/login.htm");
    }
    public void destroy() {
    }
}
