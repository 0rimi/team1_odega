<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*"  %>
<%@ page import="db.posts.PostDAO" %>
<%@ page import="db.users.UserLikeDAO" %>
<html lang="ko">

<%
	
	int posts_num = Integer.parseInt(request.getParameter("posts_num"));
	String user_id = request.getParameter("user_id");
	
	PostDAO dao = new PostDAO();
	dao.likeUp(posts_num);
	
	UserLikeDAO like_dao = new UserLikeDAO();
	like_dao.like(user_id, posts_num);
	
	response.sendRedirect("main.jsp");
%>