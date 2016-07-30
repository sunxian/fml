<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- money:<br/>${contentModel.money}<br/>
    date:<br/>${contentModel.date}<br/> --%>
    money:<br>
    <spring:eval expression="contentModel.money"></spring:eval><br>
    date:<br>
    <spring:eval expression="contentModel.date"></spring:eval><br>
</body>
</html>