<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="db.posts.PostDAO" %>
<%@ page import="db.posts.PostDTO" %>
<%@ page import="db.users.UserLikeDAO" %>

<html lang="ko">
<html>
<head>
<title>메인 화면</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</head>

<body>
<%@ include file="nav.jsp"  %>
  <div class="album py-5 bg-body-tertiary">
    <div class="container">
     <h3 style="color: #000000;">오늘의 추천</h3><br />
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
<!-- 추천 게시글(좋아요 순) 영역 -->
<%
	int count = 0;
	
	while(rs.next()){
		count++;
		if (count > 3) {
		    break;
		  }
%>
        <div class="col">
         <div class="card shadow-sm">
<!-- 사진 클릭하면 게시글 상세 이동 -->
		  <a href="content.jsp"><!-- ?posts_num=<%=rs.getInt("posts_num")%> 추가 -->
           <img src="<%=rs.getString("img_url")%>" style="width: 400px; height: 400px;"></a>
            <div class="card-body">
             <p class="card-text"><%=rs.getString("title") %></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="submit" class="btn btn-sm btn-outline-secondary" style="width: 48px; height: 31px;" onclick="document.location.href='like_cnt_up.jsp?posts_num=<%=rs.getInt("posts_num")%>'"><img src="https://media.istockphoto.com/id/1128400054/ko/%EB%B2%A1%ED%84%B0/%EB%A7%88%EC%9D%8C-%EC%82%AC%EB%9E%91-%EB%B0%9C%EB%A0%8C%ED%83%80%EC%9D%B8%EC%9D%98-%EB%82%A0%EC%9D%98-%EC%83%81%EC%A7%95-%ED%9D%B0%EC%83%89-%EB%B0%B0%EA%B2%BD%EC%97%90-%EA%B3%A0%EB%A6%BD-%EB%90%9C-%ED%8F%89%EB%A9%B4-%EB%B9%A8%EA%B0%84%EC%83%89-%EC%95%84%EC%9D%B4%EC%BD%98%EC%9E%85%EB%8B%88%EB%8B%A4-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8%EC%9E%85%EB%8B%88%EB%8B%A4-%EB%B2%A1%ED%84%B0.jpg?s=612x612&w=0&k=20&c=cROqi2BRjaXrqXdGb1qPGoVQiSo8UL47lSYEwQ2vbcc=" style="width: 80%" ></button>
                  <button type="button" class="btn btn-sm btn-outline-secondary"><%=rs.getInt("post_like_cnt") %></button>
                </div>
                <small class="text-body-secondary"><%=rs.getString("nickname") %></small>
              </div>
             </div>
            </div>
           </div>
<%
	}
%>
		</div>
	   </div>
	  </div>
<!-- 여기까지 한 블록에 DB를 넣어 rs.next()로 표현 예정 -->
<!-- 영역 하나당 게시글 3개까지 표현 -->
        
<!-- 에디터 작성 글 라인 -->
<!-- 에디터 기준 = user_num이 1~5번 -->
  <div class="album py-5 bg-body-tertiary">
    <div class="container">
     <h3 style="color: #000000;">에디터 Pick</h3><br />
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
<!-- 에디터 게시글 영역 -->
<%
	count = 0;
	sql = "select users.*, posts.*, images.* from posts join users on posts.user_num = users.num join images on posts.num = images.posts_num where user_num in (1,2,3,4)";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		count++;
		if (count > 3) {
		    break;
		  }
%>
        <div class="col">
         <div class="card shadow-sm">
<!-- 사진 클릭하면 게시글 상세 이동 -->
          <a href="#">
           <img src="https://img.freepik.com/premium-vector/simple-vector-red-scratch-rubber-stamp-sample-at-transparent-effect-background_9834-1272.jpg" style="width: 100%"></a>
            <div class="card-body">
             <p class="card-text"><%=rs.getString("title") %></p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="submit" class="btn btn-sm btn-outline-secondary" style="width: 48px; height: 31px;" onclick="document.location.href='like_cnt_up.jsp?posts_num=<%=rs.getInt("posts_num")%>&user_id=<%rs.getString("user_id");%>'"><img src="https://media.istockphoto.com/id/1128400054/ko/%EB%B2%A1%ED%84%B0/%EB%A7%88%EC%9D%8C-%EC%82%AC%EB%9E%91-%EB%B0%9C%EB%A0%8C%ED%83%80%EC%9D%B8%EC%9D%98-%EB%82%A0%EC%9D%98-%EC%83%81%EC%A7%95-%ED%9D%B0%EC%83%89-%EB%B0%B0%EA%B2%BD%EC%97%90-%EA%B3%A0%EB%A6%BD-%EB%90%9C-%ED%8F%89%EB%A9%B4-%EB%B9%A8%EA%B0%84%EC%83%89-%EC%95%84%EC%9D%B4%EC%BD%98%EC%9E%85%EB%8B%88%EB%8B%A4-%EB%B2%A1%ED%84%B0-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8%EC%9E%85%EB%8B%88%EB%8B%A4-%EB%B2%A1%ED%84%B0.jpg?s=612x612&w=0&k=20&c=cROqi2BRjaXrqXdGb1qPGoVQiSo8UL47lSYEwQ2vbcc=" style="width: 80%" ></button>
                  <button type="button" class="btn btn-sm btn-outline-secondary"><%=rs.getInt("post_like_cnt") %></button>
                </div>
                <small class="text-body-secondary"><%=rs.getString("nickname") %></small>
              </div>
             </div>
            </div>
           </div>
<%
	}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
%>        
	    </div>
	   </div>
	  </div>
</body>
</html>