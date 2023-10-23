<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<title>내비 바</title>
<html lang="ko">
<header class="p-3 mb-3 border-bottom">
<%
	Connection conn = null;	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");		
		String url ="jdbc:oracle:thin:@192.168.219.123:1521/orcl";
		String user="java03";
		String pw ="java";
		conn = DriverManager.getConnection(url,user,pw);		
	} catch (SQLException ex) {
		out.println("데이터베이스 연결이 실패되었습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	}
	String sql = "select users.*, posts.*, images.* from posts join users on posts.user_num = users.num join images on posts.num = images.posts_num order by posts.post_like_cnt desc";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
%>
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
		  <li class="nav-item dropdown">
            <a class="nav-link px-2 link-body-emphasis dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">탐색</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">테마별</a></li>
              <li><a class="dropdown-item" href="#">파워가이드</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link px-2 link-body-emphasis dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">구독</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">구독 새 글</a></li>
              <li><a class="dropdown-item" href="#">구독 중 가이드</a></li>
            </ul>
          </li>
        </ul>
<!-- 검색창 -->
        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3 d-flex" role="search" method="post" action="search_list.jsp">
          <input type="search" class="form-control" aria-label="Search" placeholder="검색" name="keyword" aria-describedby="inputGroupPrepend2" required>
          <button class="btn btn-outline-success" type="submit"><svg width="20" height="20" class="DocSearch-Search-Icon" viewBox="0 0 20 20"><path d="M14.386 14.386l4.0877 4.0877-4.0877-4.0877c-2.9418 2.9419-7.7115 2.9419-10.6533 0-2.9419-2.9418-2.9419-7.7115 0-10.6533 2.9418-2.9419 7.7115-2.9419 10.6533 0 2.9419 2.9418 2.9419 7.7115 0 10.6533z" stroke="currentColor" fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round"></path></svg></button>
        </form>
<!-- if문 써서 session id==null일 경우 로그인 드롭다운만 보이도록 추가 -->
<%
	try {
		String id=null;

		if(session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}
		if(session.getAttribute("id")==null){%>
		<div class="dropdown text-end">
          <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://mblogthumb-phinf.pstatic.net/MjAyMDExMDFfMTgy/MDAxNjA0MjI4ODc1NDMw.Ex906Mv9nnPEZGCh4SREknadZvzMO8LyDzGOHMKPdwAg.ZAmE6pU5lhEdeOUsPdxg8-gOuZrq_ipJ5VhqaViubI4g.JPEG.gambasg/%EC%9C%A0%ED%8A%9C%EB%B8%8C_%EA%B8%B0%EB%B3%B8%ED%94%84%EB%A1%9C%ED%95%84_%ED%95%98%EB%8A%98%EC%83%89.jpg?type=w800" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small" style="">
            <li><a class="dropdown-item" href="#">로그인</a></li>
          </ul>
        </div>
<% }else{ %>
        <div class="dropdown text-end">
          <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://mblogthumb-phinf.pstatic.net/MjAyMDExMDFfMTgy/MDAxNjA0MjI4ODc1NDMw.Ex906Mv9nnPEZGCh4SREknadZvzMO8LyDzGOHMKPdwAg.ZAmE6pU5lhEdeOUsPdxg8-gOuZrq_ipJ5VhqaViubI4g.JPEG.gambasg/%EC%9C%A0%ED%8A%9C%EB%B8%8C_%EA%B8%B0%EB%B3%B8%ED%94%84%EB%A1%9C%ED%95%84_%ED%95%98%EB%8A%98%EC%83%89.jpg?type=w800" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small" style="">
            <li><a class="dropdown-item" href="#">내 정보</a></li>
            <li><a class="dropdown-item" href="#">좋아요 한 글</a></li>
            <li><a class="dropdown-item" href="#">날 구독한 사람들</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">로그아웃</a></li>
          </ul>
        </div>
        <% }}catch(Exception e){e.printStackTrace();} %>
      </div>
    </div>
  </header>