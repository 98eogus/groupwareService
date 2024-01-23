<%@ page language="java" contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<head>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Moment.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

    <!-- FullCalendar -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.9.1/fullcalendar.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.9.1/fullcalendar.min.css" rel="stylesheet"/>
</head>

    <style>

        #calendar {
            height: 550px;
            margin-bottom: 20px;
            background-color: white; /* 캘린더 배경색을 흰색으로 설정 */
            padding: 10px; /* 캘린더 주변에 여백 추가 */

        }

        .fc-day-header {
            background-color: #2980b9; /* 월화수목금토일의 배경색을 파란색으로 설정 */
            color: white; /* 글자색을 흰색으로 설정 */
        }
        .fc-day-header.fc-sun {

            background-color: red; /* 일요일의 배경색을 빨강색으로 설정 */
            color: white; /* 글자색을 흰색으로 설정 */
        }

        .fc-header, .fc-content, .fc-day, .fc-time {
            background-color: white; /* 캘린더 내부 헤더, 내용, 날짜, 시간 부분의 배경색도 흰색으로 설정 */
        }

        .fc-header-title {
            color: black; /* 캘린더 헤더 타이틀 색상 변경 */
        }

        /* 캘린더 너비 조정을 위한 추가 스타일 */
        .fc {
            width: 40%; /* 캘린더 전체 너비를 4%로 설정 (이 값은 조정 가능) */
            margin: 0 auto; /* 캘린더를 가운데 정렬 */
        }
        .fc-event {
            background-color: palevioletred; /* 배경색 설정 */
            border: 1px  #2980b9; /* 테두리 스타일 설정 */
            color: #3498db; /* 글자색 설정 */
            padding: 5px; /* 내부 여백 설정 */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
            border-radius: 5px; /* 둥근 모서리 설정 */
            cursor: pointer; /* 마우스 커서를 포인터로 변경 */
            transition: background-color 0.3s ease; /* 배경색 전환 애니메이션 */
        }

        .fc-event:hover {
            background-color: #2980b9; /* 마우스를 올려놓았을 때 배경색 변경 */
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
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
    </style>

</head>


<body>
<div class="notice-header">
    <h2>교육 및 훈련</h2>

</div>

<div id="calendar"></div> <!-- 캘린더를 표시할 div -->

<!-- 모달 창 -->
<div id="modal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>일정 추가</h2>
        <!-- 일정 추가 폼 -->
        <form id="eventForm">
            <input type="date" id="eventDate" name="eventDate" required>
            <input type="text" id="eventTitle" name="eventTitle" placeholder="일정 제목" required>
            <textarea id="eventDescription" name="eventDescription" placeholder="일정 설명"></textarea>
            <button type="submit">저장</button>
        </form>
    </div>
</div>


<script>
    var modalOpen = false; // 모달 창이 열려있는지 여부를 저장하는 변수

    $(document).ready(function () {
        // FullCalendar 초기화 및 설정
        $('#calendar').fullCalendar({
            // 다른 옵션들...
            contentHeight: 'auto', // 높이를 자동 조절하도록 설정
            dayClick: function (date, jsEvent, view) {
                if (!modalOpen) { // 모달 창이 열려있지 않을 때만 열기
                    $('#modal').show();
                    modalOpen = true; // 모달 창이 열렸음을 표시
                }
            },
            eventClick: function (calEvent, jsEvent, view) {
                if (!modalOpen) { // 모달 창이 열려있지 않을 때만 열기
                    $('#modal').show();
                    modalOpen = true; // 모달 창이 열렸음을 표시
                }
            }
        });

        // 모달 닫기 버튼 이벤트 핸들러
        $('.close').on('click', function () {
            $('#modal').hide();
            modalOpen = false; // 모달 창이 닫혔음을 표시
        });

        // 폼 제출 이벤트 핸들러
        $('#eventForm').submit(function (e) {
            e.preventDefault();
            // 여기에 일정 추가 로직 구현

            // FullCalendar에 일정 추가
            $('#calendar').fullCalendar('renderEvent', {
                title: $('#eventTitle').val(),
                start: $('#eventDate').val(),
                description: $('#eventDescription').val(),
            }, true); // true는 이벤트를 렌더링하고 화면을 다시 그리도록 설정합니다.

            $('#modal').hide();
            modalOpen = false; // 모달 창이 닫혔음을 표시
        });
    });
</script>

</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>
