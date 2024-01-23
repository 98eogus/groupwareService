<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>



<!DOCTYPE html>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<head>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>


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

        .notice-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
            max-height: 600px; /* 최대 높이를 설정하세요 */
            overflow-y: auto; /* 내용이 컨테이너를 벗어날 경우 스크롤을 활성화합니다 */
        }

        .notice-card {
            background: #fff; /* 카드 배경색을 흰색으로 설정 */
            border: 1px solid #dee2e6; /* 카드 테두리 색상 변경 */
            border-radius: 4px; /* 카드 모서리 둥글게 설정 */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 카드에 그림자 추가 */
            transition: box-shadow 0.3s ease-in-out;
            cursor: pointer;
            height: 160px;
        }

        .notice-card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 강조 */
        }

        .notice-content {

            height: 5em; /* 내용 높이 설정 */
        }

        .notice-title {
            font-size: 1.2rem; /* 폰트 크기를 상대적인 값으로 지정 */
            font-weight: bold;
            margin-bottom: 0.1rem; /* 제목 아래 여백 설정 */
            color: #343a40; /* 제목 색상 변경 */
            height: 2em; /* 제목 높이 설정 */
            overflow: hidden; /* 내용이 넘치면 숨김 */
        }

        .notice-date {
            font-size: 0.875rem; /* 폰트 크기를 상대적인 값으로 지정 */
            color: #868e96; /* 날짜 색상 변경 */
            margin-bottom: 1rem; /* 날짜 아래 여백 설정 */
        }

        .notice-count {
            font-size: 1rem;
            color: #343a40; /* 건수 색상 변경 */
        }

        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .modal-content {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            text-align: center;
            border-radius: 4px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
        }

        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            cursor: pointer;
        }
    </style>


</head>
<body>

<div id="modal" class="modal">
    <div class="modal-content">
        <span class="close" id="modalClose">&times;</span>
        <img id="noticeImage" src="" alt="공지사항 이미지">
    </div>
</div>

<div class="notice-header">
    <h2>이벤트 및 소식</h2>
    <div class="notice-count">${eventCount}건</div>
</div>

<div class="notice-container" id="noticeContainer">
    <!-- 공지사항 카드를 동적으로 추가할 컨테이너 -->
    <c:forEach var="eventDto" items="${eventList}">
        <div class="notice-card">
            <div class="notice-content">
                <div class="notice-title">${eventDto.title}</div>
                <div class="notice-content">${eventDto.content}</div>
                <div class="notice-date">  ${eventDto.event_date}</div>
            </div>
        </div>
    </c:forEach>
</div>

<!-- 여기에 스크립트를 추가 -->

<script>
    $(document).ready(function() {

        // 공지사항 카드를 클릭하면 모달 열기
        $('.notice-card').click(function() {
            $('#modal').css('display', 'block'); // 모달 열기
        });

        // 모달 닫기 버튼 클릭 이벤트 핸들러
        $('#modalClose').click(function() {
            $('#modal').css('display', 'none'); // 모달 닫기
        });
    });
</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>
