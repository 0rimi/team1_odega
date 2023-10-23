<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.OdegaTheme_DAO" %>
<%@ page import="test.OdegaTheme_DTO" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>

<html lang="ko">
<script language="javascript">

/*function test(){  //여행지찾기 버튼
	alert("test");
	
}

function test1(){ //선택초기화 버튼  
	if ( confirm("초기화를 하시겠습니까?") ){
		 response.sendRedirect("./theme.jsp")
	} else {
		alert(2) ; 
	}
	
}*/
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>테마별</title>

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
	                <b>탐색</b>  <a href="./subscribe.jsp">구독중</a> 
	               	<hr>
	               	<b>테마별</b>
	               	<a href="./powerGuide.jsp">파워가이드</a>
	               	<hr><!-- 검색창 만들기 -->
	               	<div id="title" class="text-center">
	               	<b>원하시는 항목을 선택하면 추천 여행지를 확인할 수 있습니다!</b><br><br>
	               	</div>
	               	<!-- 검색 항목  페이지 분리 예정 아직 검색 기능을 몰라서요...-->
	               	<form name="addForm" action=" " method="post">
	               	<div id="category">
	               	<b>나이</b> 
	               	<input type="checkbox" value="20대미만"> 20대 미만
	               	<input type="checkbox" name="age" value="20대">20대
	               	<input type="checkbox" name="age" value="30대"> 30대 
	               	<input type="checkbox" name="age" value="40대"> 40대
	               	<input type="checkbox" name="age" value="50대이상"> 50대 이상 <br>
	               	<b>누구와</b> 
	               	<input type="checkbox" value="혼자"> 혼자
	               	<input type="checkbox" name="who" value="친구"> 친구
	               	<input type="checkbox" name="who" value="연인"> 연인
	               	<input type="checkbox" name="who" value="가족"> 가족 
	               	<input type="checkbox" name="who" value="반려견"> 반려견 
	               	<input type="checkbox" name="who" value="아이"> 아이 <br>
	               	<b>여행기간</b> 
	               	<input type="checkbox" value="당일치기"> 당일치기
	               	<input type="checkbox" name="day" value="1박2일"> 1박2일
	               	<input type="checkbox" name="day" value="2박3일"> 2박3일
	               	<input type="checkbox" name="day" value="장기여행"> 장기여행<br>
	               	<b>여행목적</b> <input type="checkbox" value="자연/힐링"> 자연/힐링
	               	<input type="checkbox" name="place" value="맛집"> 맛집
	               	<input type="checkbox" name="place" value="레포츠/체험"> 레포츠/체험
	               	<input type="checkbox" name="place" value="드라이브"> 드라이브
	               	<input type="checkbox" name="place" value="쇼핑"> 쇼핑
	               	<input type="checkbox" name="place"  value="사진/영상"> 사진/영상<br>
	               	<b>여행지역</b>
	               	<select>
	               	<option name="city" value="서울">서울</option>
	               	<option name="city" value="인천">인천</option>
	               	<option name="city" value="부산">부산</option>
	               	<option name="city" value="광주">광주</option>
	               	<option name="city" value="대전">대전</option>
	               	<option name="city" value="대구">대구</option>
	               	<option name="city" value="울산">울산</option>
	               	<option name="city" value="제주도">제주도</option>
	               	</select><br><br>
	               	<div id="button" class="text-center">
	               	<input type="reset" value="선택초기화" onclick="test1();">
	                <input type="submit" value=" 여행지찾기" onclick="test();" >
	               	</div>
	               	</from>
	               	<hr>
	               	
	               	<b>검색결과..</b><br><br>
	               	<div class="d-flex justify-content-start align-items-center">
                	<%@include file="dbconn.jsp" %>
                <% 
                	
				  	String sql ="select users.*, posts.*, images.* from posts join users on posts.user_num = users.num join images on posts.num = images.posts_num order by posts.post_like_cnt desc";
                	pstmt = conn.prepareStatement(sql);
    				rs = pstmt.executeQuery();
    				while (rs.next()) {
    			%>
                	<div id="profileBox" class="d-flex justify-content-center m-1">
                    <img src="<%=rs.getString("img_url") %>" width="200 px" height="180 px">
                    <div id="infoBox" class="m-3">
                        <a href="./content.jsp" title="<%=rs.getString("nickname")%>의 포스팅 보기" ><%=rs.getString("title") %><a><br>
                        
                        <%=rs.getString("nickname") %> 님 <br>
                        <%=rs.getTimestamp("reg") %><br>
                        <div>
                            <div class="tag">#힐링</div>
                            <div class="tag">#가을</div>
                            <div class="tag">#시티투어</div>
                        </div>
                        <div class="d-flex justify-content-start align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                            </svg>
                           
                            <div class="ms-1"><%=rs.getInt("post_like_cnt") %></div>
                        </div>
                </div>
            </div>
            </div>
            <br> <%} 	
					if (rs != null)
						rs.close();
		 			if (pstmt != null)
		 				pstmt.close();
		 			if (conn != null)
						conn.close();
			%>
          
            <hr>
      
        </div>
	          </div>
	          
    
    
    