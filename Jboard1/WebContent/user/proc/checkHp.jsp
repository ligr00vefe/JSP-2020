<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.jboard1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String hp = request.getParameter("hp");
	
	Connection conn = DBConfig.getConnection();
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_CHECK_HP);
	psmt.setString(1, hp);
	
	ResultSet rs = psmt.executeQuery();
	
	int result = 0;
	
	if(rs.next()) {
		result = rs.getInt(1);
	}
	
	rs.close();
	psmt.close();
	conn.close();
	
	
	// JSON 생성
	JsonObject json = new JsonObject();
	json.addProperty("result", result);		// 중복된 전화번호가 있으면 result=1, 중복된 전화번호가 없으면 result=0
	
	// JSON 출력
	out.print(json);
	

%>