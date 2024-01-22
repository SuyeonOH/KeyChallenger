<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../css/myLikeList.css?after" type="text/css"/>
    <title>내가 좋아요한 목록</title>
</head>
<body>
    <div class="div-wrapper">
        <div class="div">
            <a href="myPage.jsp"><img class="clost-btn" src="${pageContext.request.contextPath}/resources/img/close-btn.png" /></a> 
            <img class="union" src="${pageContext.request.contextPath}/resources/img/union.svg"/>
            <img class="image" src="${pageContext.request.contextPath}/resources/img/profile.png"/>
                             <div class="text-wrapper-6">좋아요한 글 목록</div>
      
      <div class="overlap">            
                <div class="group">   
                    <div class="overlap-group">
                        <img class="img" src="${pageContext.request.contextPath}/resources/img/full_heart.png"/>
                        <img class="image-2" src="${pageContext.request.contextPath}/resources/img/empty_heart.png"/>
                        <div class="text-wrapper">좋아요</div>
                        <p class="element">
                            <span class="span">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                              <img class="line" src="${pageContext.request.contextPath}/resources/img/line-23.svg"/>
                            <span class="text-wrapper-2">활동 2<br /></span>
                        </p>
                        <div class="text-wrapper-3">후기작성 1                        
                        </div>
                        <div class="text-wrapper-4">후기작성 2</div>
                        <p class="p">
                            <span class="span">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                            <span class="text-wrapper-2">활동 1</span>
                        </p>
                        <div class="text-wrapper-5">좋아요</div>
                        <div class="rectangle"></div>
                   </div>                
                    <img class="line" src="${pageContext.request.contextPath}/resources/img/line-23.svg"/>
            </div>                                        
            </div>
            <img class="element-2" src="${pageContext.request.contextPath}/resources/img/8388431-2.png"/>
            <a href="myPage.jsp"><img class="logo" src="${pageContext.request.contextPath}/resources/img/logo.png"/></a>
        </div>
    </div>
</body>
</html>