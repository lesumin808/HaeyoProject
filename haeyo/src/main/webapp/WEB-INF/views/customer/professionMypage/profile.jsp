<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Document</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <link href="resources/css/proMypage/Profession_profile.css" rel="stylesheet">
   <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
   <script src="resources/js/proMypage/Profession_profile.js" defer></script>
   <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99b9a8524e76961c89d8abd8820de6d6&libraries=services"></script>
   <script>
/*    $(document).ready(function(){
      
    $(".subCategory").each(function() { //순회 처리 
         console.log(this.value);
         if(this.value == 1){  //값 비교 
             this.style.display = "flex";  //checked 처리
         }else{
            this.style.display = "none";
         }
      }); 
         
      
   });
     */
    
     
   </script> 
</head>

<body>
    <wrap>
       
        <!-------- main ----------->
        <div id="container">
            <div id="container_wrap">
                <!-- profession mypage navigation -->
                <nav id="side-nav">
                    <div class="pro-mypage-list" id="pro-info">
                        <div id="img-box">
                            <a href="#page-top">
                                <span class="d-none d-lg-block"><img id="img-user-pic" src="/resources/image/${professionProfile.pPic}" /></span>
                            </a>
                        </div>
                        <div id="user-info">
                            <p id="user-name">${user.uName} 전문가님</p>
                            <p id="user-email">${user.uEmail} </p>
                        </div>
                    </div>
                    <div class="pro-mypage-list" id="pro-profile">
                        <p>나의 정보</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href=#>나의 회원 정보</a></li>
                            <li class="nav-item"><a class="nav-link" href="getProfile.do">나의 전문가 프로필</a></li>
                        </ul>
                    </div>
                    <div class="pro-mypage-list" id="pro-rsv">
                        <p>전문가 예약</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href="getRsvListView.do">예약된 일정 보기</a></li>
                            <li class="nav-item"><a class="nav-link" href="getCompleteView.do">완료된 일정 보기</a></li>
                            <!-- <li class="nav-item"><a class="nav-link" href=#>나를 찜한 회원??</a></li> -->
                        </ul>
                    </div>
                    <div class="pro-mypage-list" id="haeyo-info">
                        <p>해요 안내</p>
                        <ul class="nav-list">
                            <li class="nav-item"><a class="nav-link" href=#>이용 안내 </a></li>
                            <li class="nav-item"><a class="nav-link" href=#>공지 사항</a></li>
                            <li class="nav-item"><a class="nav-link" href=#>질의 응답</a></li>
                        </ul>
                    </div>
                </nav>
                <!-- profession mypage navigation -->

                <!-- profession mypage 1.pro-profile(nav기준)-->
                <section>
                    <div id="page-title">
                        <h2>나의 전문가 프로필</h2>
                    </div>
                    <!--   form start-->
                    <div id="pro-mypage-content">
                        <div id="pro-mypage-profile">
                            <div class="pro-mypage-info">
                                <div id="profile-review-box">
                                    <div id="userpic-wrapper">
                                        <img id="pro-mypage-thumb" src="/resources/image/${professionProfile.pPic}"/>
                                    </div>

                                    <div id="profile-score">
                                        <span id="username">
                                            <h3>${user.uName}</h3>
                                        </span>
                                        <div class="starWrap">
                                            <ul class="star clearfix">
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star"></i></li>
                                                <li><i class="fas fa-star-half-alt"></i></li>
                                            </ul>
                                            <span class="score">3.5</span>
                                        </div>
                                        <ul>
                                            <li>후기 1</li>
                                            <li>찜하기 2</li>
                                        </ul>
                                    </div>
                                    <div class="btn-wrap">
                                        <button class="procheck-btn">상세 보기 <i class="fas fa-arrow-right"></i></button>
                                    </div>

                                </div>
                            </div>
                            <div class="pro-mypage-info">
                                <div class="pro-info-list service-section">
                                    <div class="subsection">
                                        <div class="info-content">
                                            <div class="content1"><span class="subtitle-text">전문 분야</span></div>
                                            <div class="content1"><span class="category-text">${professionProfile.pCategory}</span></div>
                                        </div>
                                        <div class="info-content">
                                            <div class="content1"><span class="subtitle-text">제공 서비스</span></div>
                                            <div class="content1">
                                                   <!--  <span class="category-text subCategory" id="pToilet" value="${subCategory.pToilet}" >화장실 청소</span>-->
                                                   <span class="category-text subCategory" id="pTransportation" value="${subCategory.pTransportation}">용달/화물 운송</span>
                                                  <span class="category-text subCategory" id="pOneroom" value="${subCategory.pOneroom}">소형/원룸 이사</span>
                                                  <!-- <span class="category-text subCategory" id="pKeep" value="${subCategory.pKeep}">짐 보관</span>-->
                                                  
                                            </div>
                                        </div>
                                    </div>
                                    <div class="subsection">
                                        <div class="info-content">
                                            <div class="content1"><span class="subtitle-text">증명서 등록</span></div>
                                            <img class="file-image" src="/resources/image/${professionProfile.certification}">
                                        </div>
                                    </div>
                                </div>

                                <div class="pro-info-list">
                                   <!--  <div class="info-content">
                                        <div class="content1"><span class="subtitle-text">성 별</span></div>
                                        <div class="content1"><span class="category-text">${professionProfile.pGender}</span></div>
                                    </div>-->
                                    <div class="info-content">
                                        <div class="content2"><span class="subtitle-text">한 줄 소개</span></div>
                                        <div class="content2"><span class="content-text">${professionProfile.pIntroduce}</span></div>
                                    </div>
                                    <div class="info-content">
                                        <div class="content2"><span class="subtitle-text">활동 지역</span></div>
                                        <div class="content2"><span class="content-text">${professionProfile.pAddress}</span></div>
                                        <div class="box content2">
                                            <div id="map"></div>
                                            <input type="hidden" id="locx" value="${professionProfile.pLocX}" />
                                            <input type="hidden" id="locy" value="${professionProfile.pLocY}" />
                                        </div>
                                    </div>
                                </div>

                                 <div id="pro-info-btn">
                                    <input type="button" value="수정 하기" class="propage-btn" onclick="location.href='updateProfileView.do'"/>
                                    <input type="button" value="전문가 탈퇴" class="propage-btn" id="openButton"/>
                                </div>
                            </div>
                        </div>
                    </div>
               </section>
            </div>
        </div>
        
         <!--modalStart-->
        <div class="modal hidden">
            <div class="out-modal-overlay"></div>
            <div class="modal-content">
                <h3>전문가 회원을 탈퇴하시겠습니까?</h3>
                <p>${user.uName}님의 전문가 정보만 삭제되며,<br/>일반 회원 계정은 유지됩니다.</p>
                <form action="deleteProfile.do" id="deletePro" method="post">
                    <input type="hidden" name="pNo" value="${professionProfile.pNo}"/>
                </form>
                <button type="reset"class="modal-btn">취 소</button>
                <button type="submit" class="modal-btn" form="deletePro">확 인</button>
            </div>
        </div>
        <!--modalEnd-->

    </wrap>
</body>
</html>