<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<head>

    <style>
        /* 모달 추가된 스타일 */
        .modal {
            display: flex;
            align-items: center;
            justify-content: center;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        /* 모달 추가된 스타일 */
        .modal-content {
            background-color: #fefefe;
            padding: 20px;
            border: 1px solid #888;
            width: 70%;
            max-width: 500px; /* 최대 너비 설정 */
            text-align: center;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .notice-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #fff; /* 헤더 배경색을 흰색으로 설정 */
            border-bottom: 1px solid #e1e1e1;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05); /* 헤더에 그림자 추가 */
        }

        /* 배너 스타일 */
        .banner {
            height: auto;
            width: 600px;
            background-color: #3498db; /* 배너 배경색 */
            color: #fff; /* 글자색 */
            padding: 15px; /* 패딩 */
            text-align: center; /* 텍스트 가운데 정렬 */
        }
    </style>
</head>

<body>
<div class="notice-header">
    <h2>전체 개요</h2>

</div>

<div id="myModal" class="modal">
    <div class="modal-content">
        <span id="closeModalBtn" class="close">&times;</span>

        <h2>그룹웨어 안내</h2>
        <p>
            안녕하세요, 그룹웨어입니다!<br>

        </p>
        <p>
            자세한 내용은 그룹웨어에서 확인하세요.
        </p>
        <input type="checkbox" id="noShowAgainToday"> 오늘 하루 다시 열지 않음
    </div>

</div>

<section id="overview">

    <h1> Spring + Mysql(USER and Board and Reply)</h1>
    <br>
    <br>


    <h4>
        <p>1. 주요기능 </p>
        &nbsp;&nbsp; 1) 회원관리(로그인 / 로그아웃) - user_info Table <br>
        &nbsp;&nbsp; 2) 직원정보(검색) - employee Table <br>
        &nbsp;&nbsp; 3) 자유게시판(등록, 수정, 삭제, 검색) - board Table<br>
        &nbsp;&nbsp; 4) 댓글(등록, 삭제) - comment Table<br>
        &nbsp;&nbsp; 5) 배너 - banner Table<br>
        <br>
        <p>2. 주요 기술 및 환경</p>
        &nbsp;&nbsp;1) Spring WEB MVC구조 <br>
        &nbsp;&nbsp;2) Spring Data Mybatis <br>
        &nbsp;&nbsp;3) Spring AOP - Session유무 체크 <br>
        &nbsp;&nbsp;&nbsp;&nbsp; : Board(글쓰기)에 대한 접근은 인증된 사용자만 가능<br>
        &nbsp;&nbsp;4) Action Tag include - Layout Template <br>
        &nbsp;&nbsp;5) mysql <br>
        &nbsp;&nbsp;6) 게시판 paging처리 <br>
        &nbsp;&nbsp;7) Ajax로 배너,댓글,직원정보 구현 <br>
        <br>
        <br>
        <br>
        <br>


    </h4>
</section>


<div class="banner">
    <h2 id="bannerText"></h2>
</div>


<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
    $(document).ready(function () {

        // 오늘 날짜 구하기
        var today = new Date().toISOString().split('T')[0];

        // localStorage에서 저장된 날짜 가져오기
        var modalLastShown = localStorage.getItem('modalLastShown');

        // 모달이 오늘 보여져야 하는지 확인
        if (modalLastShown == today) {
            $('#myModal').hide();
        }

        // 모달 닫기 버튼 이벤트
        $('#closeModalBtn').click(function () {
            $('#myModal').hide();

            // '오늘 하루 다시 열지 않음' 체크 시 오늘 날짜를 localStorage에 저장
            if ($('#noShowAgainToday').is(':checked')) {
                localStorage.setItem('modalLastShown', today);
            }
        });


    });

    let bannerIndex = 0;
    let bannerList = [];

    function getBanner(contextPath) {
        let banner = $(".banner");

        //서버와 통신
        $.ajax({
            url: contextPath + "/banners",
            type: "get",
            dataType: "json",
            success: function (result) {

                bannerList = result;

                let bannerText = bannerList[bannerIndex++];
                $("#bannerText").text(bannerText);
                setInterval(function () {
                    let bannerText = bannerList[bannerIndex++];
                    $("#bannerText").text(bannerText);

                    if (bannerIndex == bannerList.length) bannerIndex = 0;


                }, 2500);

            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수


        });

    }// getBannerEnd

    /////////////////////////////////////////


    $(function () {

        //banner가져오기
        getBanner("${pageContext.request.contextPath}");

    });//ready끝
</script>


</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</html>
