<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<table style="width:700px">
        <!-- 댓글 목록 -->
        <c:forEach var="row" items="${list}">
        <tr>    
            <td>
                ${row.userName}(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)
                <br>
                ${row.replytext}
                <br>
                <!-- 본인 댓글만 수정버튼 생성되도록 처리 -->
                <c:if test="${sessionScope.userId == row.replyer}">
                    <input type="button" id="btnModify" value="수정" onclick="showReplyModify('${row.rno}')">
                </c:if>
                <hr>
            </td>
        </tr>
        </c:forEach>
        
        
            <!-- 댓글 수정 영역-->
    <div id="modifyReply"></div>
</body>
</html>