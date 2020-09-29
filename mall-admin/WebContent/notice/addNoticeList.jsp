<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지사항 추가</h1> 
	<form method="post" action="/mall-admin/notice/addNoticeListAction.jsp">
		
		<table>	<!-- noticeDate는 now사용 -->
			<thead>
				<tr>
					<td>notice_title</td>
					<td><input type="text" name="noticeTitle"></td>
				</tr>
				<tr>
					<td>notice_content</td>
					<td><input type="text" name="noticeContent"></td>
				</tr>
			</thead>
		</table>
		<button type="submit">추가하기</button>
	</form>
</body>
</html>