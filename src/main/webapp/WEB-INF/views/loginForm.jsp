<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<head>


    <style>

        body {
            background-image: url('../../resources/forest.png');
            background-size: cover; /* 전체 바디를 커버하도록 설정 */
            background-repeat: no-repeat; /* 이미지가 반복되지 않도록 설정 */
            background-attachment: fixed; /* 선택사항: 스크롤 시 배경 고정 */
        }

             a { text-decoration: none; }

        form {
            background-color: white;
            width:700px;
            height:500px;
            display : flex;
            flex-direction: column;
            align-items: center;
            position : absolute;
            top:50%;
            left:70%;
            transform: translate(-50%, -50%) ;
            border: 1px solid white;
            border-radius: 25px;
        }
        input[type='text'], input[type='password'] {
            width: 400px;
            height: 45px;
            background-color: white;
            border : 1px solid #868e96;
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 20px;
        }
        button {
            background-color: #3498db;
            color : white;
            width:400px;
            height:45px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }
        .title-container {
            width: 100%; /* 전체 폭 사용 */
            text-align: left; /* 텍스트를 왼쪽으로 정렬 */

        }

        #title {
            /* 기존 스타일 유지 */
            font-size : 40px;
            margin-left : 140px;
            margin-top : 60px;
            margin-bottom : 10px;
            text-align: left; /* 텍스트 왼쪽 정렬 (이미 적용되어 있음) */
        }
        #msg {
            height: 30px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
        }

    </style>
</head>
<body>


<form action="<c:url value="/login"/>" method="post" onsubmit="return formCheck(this);">
    <div class="title-container">
        <h3 id="title">로그인</h3>
    </div>
    <div id="msg">
        <c:if test="${not empty param.msg}">
            <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
        </c:if>
    </div>
    <input type="text" name="id" value="${cookie.id.value}" placeholder="아이디를 입력해주세요" autofocus>
    <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요">
    <input type="hidden" name="toURL" value="${param.toURL}">
    <button>로그인</button>
    <div>
        <label><input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label> |
        <a href="">비밀번호 찾기</a> |
        <a href="">회원가입</a>
    </div>
    <script>
        function formCheck(frm) {

            let msg ='';
            if(frm.id.value.length==0) {
                setMessage('id를 입력해주세요.', frm.id);
                return false;
            }
            if(frm.pwd.value.length==0) {
                setMessage('password를 입력해주세요.', frm.pwd);
                return false;
            }
            return true;
        }
        function setMessage(msg, element){
            document.getElementById("msg").innerHTML = ` ${'${msg}'}`;
            if(element) {
                element.select();
            }
        }
    </script>
</form>

</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>