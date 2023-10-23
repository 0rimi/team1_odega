<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.OdegaTheme_DAO" %>
<%@ page import="test.OdegaTheme_DTO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>파워가이드</title>

    <!--boot css-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <!--boot js-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <link href="./postView.css" rel="stylesheet">
</head>
<body>
    <!--header-->
    <header class="bg-dark text-white d-flex justify-content-between align-items-center">
        <logo class="m-3">ODEGA</logo>
        <!-- 로그인 안했을때 -->
        <div id="loginBox" class="d-flex justify-content-end m-3">
            <a>로그인</a>
            <a>회원가입</a>
        </div>
        <!-- 로그인 했을때
        <div id="miniProfile"></div> -->
    </header>
    <!--/header-->

    
    <section>
    	<div>
    		<!-- 메뉴 -->
	    	<div class="mt-3 ms-3">
	                <b>탐색</b><a href="./subscribe.jsp"> 구독중</a>	               	<hr>
	               	<a href="./main_theme.jsp">테마별</a>
	               	<b>파워가이드</b> 	
	          </div><!-- 검색창만들기 -->
	          <hr>
	          
	          
            <!-- 파워가이드 -->
            
           <div class="container px-4 py-5" id="profile">
   			 <b class="pb-2 border-bottom" align="center">이달의 파워가이드</b>
    			<div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
    
    		<!-- 파워가이드 3명 프로필 나타내기 if , break로 수정 예정 -->
    		<%@include file="dbconn.jsp" %>
    		
                <% 
				  	String sql ="select users.*, images.* from users join images on users.num = images.posts_num order by users.user_like_cnt desc";
                	pstmt = conn.prepareStatement(sql);
    				rs = pstmt.executeQuery();
    				while (rs.next()) {
    			%>
    			
      	<div class="col d-flex align-items-start">
       	 <div class="icon-square text-body-emphasis bg-body-secondary d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3">
          <img src="<%=rs.getString("img_url") %>" width="100 px" height="100px">
        </div>
        <div>
          <h3 class="fs-2 text-body-emphasis"><%=rs.getString("nickname") %> 님 </h3>
          <p>구독 <%=rs.getInt("user_like_cnt") %> 명</p>
          <a href="./content.jsp" class="btn btn-primary">
            방문하기 
          </a>
        </div>
      </div>
      <%} %>

     <!-- /프로필 끝  -->
     <!-- 아래에다 뭘 하나 더 넣어야 할 듯 랜덤으로 추천가이드랄지 -->
     
    </div>
  	</div>
    </section>
</html>