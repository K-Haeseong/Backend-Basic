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
		<table border="1">
				<tr>
				<td>${notice.id}</td>
				<td colspan="4">${notice.title}</td>
				<td>"${notice.writerId}"</td>
				<td colspan="2">${notice.regDate}</td>
				<td>${notice.hit}</td>
				<td>${notice.content}</td>
			</tr>
		</table>
	</div>
</body>
</html>