<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div>
		<h1>게시판</h1>
		<table border="1">	
			<tr>
				<td>번호</td>
				<td colspan="4">제목</td>
				<td>작성자</td>
				<td colspan="2">작성일</td>
				<td>조회수</td>
				<td>버튼</td>
			</tr>
			
			<c:forEach var="n" items="${list}">
			<tr>
				<td>${n.id}</td>
				<td colspan="4"><a href="/board/detail?id=${n.id}">${n.title}</a></td>
				<td>${n.writerId}</td>
				<td colspan="2">${n.regDate}</td>
				<td>${n.hit}</td>
				<td>
				<input type="button" value="수정">
				<input type="button" value="삭제">
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>