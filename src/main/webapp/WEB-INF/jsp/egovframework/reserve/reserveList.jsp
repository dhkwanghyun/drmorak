<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>DR.morak 관리자</title>
    
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
        $('#table td a').each(function() {
            var length = 15;
            $(this).each(function() {
                if ($(this).text().length >= length) {
                   $(this).text($(this).text().substr(0, length) + '...');
                }
            })
        })
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
    <script>
        /**
         * Created by Kupletsky Sergey on 05.11.14.
         *
         * Material Design Responsive Table
         * Tested on Win8.1 with browsers: Chrome 37, Firefox 32, Opera 25, IE 11, Safari 5.1.7
         * You can use this table in Bootstrap (v3) projects. Material Design Responsive Table CSS-style will override basic bootstrap style.
         * JS used only for table constructor: you don't need it in your project
         */

        $(document).ready(function() {

            var table = $('#table');

            // Table bordered
            $('#table-bordered').change(function() {
                var value = $(this).val();
                table.removeClass('table-bordered').addClass(value);
            });

            // Table striped
            $('#table-striped').change(function() {
                var value = $(this).val();
                table.removeClass('table-striped').addClass(value);
            });

            // Table hover
            $('#table-hover').change(function() {
                var value = $(this).val();
                table.removeClass('table-hover').addClass(value);
            });

            // Table color
            $('#table-color').change(function() {
                var value = $(this).val();
                table.removeClass(/^table-mc-/).addClass(value);
            });
        });

        (function(removeClass) {

            jQuery.fn.removeClass = function(value) {
                if (value && typeof value.test === "function") {
                    for (var i = 0, l = this.length; i < l; i++) {
                        var elem = this[i];
                        if (elem.nodeType === 1 && elem.className) {
                            var classNames = elem.className.split(/\s+/);

                            for (var n = classNames.length; n--;) {
                                if (value.test(classNames[n])) {
                                    classNames.splice(n, 1);
                                }
                            }
                            elem.className = jQuery.trim(classNames.join(" "));
                        }
                    }
                } else {
                    removeClass.call(this, value);
                }
                return this;
            }

        })(jQuery.fn.removeClass);
    </script>
    
    <script>
    $(document).ready(function(){
	    $("#srchType").change(function(){
	    	$("#srchForm").attr("action", "/reserveList.do");
	    	$("#srchForm").submit();
	    });
		$("#srchBranch").change(function(){
			$("#srchForm").attr("action", "/reserveList.do");
			$("#srchForm").submit();
	    });
		$("#srchInputText").keydown(function(key) {
			if (key.keyCode == 13) {
				$("#srchForm").attr("action", "/reserveList.do");
				$("#srchForm").submit();
			}
		});
    });
    </script>
    
    
</head>

<body class="login-page">
    <div class="container">
        <div id="admin">
            <h2>예약내역</h2>
            <form id="srchForm" name="srchForm">
            <div class="search-bar bar01 col-xs-2">
                <select id="srchType" name="srchType" class="form-control">
                    <option value="reserve_branch">지점</option>
                    <option value="reserve_date_day">날짜</option>
                    <option value="reserve_name">이름</option>
                    <option value="reserve_phone">연락처</option>
                    <option value="reserve_content">내용</option>
                </select>
            </div>
            <div class="search-bar col-xs-8">
                <input type="text" id="srchInputText" name="srchInputText" class="search-area form-control" />
            </div>

            <div class="filter-area">
                <div class="filter-box col-xs-2">
                    <select id="srchBranch" name="srchBranch" class="form-control">
                        <c:forEach var="item" items="${branchList}">
                        	<option value="${item.branchCode}" <c:if test="${item.branchCode == morakVO.srchBranch}">selected</c:if>>${item.branchName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="filter-box col-xs-2">
                    <select id="" name="" class="form-control">
                        <option>10개씩보기</option>
                        <option>20개씩보기</option>
                        <option>30개씩보기</option>
                        <option>40개씩보기</option>
                        <option>50개씩보기</option>
                    </select>
                </div>
            </div>
            </form>
            <!-- Responsive table starts here -->
            <!-- For correct display on small screens you must add 'data-title' to each 'td' in your table -->
            <div class="table-responsive-vertical shadow-z-1" style="margin-top: 10px;">
                <!-- Table starts here -->
                <table id="table" class="table table-hover table-mc-light-blue table-bordered">
                    <thead>
                        <tr>
                            <th>지점</th>
                            <th>날짜</th>
                            <th>이름</th>
                            <th>연락처</th>
                            <th>쿠폰</th>
                            <th>내용</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${morakList}" varStatus="status">	
                        <tr>
                            <td data-title="지점">${item.reserveBranch}</td>
                            <td data-title="날짜">${item.reserveDateDay}</td>
                            <td data-title="이름">${item.reserveName}</td>
                            <td data-title="연락처">${item.reservePhone}</td>
                            <td data-title="쿠폰">${item.reserveCoupon}</td>
                            <td data-title="내용"><a data-toggle="modal" href="#normalModal">${item.reserveContent}</a></td>
                        </tr>
                    </c:forEach>    
                    </tbody>
                </table>
            </div>
            <!-- <div class="pagination-area">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true"><i class="fa fa-chevron-left" aria-hidden="true"></i></span>
                        </a>
                    </li>
                    <li class="active"><a href="#">01</a></li>
                    <li><a href="#">02</a></li>
                    <li><a href="#">03</a></li>
                    <li><a href="#">04</a></li>
                    <li><a href="#">05</a></li>
                    <li><a href="#">06</a></li>
                    <li><a href="#">07</a></li>
                    <li><a href="#">08</a></li>
                    <li><a href="#">09</a></li>
                    <li><a href="#">10</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true"><i class="fa fa-chevron-right" aria-hidden="true"></i></span>
                        </a>
                    </li>
                </ul>
            </div> -->
        </div>
        <div class="btn-wrap">
            <button type="button" class="exl-btn">엑셀다운로드</button>
        </div>
    </div>
    <div id="normalModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title">내용보기</h3>
                </div>
                <div class="modal-body">
                    <p>냉영여ㅕ여여여여영ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    
    <%@ include file="/WEB-INF/jsp/egovframework/cmmn/include/include-footer.jspf" %>
    
</body>
</html>
