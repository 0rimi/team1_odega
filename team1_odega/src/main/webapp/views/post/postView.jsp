<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import = "odega.bean.PostsDAO"%>
<%@ page import = "odega.bean.PostsDTO"%>
<%@ page import = "odega.bean.MapDAO"%>
<%@ page import = "odega.bean.MapDTO"%>

<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글</title>

    <!--boot css-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <!--boot js-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <!-- naver map api -->
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=YOUR_CLIENT_ID"></script>
    
    <!-- css -->
    <link href="../../resources/static/css/postView.css" rel="stylesheet">
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

    <nav>
        
    </nav>


<%
	//임의의 포스트번호 1(이 후 파라미터로 받아오기)
	PostsDAO postDAO = new PostsDAO();
	PostsDTO post = postDAO.getPost(1);

   SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd HH:mm");
%>
	<section>
        <div>
            <div class="mt-3 ms-3">
                <b><%=post.getNickname() %></b> 님의 홍대나들이
            </div>

            <!-- profileBox -->
            <hr>
            <div class="d-flex justify-content-start align-items-center">
                <div id="profileBox" class="d-flex justify-content-center m-1">
                    <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
                    <div id="infoBox" class="m-3">
                        <b><%=post.getTitle() %></b><br>
                        <%=post.getNickname() %> 님<br>
                        <%= sdf.format(post.getReg())%> 수정<br>
                        <div>
                            <div class="tag">#홍대</div>
                            <div class="tag">#감성</div>
                            <div class="tag">#반려견</div>
                        </div>
                        <div class="d-flex justify-content-start align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                            </svg>
                            <!--<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                            </svg>-->
                            <div class="ms-1"><%=post.getPost_like_cnt() %></div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <!-- /profileBox -->
        </div>


		<%
		//임의의 포스트번호 1(이 후 파라미터로 받아오기)
			MapDAO mapDAO = new MapDAO();
			List<MapDTO> mapList = mapDAO.getMapList(1);
		%>
		<!--post-->
        <div id="contentBox">
            <div class="d-flex justify-content-center">
                <div id="maincon">
                    <div id="title" class="text-center"><b><i><%=post.getTitle() %></i></b></div>
                    <div id="content" class="text-left mt-3">
                        <%=post.getContent() %>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-center mt-5">
                <div id="mapinfo" class="text-center">
                    <div class="d-flex justify-content-center">
                        <div id="imgs" class="d-flex justify-content-center">
							<ul class="list d-flex justify-content-between">
								<li class="is_on flex-fill"><a href="#tab1" class="btn btn-block flex-fill">Tab Button1</a>
									<div id="tab1" class="cont">
										<div id="imgBox">
											<img width="700px" src="https://file2.nocutnews.co.kr/newsroom/image/2023/02/05/202302050952179184_0.jpg" alt="">
										</div>
										<div class="d-flex justify-content-center">
											<div id="info" class="text-center">
												<div>넌 나 아니면 어떡하려 그래 이것 봐 매번 널 챙겨 늘 덜렁대며 눈 앞에 두고도 찾질 못하는 걸 이 순간 내가 말하고 있는 건 단지 물건만은 아냐 더 방심하다 진짜 소중한 걸 잃어버릴지도 몰라 이 세상의 모든 규칙들은 깨어지기 위해서 있다 하던데 Yeah 밤새 너로 채운 내 꿈들을 이젠 이루어 볼 Chance You break your rules 평행선 같은 사이 안 해 Anymore You break
													your rules 그 선을 넘어갈게 먼저 네게로 You break your rules 커지는 심장 소리 놀랐다면 I'm sorry 꿈 속의 눈빛으로 날 바라봐 줘 You break your rules Tell me why 널 스치는 나의 손이 왜 이렇게 자꾸 떨려 더는 주저 말고 Go go</div>
											</div>
										</div>
									</div>
								</li>
								<li class="flex-fill"><a href="#tab2" class="btn flex-fill">Tab Button2</a>
									<div id="tab2" class="cont">Tab Content2</div></li>
								<li class="flex-fill"><a href="#tab3" class="btn flex-fill">Tab Button3</a>
									<div id="tab3" class="cont">Tab Content3</div></li>
							</ul>
						</div>
                    </div>
                </div>
            </div>
        </div>
        <!--/post-->
    </section>
</body>

<script>

	const tabList = document.querySelectorAll('#imgs .list li');

	for (var i = 0; i < tabList.length; i++) {
		tabList[i].querySelector('.btn').addEventListener('click', function(e) {
			console.log("클릭: "+this)
			e.preventDefault();
			for (var j = 0; j < tabList.length; j++) {
				tabList[j].classList.remove('is_on');
			}
			this.parentNode.classList.add('is_on');
		});
	}
</script>
</html>