<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.mainbody { margin:0; }
	.slideshow {
		background:#fff; height:365px; min-width:960px; 
		overflow:hidden; position:relative;
	}
	.slideshow-slides { width:100%; height:100%; position:absolute; }
	.slideshow-slides .slide {
		width:100%; height:100%; position:absolute; overflow:hidden;
	}
	.slideshow-slides .slide img { left:50%; margin-left:-800px; position:absolute; }

	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="/woodaProject/src/main/webapp/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script>
	$(document).ready(function() {
		$(".slideshow").each(function() {
			var $container = $(this), 
				// .slideshow 객체를 $container 에 저장
				$slideGroup = $container.find(".slideshow-slides"), 
				// 슬라이드쇼에 사용될 이미지들을 감싸는 .slideshow-slides 객체를 저장
				$slides = $slideGroup.find(".slide"), 
				// 슬라이드 이미지들을 의미하는 .slide 객체
				$nav = $container.find(".slideshow-nav"), 
				// 다음, 이전 버튼을 의미하는 .slideshow-nav 객체
				$indicator = $container.find(".slideshow-indicator"), 
				// 슬라이드 이미지의 바로가기 버튼들을 의미하는 객체
				slideCount = $slides.length, 
				// 슬라이드 이미지들의 개수로 $slides의 길이
				indicatorHTML = "", 
				// 바로가기 버튼들에 들어갈 HTML 소스를 저장할 변수
				currentIndex = 0, 
				// 현재 보이는 슬라이드 이미지의 인덱스 번호로 기본값으로 0을 저장
				duration = 500, 
				// 슬라이드 애니메이션 소요시간
				easing = "easeInOutExpo", 
				// 애니메이션의 종류(동작되는 방식이나 형태를 의미)
				interval = 2500, 
				// 자동으로 슬라이드가 넘어갈 때 까지의 시간
				timer;
				// 타이머 객체로 아직 생성되지 않은 상태

			$slides.each(function(i) {
			// $slides배열의 길이 만큼 루프를 돌면서 작업(i는 인덱스 번호)
				$(this).css({ left:100 * i + "%" });
				// 인덱스 번호를 이용하여 이미지를 롤링 시킴
				indicatorHTML += "<a href='#'>" + (i + 1) + "</a>";
				// 바로가기 버튼에 사용할 링크를 생성
			});
			$indicator.html(indicatorHTML);
			// 바로가기 버튼의 링크를 $indicator에 삽입

			function goToSlide(idx) {
			// 받아 온 idx를 인덱스로 하는 특정 슬라이드 이미지를 보여주는 함수
				$slideGroup.animate({ left:-100 * idx + "%" }, duration, easing);
				// idx값을 이용하여 특정 슬라이드가 보이게 애니메이션 효과를 줌
				currentIndex = idx;
				// 현재 보이는 인덱스 값을 idx로 변환
				updateNav();
				// 현재 보이는 슬라이드에 따른 탐색 버튼의 변경을 위한 함수 호출
			}

			function startTimer() {
			// 타이머를 시작하는 함수
				timer = setInterval(function() {
					var nextIndex = (currentIndex + 1) % slideCount;
					// 다음에 보여줄 슬라이드 인덱스 번호
					// 마지막 슬라이드인 경우 첫번째 슬라이드 번호(0)를 구함
					goToSlide(nextIndex);
					// 다음 슬라이드 번호를 가지고 goToSlide() 함수 호출
				}, interval);
				// interval의 시간만큼 대기하다가 작업
			}

			function stopTimer() {
			// 타이머를 중지시키는 함수 : 슬라이드 이미지에 마우스를 올리면 슬라이드 쇼가 멈춤
				clearInterval(timer);
				// timer에 지정된 Interval을 제거
			}

			$nav.on("click", "a", function(evt) {
			// $nav영역의 이전 또는 다음 버튼 클릭시 동작
				evt.preventDefault();
				// 발생한 이벤트의 원래 설정되어 있는 동작을 제거함
				// 여기서는 'a'태그의 원래 기능(링크기능)을 제거하는 역할

				if ($(this).hasClass("prev"))
				// 이벤트를 일으킨 객체에 'prev'라는 클래스가 있으면(이전 슬라이드 버튼 클릭시)
					goToSlide(currentIndex - 1);	// 이전 슬라이드로 이동
				else
				// 이벤트를 일으킨 객체에 'prev'라는 클래스가 없으면(다음 슬라이드 버튼 클릭시)
					goToSlide(currentIndex + 1);	// 다음 슬라이드로 이동
			});

			$indicator.on("click", "a", function(evt) {
			// $indicator영역의 슬라이드 버튼을 클릭시 동작
				evt.preventDefault();
				// 발생한 이벤트의 원래 설정되어 있는 동작을 제거함
				// 여기서는 'a'태그의 원래 기능(링크기능)을 제거하는 역할

				if (!$(this).hasClass("active"))
				// 이벤트를 일으킨 객체에 'active'클래스가 없으면(현재 보이는 슬라이드가 아니면면)
					goToSlide($(this).index());
					// 이벤트를 일으킨 객체의 번호(인덱스 번호)를 가지고 goToSlide() 함수 호출
			});

			$container.on({ mouseenter:stopTimer, mouseleave:startTimer });
			// $container영역에 마우스를 올리면 타이머를 멈추고(stopTimer), 내리면 타이머 시작(startTimer)

			goToSlide(currentIndex);
			// 페이지가 열리면 currentIndex에 해당하는 슬라이드 이미지를 보여줌

			startTimer();
			// 타이머를 시작시킴(정해진 시간에 따라 슬라이드를 움직임)
		});
	});
	</script>
</head>
<body class="mainbody">
<div class="slideshow">
	<div class="slideshow-slides">
		<a href="#" class="slide" id="slide-1"><img src="img/mainimg1.png" width="1600" height="365" /></a>
		<a href="#" class="slide" id="slide-2"><img src="img/mainimg2.png" width="1600" height="365" /></a>
		<a href="#" class="slide" id="slide-3"><img src="img/mainimg3.png" width="1600" height="365" /></a>
		<a href="#" class="slide" id="slide-4"><img src="img/mainimg4.png" width="1600" height="365" /></a>
		<a href="#" class="slide" id="slide-5"><img src="img/mainimg5.png" width="1600" height="365" /></a>
		<a href="#" class="slide" id="slide-6"><img src="img/mainimg6.png" width="1600" height="365" /></a>
	</div>
</div>
</body>
</html>