<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <nav>
        
    </nav>

    <section>
        <div>
            <div class="mt-3 ms-3">
                <b>53세실업자</b> 님의 홍대나들이
            </div>

            <!-- profileBox -->
            <hr>
            <div class="d-flex justify-content-start align-items-center">
                <div id="profileBox" class="d-flex justify-content-center m-1">
                    <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png">
                    <div id="infoBox" class="m-3">
                        <b>맨날 가는 홍대, 오늘은 뭐할지 고민돼?</b><br>
                        53세실업자 님<br>
                        2023.10.09 수정<br>
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
                            <div class="ms-1">115</div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <!-- /profileBox -->
        </div>
        <!--post-->
        <div id="contentBox">
            <div class="d-flex justify-content-center">
                <div id="maincon">
                    <div id="title" class="text-center"><b><i>맨날 가는 홍대, 오늘은 뭐할지 고민돼?</i></b></div>
                    <div id="content" class="text-left mt-3">
                        We t-thrilling out 오직 둘 만의 hidden round 거침없이 펼치는 night 보름달 빛 아래 Tu tu ru ru, tu tu ru ru 짜릿해 좀 낯선 chemistry 퍼져가는 이 느낌 We t-thrilling out 중독된 듯해 Tu tu ru ru, tu tu ru ru T-thrill ride, t-thrill ride (how ya feeling) T-thrill ride, t-thrill ride (ah) T-thrill ride, t-thrill ride (chilling, chilling) Tu tu ru ru, tu tu ru ru 이리저리 좀 더 멀리 우릴 이끌 crazy 단 둘이 모험해 Until the moment 가장 즉흥적인 감정들만 choice babe 상상 끝에 머물던 네 호기심을 따라 If you wanna, yeah yeah yeah Let's hype up, this vibrate (vibrate) 롤러코스터보다 더 빠르게 (oh) 돌진하는 feel 절대 멈출 생각 없어 점점 더 빨라 You got me (nope!) 심장의 drum kick Boom, boom, boom, boom Do it again and again
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-center mt-5">
                <div id="mapinfo" class="text-center">
                    <div class="d-flex justify-content-center">
                        <div id="imgs" class="d-flex justify-content-center">
                            <div id="imgBox">
                                <div id="thumbs" class="carousel slide">
                                    <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="https://i.namu.wiki/i/OKTgddWD1-sapikezeudwGoMkjTukW_e989mT2sbNSYb7scPEh8IRXoFmc7xSDOIaq7CZhHCKeM0btxWL1c-zQ.webp" class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="https://cdn.9oodnews.com/news/photo/202102/3380_4424_2525.jpg" class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="https://pbs.twimg.com/media/EK3bX9TUEAAdo2j.jpg" class="d-block w-100" alt="...">
                                    </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#thumbs" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#thumbs" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center">
                        <div id="info" class="text-center">
                            <div>
                                넌 나 아니면 어떡하려 그래 이것 봐 매번 널 챙겨 늘 덜렁대며 눈 앞에 두고도 찾질 못하는 걸 이 순간 내가 말하고 있는 건 단지 물건만은 아냐 더 방심하다 진짜 소중한 걸 잃어버릴지도 몰라 이 세상의 모든 규칙들은 깨어지기 위해서 있다 하던데 Yeah 밤새 너로 채운 내 꿈들을 이젠 이루어 볼 Chance You break your rules 평행선 같은 사이 안 해 Anymore You break your rules 그 선을 넘어갈게 먼저 네게로 You break your rules 커지는 심장 소리 놀랐다면 I'm sorry 꿈 속의 눈빛으로 날 바라봐 줘 You break your rules Tell me why 널 스치는 나의 손이 왜 이렇게 자꾸 떨려 더는 주저 말고 Go go 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        <!--/post-->
        

    </section>

    <footer>
        <hr>
        ODEGA 일로와
    </footer>
</body>
</html>