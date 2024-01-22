<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../css/signIn1.css?after" type="text/css" />
    <title> 캐릭터 선택 </title>
</head>
<body>
    <div class="element">
        <div class="div">
            <div class="overlap-group">
            	<img class="key" src="${pageContext.request.contextPath}/resources/img/key2.png" />
                <!-- 이미지를 클릭하여 캐릭터 선택 -->
                <a href="${pageContext.request.contextPath}/user/register/form?character=character1">
                    <img class="img" src="${pageContext.request.contextPath}/resources/img/8388251-1.png" />
                </a>
                <a href="${pageContext.request.contextPath}/user/register/form?character=character2">
                    <img class="img-2" src="${pageContext.request.contextPath}/resources/img/8388431-1.png" />
                </a>
                <a href="${pageContext.request.contextPath}/user/register/form?character=character3">
                    <img class="img-3" src="${pageContext.request.contextPath}/resources/img/8388400-1.png" />
                </a>
                <!-- 각 이미지를 클릭할 때 선택된 캐릭터 정보를 signIn2.jsp로 전달 -->
          		<div class="text-wrapper">사용할 캐릭터를 선택하세요</div>
            	<a href="${pageContext.request.contextPath}/resources/jsp/start.jsp"><img class="logo" src="${pageContext.request.contextPath}/resources/img/logo.png" /></a>
          	</div>
        </div>
    </div>
</body>
</html>
