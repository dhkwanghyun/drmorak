<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="utf8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/WEB-INF/jsp/egovframework/cmmn/include/include-header.jspf" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf8" />
    <title>DR.morak 예약</title>
    <script>
        // 부트스트랩 datetimepicker 셋팅과 두개씩 링크
        // minDate : 오늘 이후의 날짜값만 셋팅될 수 있도록
        $(document).ready(function() {
            $('.dateTimePicker').datetimepicker({
                format: "YYYY-MM-DD",
                minDate: moment()
            });

            $('#datetimepicker3').datetimepicker({
                format: 'LT'
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            $("#hamburger").click(function() {
                $("#hamburger").toggleClass('active');
                $("#sidebar").toggleClass('show-sidebar');
            });
        });
    </script>
    <script>
        $(function() {
          $('#hamburger').click( function() {
            if( $(this).html() == '상담신청 닫기' ) {
              $(this).html('<img src="/resource/img/nav-icon.png" alt="상담신청" class="toggle-icon">상담신청');
              $(this).addClass('open-btn');
              $("#menu-icon").addClass('open-btn-wrap');
            }
            else {
              $(this).html('상담신청 닫기');
                $(this).removeClass('open-btn');
                $("#menu-icon").removeClass('open-btn-wrap');
            }
          });
        });
    </script>
	
	<script>
		$(document).ready(function(){
			$("#reserveBtn").click(function(){
				if(reserveValCheck()){
					reserveSave();
				}
			});
		})
		
		function reserveValCheck(){
			if($("#reserveBranch").val()==""){
				alert("지점을 선택하세요.");
				return false;
			}
			if($("#reserveDateDay").val()==""){
				alert("날짜을 선택하세요.");
				return false;
			}
			if($("#reserveName").val()==""){
				alert("이름을 입력하세요.");
				return false;
			}
			if($("#reservePhone").val()==""){
				alert("연락처를 입력하세요.");
				return false;
			}
			
			return true;
		}
	
	
		function reserveSave(){
			var sendData = $('#dataForm').serialize();
			
			$.ajax({
				type: "POST",
				url : "/main/reserveInsert.ajax",
				data: sendData,
				async: true,
				success : function(data, status, xhr) {
					console.log(data);
					if(data.code=='Y'){
						alert("예약을 완료했습니다.");
					}else{
						alert("예약을 실패했습니다.");
					}
				},
				error: function(jqXHR, textStatus, errorThrown) {
					//alert(jqXHR.responseText);
				}
			});
		}
	</script>
    
</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <div id="status">
            <div class="preloader" aria-busy="true" aria-label="Loading, please wait." role="progressbar">
            </div>
        </div>
    </div>
    <div class="home-btn-wrap">
        <a href="http://drmorak.com/" target="_blank"><img src="/resource/img/home_icon.png" alt="홈페이지바로가기" />홈페이지바로가기</a>
    </div>
    <!-- ./Preloader -->
    <div id="menu-icon" class="active">
        <div id="hamburger" class="active">상담신청 닫기</div>
    </div>
    <form action="post" class="clearfix" id="dataForm" name="dataForm">
    <div id="sidebar" class="show-sidebar">
        <nav>
            <div class="reserv-rcp-form">
                <h3>상담문의</h3>
                <div class="form-group">
                    <div class="rcp-tit"><label for="">지점선택</label></div>
                    <div class="rcp-ipt">
                        <select class="form-control" id="reserveBranch" name="reserveBranch">
                            <option value="">지점선택</option>
                            <c:forEach var="item" items="${branchList}">
                        	<option value="${item.branchCode}" >${item.branchName}</option>
                        	</c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group date-group">
                    <div class="rcp-tit"><label for="">날짜선택</label></div>
                    <div class='input-group date dateTimePicker' id="datepicker1">
                        <input type='text' class="form-control" id="reserveDateDay" name="reserveDateDay" required="required" />
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
<!--
                        <div class='input-group date date-time-ipt' id='datetimepicker3'>
                            <input type='text' class="form-control" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-time"></span>
                            </span>
                        </div>
-->
                </div>

                <div class="form-group">
                    <div class="rcp-tit"><label for="">이름</label></div>
                    <div class="rcp-ipt"><input type="text" class="form-control" id="reserveName" name="reserveName" /></div>
                </div>
                <div class="form-group">
                    <div class="rcp-tit"><label for="">연락처</label></div>
                    <div class="rcp-ipt"><input type="text" class="form-control" id="reservePhone" name="reservePhone"  /></div>
                </div>
                <div class="form-group">
                    <div class="rcp-tit"><label for="">쿠폰선택</label></div>
                    <div class="rcp-ipt">
                        <div class="radio radio-ipt">
                            <input id="radio-1" name="reserveCoupon" type="radio" checked value="CP0001">
                            <label for="radio-1" class="radio-label">두피진단무료권</label>
                        </div>
                        <div class="radio radio-ipt">
                            <input id="radio-2" name="reserveCoupon" type="radio" value="CP0002">
                            <label for="radio-2" class="radio-label">전품목 50%</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="rcp-tit"><label for="">증상</label></div>
                    <div class="rcp-ipt"><textarea type="text" class="form-control" id="reserveContent" name="reserveContent"></textarea></div>
                </div>
                <div class="rcp-btn-wrap">
                    <button type="button" id="reserveBtn" class="rcp-btn">예약하기</button>
                </div>
            </div>
        </nav>
    </div>
    </form>
    <!-- header -->
    <header class="navbar-fixed-top">
        <nav>
            <ul>
                <li><a href="#about">About</a></li>
                <li><a href="#experience">experience</a></li>
                <li><a href="#projects">projects</a></li>
                <li><a href="#contact">contact</a></li>
            </ul>
        </nav>
    </header>
    <!-- ./header -->

    <!-- home -->
    <div class="section" id="home" data-stellar-background-ratio="0.5">
        <div class="container fs-sect">
            <div class="fs-sect-area">
                <img src="/resource/img/top_logo.png" alt="닥터모락로고" class="main-logo" data-aos="flip-left" data-aos-easing="ease-out-cubic" data-aos-duration="2000" />
                <div class="fs-text-box" data-aos="zoom-in" data-aos-duration="2000">
                    <h2>당신의 <span>두피상태</span>는 어떤가요?</h2>
                    <p>탈모관리의 정답은 건강한 두피라는 사실!</p>
                </div>
                <p class="sc-text-box">
                    <span data-aos="fade-up" data-aos-duration="800">탈모의 원인은 다양하기 때문에 정확한 진단과 관리가 필요합니다.</span><br />
                    <span data-aos="fade-up" data-aos-duration="900">국내 최초 백금콜로이드 특허기술과 1:1 맞춤관리까지 한번에!</span><br />
                    <span data-aos="fade-up" data-aos-duration="1000">고객님의 소중한 시간을 지켜드립니다.</span>
                </p>
                <ul class="coupon-list">
                    <li><img src="/resource/img/coupon_01.png" alt="쿠폰이미지" /></li>
                    <li><img src="/resource/img/coupon_02.png" alt="쿠폰이미지" /></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- ./home -->

    <!-- about -->
    <div class="section" id="about">
        <div class="container sc-sect">
            <div class="col-md-7" data-aos="fade-up">
                <!--<h4>01</h4>-->
                <h2 class="sc-tit">두피탈모 관리는
                    <br /><span>선택이 아닌, 필수</span>입니다.
                </h2>

                <ul class="sc-list nav nav-tabs">
                    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#scTab01">남성 탈모</a></li>
                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#scTab02">여성 탈모</a></li>
                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#scTab03">문제성 두피</a></li>
                </ul>
                <div class="tab-content" data-aos="fade-up" data-aos-delay=".5">
                    <div class="tab-pane fade in active" id="scTab01">
                        <!-- portfolio_container -->
                        <div class="no-padding clearfix">
                            <!-- single work -->
                            <div class="col-md-6 col-sm-6 col-xs-6 cen-sc-box">
                                <img src="/resource/img/sctab-img01.png" alt="남성 탈모" class="img-responsive bottom-banner" />
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6 cen-sc-box02">
                                <img src="/resource/img/sctab-img02.png" alt="남성 탈모" class="img-responsive bottom-banner" />
                            </div>
                            <!-- end single work -->
                        </div>
                        <!-- end portfolio_container -->
                    </div>
                    <div class="tab-pane fade" id="scTab02">
                        <!-- portfolio_container -->
                        <div class="no-padding clearfix">
                            <!-- single work -->
                            <div class="col-md-6 col-sm-6 col-xs-6 cen-sc-box">
                                <img src="/resource/img/sctab-img03.png" alt="여성 탈모" class="img-responsive bottom-banner" />
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6 cen-sc-box02">
                                <img src="/resource/img/sctab-img04.png" alt="여성 탈모" class="img-responsive bottom-banner" />
                            </div>
                            <!-- end single work -->
                        </div>
                        <!-- end portfolio_container -->
                    </div>
                    <div class="tab-pane fade" id="scTab03">
                        <!-- portfolio_container -->
                        <div class="no-padding clearfix">
                            <!-- single work -->
                            <div class="col-md-6 col-sm-6 col-xs-6 cen-sc-box">
                                <img src="/resource/img/sctab-img05.png" alt="문제성 두피" class="img-responsive bottom-banner" />
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6 cen-sc-box02">
                                <img src="/resource/img/sctab-img06.png" alt="문제성 두피" class="img-responsive bottom-banner" />
                            </div>
                            <!-- end single work -->
                        </div>
                        <!-- end portfolio_container -->
                    </div>

                </div>
                <!--
                <div class="h-50"></div> <img src="/resource/img/Signature.svg" width="230" alt="" />
                <div class="h-50"></div>
                -->
            </div>
            <div class="col-md-5 about-img-div">
                <div class="about-border" data-aos="fade-up" data-aos-delay=".5"></div>
                <img src="/resource/img/middle_img.jpg" width="400" class="img-responsive" alt="" align="right" data-aos="fade-right" data-aos-delay="0" />
            </div>
        </div>
    </div>
    <!-- ./about -->

    <!-- projects -->
    <div class="section" id="projects">
        <div class="container trd-sect">

            <div class="trd-tit-box" data-aos="fade-up">
                <h2 class="trd-tit"><span>닥터모락</span>만의 개인별 맞춤 치료!</h2>
                <p class="trd-sub-text">프리미엄 맞춤 프로그램, 1:1 개별 서비스</p>
            </div>
            <!-- main container -->
            <div class="main-container portfolio-inner clearfix">
                <h3 class="trd-pf-tit">Dr.Morak Program</h3>
                <!-- portfolio div -->
                <div class="portfolio-div">
                    <div class="portfolio">

                        <!-- portfolio_filter -->
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#qwe">QWE</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#asd">ASD</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#zxc">ZXC</a>
                            </li>
                        </ul>
                        <div class="tab-content" data-aos="fade-up" data-aos-delay=".5">
                            <div class="tab-pane fade in active" id="qwe">
                                <!-- portfolio_container -->
                                <div class="no-padding clearfix">
                                    <!-- single work -->
                                    <div class="col-md-4 col-sm-4 col-xs-6 fashion logo">
                                        <a id="demo01" href="#animatedModal" class="portfolio_item">
                                            <img src="/resource/img/bottom_ban01.png" alt="두피 리프팅 케어 이미지" class="img-responsive bottom-banner" />
                                            <div class="portfolio_item_hover">
                                                <div class="portfolio-border clearfix">
                                                    <div class="item_info"> <span>두피 리프팅 케어</span> <em>설명보기</em> </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- end single work -->
                                    <!-- single work -->
                                    <div class="col-md-4 col-sm-4 col-xs-6 ads graphics">
                                        <a id="demo02" href="#animatedModal" class="portfolio_item">
                                            <img src="/resource/img/bottom_ban02.png" alt="탈모 안티에이징(항산화) 케어" class="img-responsive bottom-banner" />
                                            <div class="portfolio_item_hover">
                                                <div class="portfolio-border clearfix">
                                                    <div class="item_info"> <span>탈모 안티에이징(항산화) 케어</span> <em>설명보기</em> </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- end single work -->
                                    <!-- single work -->
                                    <div class="col-md-4 col-sm-4 col-xs-6 photography">
                                        <a id="demo03" href="#animatedModal" class="portfolio_item">
                                            <img src="/resource/img/bottom_ban03.png" alt="모발 컨디셔닝 케어" class="img-responsive bottom-banner" />
                                            <div class="portfolio_item_hover">
                                                <div class="portfolio-border clearfix">
                                                    <div class="item_info"> <span>모발 컨디셔닝 케어</span> <em>설명보기</em> </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- end single work -->
                                </div>
                                <!-- end portfolio_container -->
                            </div>
                            <div class="tab-pane fade" id="asd">
                                <!-- portfolio_container -->
                                <div class="no-padding clearfix">
                                    <!-- single work -->
                                    <div class="col-md-4 col-sm-6 fashion logo">
                                        <a id="demo01" href="#animatedModal" class="portfolio_item">
                                            <img src="/resource/img/bottom_ban01.png" alt="두피 리프팅 케어 이미지" class="img-responsive bottom-banner" />
                                            <div class="portfolio_item_hover">
                                                <div class="portfolio-border clearfix">
                                                    <div class="item_info"> <span>Mockups in seconds</span> <em>Fashion / Logo</em> </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- end single work -->
                                    <!-- single work -->
                                    <div class="col-md-4 col-sm-6 ads graphics">
                                        <a id="demo02" href="#animatedModal" class="portfolio_item">
                                            <img src="/resource/img/bottom_ban02.png" alt="탈모 안티에이징(항산화) 케어" class="img-responsive bottom-banner" />
                                            <div class="portfolio_item_hover">
                                                <div class="portfolio-border clearfix">
                                                    <div class="item_info"> <span>Floating mockups</span> <em>Ads / Graphics</em> </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- end single work -->
                                    <!-- single work -->
                                    <div class="col-md-4 col-sm-6 photography">
                                        <a id="demo03" href="#animatedModal" class="portfolio_item">
                                            <img src="/resource/img/bottom_ban03.png" alt="모발 컨디셔닝 케어" class="img-responsive bottom-banner" />
                                            <div class="portfolio_item_hover">
                                                <div class="portfolio-border clearfix">
                                                    <div class="item_info"> <span>Photorealistic smartwatch</span> <em>Photography</em> </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- end single work -->
                                </div>
                                <!-- end portfolio_container -->
                            </div>
                            <div class="tab-pane fade" id="zxc">
                                <!-- portfolio_container -->
                                <div class="no-padding clearfix">
                                    <!-- single work -->
                                    <div class="col-md-4 col-sm-6">
                                        <a id="demo01" href="#animatedModal" class="portfolio_item">
                                            <img src="/resource/img/bottom_ban01.png" alt="두피 리프팅 케어 이미지" class="img-responsive bottom-banner" />
                                            <div class="portfolio_item_hover">
                                                <div class="portfolio-border clearfix">
                                                    <div class="item_info"> <span>Mockups in seconds</span> <em>Fashion / Logo</em> </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- end single work -->
                                    <!-- single work -->
                                    <div class="col-md-4 col-sm-6">
                                        <a id="demo02" href="#animatedModal" class="portfolio_item">
                                            <img src="/resource/img/bottom_ban02.png" alt="탈모 안티에이징(항산화) 케어" class="img-responsive bottom-banner" />
                                            <div class="portfolio_item_hover">
                                                <div class="portfolio-border clearfix">
                                                    <div class="item_info"> <span>Floating mockups</span> <em>Ads / Graphics</em> </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- end single work -->
                                    <!-- single work -->
                                    <div class="col-md-4 col-sm-6">
                                        <a id="demo03" href="#animatedModal" class="portfolio_item">
                                            <img src="/resource/img/bottom_ban03.png" alt="모발 컨디셔닝 케어" class="img-responsive bottom-banner" />
                                            <div class="portfolio_item_hover">
                                                <div class="portfolio-border clearfix">
                                                    <div class="item_info"> <span>Photorealistic smartwatch</span> <em>Photography</em> </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- end single work -->
                                </div>
                                <!-- end portfolio_container -->
                            </div>
                        </div>
                    </div>
                    <!-- portfolio -->
                </div>
                <!-- end portfolio div -->
            </div>
            <!-- end main container -->
        </div>
    </div>
    <!-- ./projects -->



    <!--DEMO01-->
    <div id="animatedModal" class="popup-modal">
        <!--THIS IS IMPORTANT! to close the modal, the class name has to match the name given on the ID -->
        <div id="btn-close-modal" class="close-animatedModal close-popup-modal"> <i class="ion-close-round"></i> </div>
        <div class="clearfix"></div>
        <div class="modal-content">
            <div class="container">
                <div class="portfolio-padding">
                    <div class="col-md-8 col-md-offset-2">
                        <h2>프로그램명</h2>
                        <div class="h-50"></div>
                        <p>Appropriately maintain standards compliant total linkage with cutting-edge action items. Enthusiastically create seamless synergy rather than excellent value. Quickly promote premium strategic theme areas vis-a-vis.</p>
                        <p>Appropriately maintain standards compliant total linkage with cutting-edge action items. Enthusiastically create seamless synergy rather than excellent value.</p>
                        <br />
                        <br /> <img src="/resource/img/portfolio/02.jpg" alt="" class="img-responsive" />
                        <br />
                        <br />
                        <p>Appropriately maintain standards compliant total linkage with cutting-edge action items. Enthusiastically create seamless synergy rather than excellent value. Quickly promote premium strategic theme areas vis-a-vis.</p>
                        <p>Appropriately maintain standards compliant total linkage with cutting-edge action items. Enthusiastically create seamless synergy rather than excellent value.</p>
                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="/WEB-INF/jsp/egovframework/cmmn/include/include-footer.jspf" %>
    
</body>
</html>
