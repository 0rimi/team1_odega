<%@ page contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page import="odega.bean.UserDAO" %>
<html lang="ko">
<html>
<head>
<title>임시 로그인 창</title>
</head>
<%
    String id = request.getParameter("id");
	String pw  = request.getParameter("pw");
	
	UserDAO manager = UserDAO.getInstance();
    int check= manager.userCheck(id,pw);

	if(check==1){
		session.setAttribute("user_id",id);
		session.setAttribute("user_pw", pw);
		response.sendRedirect("main.jsp");
	}else if(check==0){%>
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<%	}else{ %>
	<script>
	  alert("아이디가 맞지 않습니다..");
	  history.go(-1);
	</script>
<%}	%>	