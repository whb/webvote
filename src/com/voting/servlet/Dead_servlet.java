package com.voting.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

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
