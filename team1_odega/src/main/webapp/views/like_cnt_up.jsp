<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*"  %>
<%@ page import="odega.bean.PostsDAO" %>
<%@ page import="odega.bean.UserLikeDAO" %>
<html lang="ko">

<%
	
	int post_num = Integer.parseInt(request.getParameter("posts_num"));
	String user_id = (String)session.getAttribute("user_id");
	
	PostsDAO dao = new PostsDAO();
	dao.likeUp(post_num);
	
	UserLikeDAO like_dao = new UserLikeDAO();
	like_dao.saveLikeList(user_id, post_num);
	if(like_dao.saveLikeList(user_id, post_num) == -1){
		%>이미 좋아요 한 글입니다.<%
	}
	
	response.sendRedirect("main.jsp");
%>