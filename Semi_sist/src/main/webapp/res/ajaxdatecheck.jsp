<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

String seldate = request.getParameter("seldate");

JSONObject ob = new JSONObject();
ob.put("seldate", seldate);

%>
<%=ob.toString() %>