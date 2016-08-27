<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="header_styel1">
  <div class="inner"> 
    <div class="tools"> 
        <div class="user_logininfo">
            <p>你好，${sessionScope.admin.userName}&nbsp;&nbsp;&nbsp;当前版本：v2.4</p>
        </div>
    </div>
    <a href="Project.do" class="logo">FBS</a>
  </div>
</div>