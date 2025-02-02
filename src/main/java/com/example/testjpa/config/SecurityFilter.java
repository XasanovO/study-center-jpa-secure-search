package com.example.testjpa.config;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter("/*")
public class SecurityFilter implements Filter {
    List<String> openPages = new ArrayList<>(
            List.of(
                    "/",
                    "/static/bootstrap.min.css",
                    "/home/group.jsp",
                    "/home/student.jsp",
                    "/auth/login.jsp",
                    "/auth/login"
            )
    );


    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        var request = (HttpServletRequest) servletRequest;
        var response = (HttpServletResponse) servletResponse;
        String requestURI = request.getRequestURI();
        if (openPages.contains(requestURI)) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        HttpSession session = request.getSession();
        Object id = session.getAttribute("user");
        if (id == null) {
            response.sendRedirect("/auth/login.jsp");
            return;
        }
        filterChain.doFilter(servletRequest, servletResponse);

    }
}
