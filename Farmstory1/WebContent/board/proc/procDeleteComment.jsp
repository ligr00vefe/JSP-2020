<%@page import="kr.co.farmstory1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String seq = request.getParameter("seq");
	String parent = request.getParameter("parent");
	
	// 1, 2단계
		Connection conn = DBConfig.getConnection();	
	
	// 3단계
		PreparedStatement psmtComment = conn.prepareStatement(SQL.DELETE_COMMENT_COUNT);
		psmtComment.setString(1, parent);
		
		PreparedStatement psmt = conn.prepareStatement(SQL.DELETE_COMMENT);
		psmt.setString(1, seq);
	
	// 4단계
		psmt.executeUpdate();
		psmtComment.executeUpdate();
	
	// 5단계		
	// 6단계
		psmt.close();
		conn.close();
		
	// 리다이렉트
		response.sendRedirect("/Jboard1/view.jsp?seq="+parent);


%>