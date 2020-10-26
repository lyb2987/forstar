<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>For Star</title>
<link rel="stylesheet" type="text/css" href="../css/Main.css" />
<link rel="stylesheet" type="text/css" href="../css/Popup.css" />
<script type="text/javascript" 
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" ></script>
<script type="text/javascript">
$(function(){

    layer_popup("#layer2");

});
function layer_popup(el){

    var $el = $(el);        //레이어의 id를 $el 변수에 저장
    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

    var $elWidth = ~~($el.outerWidth()),
        $elHeight = ~~($el.outerHeight()),
        docWidth = $(document).width(),
        docHeight = $(document).height();

    // 화면의 중앙에 레이어를 띄운다.
    if ($elHeight < docHeight || $elWidth < docWidth) {
        $el.css({
            marginTop: -$elHeight /2,
            marginLeft: -$elWidth/2
        })
    } else {
        $el.css({top: 0, left: 0});
    }

    $el.find('a.btn-layerClose').click(function(){
        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
        return false;
    });

    $('.layer .dimBg').click(function(){
        $('.dim-layer').fadeOut();
        return false;
    });

}
</script>
</head>
<body class="mainBody">
<%@ include file="../Frame/Header.jsp" %>
<div class="contain">
	<!-- 메인 비쥬얼 / 예약하기-->
	<div class="mainVisual">
		<ul class="slides">
			<li class="first" style="width:100%; float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 2;">
				<a href="javascript:void(0);" target="_blank">
					<img class="mainImg" style="width: 100%; height: 100%;" src="../images/Main/mainImage1.jpg" alt="Urban Refresh" draggable="false">
				</a>
				<a href="javascript:void(0);" target="_blank">
					<img class="mainImg" style="width: 100%; height: 100%;" src="../images/Main/mainImage2.jpg" alt="Urban Refresh" draggable="false">
				</a>
			</li>
		</ul>
		<div id="mainVisualControl" class="mainControl">
			<ul class="flex-direction-nav">
				<li class="flex-nav-prev"><a class="flex-prev" onclick="plusDivs(-1);">이전</a></li>
				<li class="flex-nav-next"><a class="flex-next" onclick="plusDivs(1);">다음</a></li>
			</ul>
		</div>
	</div>
	
	<!-- // 메인 비쥬얼 / 예약하기-->
	<!-- mainContent -->
</div>
<a href="#layer2" class="btn-example"></a>
<div class="dim-layer">
    <div class="dimBg"></div>
    <div id="layer2" class="pop-layer">
        <div class="pop-container">
            <div class="pop-conts">
                <!--content //-->
                <p class="ctxt mb20">디지털 컨버전스 JAVA개발자 양성D반<br>
                    - 임예빈,강지석,이동희,정선동,오인환 -<br>
                    파이널 프로젝트 호텔 웹 서비스 페이지를 소개합니다.<br><br>
                    모두 취업합시다. ㅠ.ㅠ
                </p>

                <div class="btn-r">
                    <a href="#" class="btn-layerClose">닫기</a>
                </div>
                <!--// content-->
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
var myIndex = 0;
carousel();

var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
    showDivs(slideIndex += n);
}

function carousel () {
    var i;
    var x = document.getElementsByClassName("mainImg");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 3000); 
}
 		
    function showDivs(n) {
        var i;
        var x = document.getElementsByClassName("mainImg");
        if (n > x.length) {slideIndex = 1}
        if (n < 1) {slideIndex = x.length} ;
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        x[slideIndex-1].style.display = "block";
    }
    
</script>
<%@ include file="../Frame/Footer.jsp" %>
</body>
</html>