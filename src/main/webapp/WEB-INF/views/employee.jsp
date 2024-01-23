<%@ page language="java" contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<head>

    <style>

        #employeeSearch {
            width: 300px; /* 원하는 너비 설정 */
            height: 25px;
            margin-left: 1280px; /* 가운데 정렬을 위해 왼쪽 마진을 auto로 설정 */
            margin-right: 0; /* 오른쪽 마진을 0으로 설정하여 오른쪽으로 이동 */
        }


        body {
            font-family: Arial, sans-serif;
        }

        .employee-container {
            width: 80%;
            margin: 0 auto;
            text-align: center;
        }

        .employee-table {
            width: 100%;
            border-collapse: collapse;
        }

        .employee-table, .employee-table th, .employee-table td {
            border: 1px solid black;
        }

        .employee-table th, .employee-table td {
            padding: 8px;
            text-align: left;
        }

        thead {
            background-color: #f2f2f2;
        }

        /* 기존 스타일 유지 및 아래 스타일 추가 */

        .employee-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white; /* 테이블 배경색을 흰색으로 설정 */
        }

        .employee-table th {
            background-color: #687BA6; /* 첫 번째 행 배경색을 파란색으로 설정 */
            color: white; /* 첫 번째 행 글자색을 흰색으로 설정 */
        }

        .employee-table td,
        .employee-table th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .employee-photo {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 50%;
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



        .scrollable-table {
            max-height: 600px; /* 원하는 높이 설정 */
            overflow-y: auto; /* 세로 스크롤만 표시 */
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
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            text-align: center;
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

<!-- 모달 -->
<div id="employeeModal" class="modal">
    <div class="modal-content">
        <span class="close" id="modalClose">&times;</span>
        <img id="employeePhoto" src="" alt="직원 사진">
    </div>
</div>

<div class="notice-header">
    <h2>직원 정보</h2>

</div>
<div class="employee-container">


    <input type="text" id="employeeSearch" placeholder="직원 검색..." onkeyup="searchEmployees()">



    <div class="scrollable-table">
    <table class="employee-table">
        <thead>
        <tr>

            <th>이름</th>
            <th>직위</th>
            <th>부서</th>
            <th>이메일</th>
            <th>전화번호</th>
        </tr>
        </thead>
        <tbody id="employeeTableBody">
        <!-- 직원 정보를 여기에 채워 넣습니다 -->

        <!-- 추가 직원 정보 -->
        </tbody>
    </table>
    </div>
</div>


<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
    var contextPath = '<%= request.getContextPath() %>';

    $(document).ready(function() {
        showEmployee(); // 페이지 로드 시 showEmployee 함수 호출
    });

    function showEmployee() {
        $.ajax({
            url: contextPath + "/employee/list",
            type: 'GET',
            dataType: 'json',
            success: function(result) {
                var tableBody = $('#employeeTableBody');
                tableBody.empty();

                result.forEach(function(employee) {
                    tableBody.append(
                        '<tr>' +
                        '<td>' + employee.name + '</td>' +
                        '<td>' + employee.position + '</td>' +
                        '<td>' + employee.department + '</td>' +
                        '<td>' + employee.email + '</td>' +
                        '<td>' + employee.phoneNumber + '</td>' +
                        '</tr>'
                    );
                });
            },
            error: function() {
                console.error('직원 목록 요청 실패');
            }
        });
    }

    function searchEmployees() {
        var searchInput = $('#employeeSearch').val();

        if (searchInput.trim() === "") {
            showEmployee();
            return;
        }

        $.ajax({
            url: contextPath + "/employee/search",
            type: 'GET',
            dataType: 'json',
            data: { name: searchInput },
            success: function(result) {

                var tableBody = $('#employeeTableBody');
                tableBody.empty();

                result.forEach(function(employee) {
                    tableBody.append(
                        '<tr>' +
                        '<td>' + employee.name + '</td>' +
                        '<td>' + employee.position + '</td>' +
                        '<td>' + employee.department + '</td>' +
                        '<td>' + employee.email + '</td>' +
                        '<td>' + employee.phoneNumber + '</td>' +
                        '</tr>'
                    );
                });
            },
            error: function() {
                console.error('검색 요청 실패');
            }
        });
    }


</script>




</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>
