<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 1: 세션제거
    session.invalidate();
    // 2: 메인 페이지 이동
    response.sendRedirect("MainPage.jsp");
%>