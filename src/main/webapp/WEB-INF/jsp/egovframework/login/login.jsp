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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<%@ include file="/WEB-INF/jsp/egovframework/cmmn/include/include-header.jspf" %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>DR.morak 로그인</title>
    
    
    <script>
	    $(document).ready(function(){
			$("#loginBtn").click(function(){
				if(loginValCheck()){
					loginAjax();
				}
			});
		})
		
		function loginValCheck(){
			if($("#loginId").val()==""){
				alert("아이디를 입력하세요");
				return false;
			}
			if($("#loginPw").val()==""){
				alert("비밀번호를 입력하세요");
				return false;
			}
			
			return true;
		}
		
		function loginAjax(){
			var sendData = $('#loginForm').serialize();
			
			$.ajax({
				type: "POST",
				url : "/login/login.ajax",
				data: sendData,
				async: true,
				success : function(data, status, xhr) {
					console.log(data.code);
					if(data.code=='Y'){
						location.href="/reserveList.do";
					}else{
						alert("아이디와 비밀번호가 다릅니다.");
					}

				},
				error: function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.responseText);
				}
			});
		}
    </script>
</head>

<body class="login-page">
    <div class="container">
        <div class="col-md-6 col-md-offset-3 col-xs-12">
            <!-- @ Start login box wrapper -->
            <div class="blmd-wrapp">
                <div class="blmd-color-conatiner ripple-effect-All"></div>

                <div class="blmd-continer">
                    <!-- @ Login form container -->
                    <form action="post" class="clearfix" id="loginForm" name="loginForm">
                        <h1>관리자로그인</h1>
                        <div class="col-md-12">

                            <div class="input-group blmd-form">
                                <div class="blmd-line">
                                    <input type="text" name="loginId" id="loginId" class="form-control">
                                    <label class="blmd-label">관리자 아이디</label>
                                </div>
                            </div>
                            <div class="input-group blmd-form">
                                <div class="blmd-line">
                                    <input type="password" name="loginPw" id="loginPw" class="form-control">
                                    <label class="blmd-label">비밀번호</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 text-center">
                            <button type="button" id="loginBtn" class="btn btn-blmd ripple-effect btn-success btn-lg btn-block">로그인</button>
                        </div>
                        <br />
                    </form>
                    <!-- @ Login form container -->
                    <form action="post" class="clearfix form-hidden" id="Register-form">
                        <h1>Register Page</h1>
                        <div class="col-md-12">

                            <div class="input-group blmd-form">
                                <div class="blmd-line">
                                    <input type="text" name="username" autocomplete="off" id="username" class="form-control">
                                    <label class="blmd-label">Email or Username</label>
                                </div>
                            </div>
                            <div class="input-group blmd-form">
                                <div class="blmd-line">
                                    <input type="password" name="password" autocomplete="off" id="password" class="form-control">
                                    <label class="blmd-label">Password</label>
                                </div>
                            </div>
                            <div class="input-group blmd-form">
                                <div class="blmd-line">
                                    <input type="password" name="rePassword" autocomplete="off" id="password" class="form-control">
                                    <label class="blmd-label">Repeat Password</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 text-center">
                            <button type="button" class="btn btn-blmd ripple-effect btn-warning btn-lg btn-block">Register</button>
                        </div>
                        <br />
                    </form>
                </div>
            </div>

        </div>
    </div>
    
    <%@ include file="/WEB-INF/jsp/egovframework/cmmn/include/include-footer.jspf" %>
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
            $("#menu-icon").click(function() {
                $("#hamburger").toggleClass('active');
                $("#sidebar").toggleClass('show-sidebar');
            });
        });
    </script>
    <script>
        (function($) {
            // Ripple-effect-All animation
            function fullRipper(color, time) {
                setTimeout(function() {
                    var rippler = $(".ripple-effect-All");
                    if (rippler.find(".ink-All").length == 0) {
                        rippler.append("<span class='ink-All'></span>");


                        var ink = rippler.find(".ink-All");
                        // prevent quick double clicks
                        //ink.removeClass("animate");

                        // set .ink diametr
                        if (!ink.height() && !ink.width()) {
                            var d = Math.max(rippler.outerWidth(), rippler.outerHeight());
                            ink.css({
                                height: d,
                                width: d
                            });
                        }

                        // get click coordinates
                        var x = 0;
                        var y = rippler.offset().top - ink.height() / 1.5;

                        // set .ink position and add class .animate
                        ink.css({
                            top: y + 'px',
                            left: x + 'px',
                            background: color
                        }).addClass("animate");

                        rippler.css('z-index', 2);

                        setTimeout(function() {
                            ink.css({
                                '-webkit-transform': 'scale(2.5)',
                                '-moz-transform': 'scale(2.5)',
                                '-ms-transform': 'scale(2.5)',
                                '-o-transform': 'scale(2.5)',
                                'transform': 'scale(2.5)'
                            })
                            rippler.css('z-index', 0);
                        }, 1500);
                    }
                }, time)

            }

            // Form control border-bottom line
            $('.blmd-line .form-control').bind('focus', function() {
                $(this).parent('.blmd-line').addClass('blmd-toggled').removeClass("hf");
            }).bind('blur', function() {
                var val = $(this).val();
                if (val) {
                    $(this).parent('.blmd-line').addClass("hf");
                } else {
                    $(this).parent('.blmd-line').removeClass('blmd-toggled');
                }
            })


        })(jQuery);
    </script>
</body>
</html>
