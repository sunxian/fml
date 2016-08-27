<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page pageEncoding="UTF-8"%>
<div class="left_menu">
    <ul>
     <li class="cur"><a href="${pageContext.request.contextPath}/project/list">项目管理</a></li>
     <li class=""><a href="${pageContext.request.contextPath}/project/admin">管理员管理</a></li>
       <li class=""><a href="${pageContext.request.contextPath}/project/agentCustomers">经纪人客户</a></li>
       <li class=""><a href="${pageContext.request.contextPath}/project/keyCustomers">关键人客户</a></li>
     <li class=""><a href="${pageContext.request.contextPath}/project/agent">经纪人用户管理</a></li>
     <li class=""><a href="${pageContext.request.contextPath}/project/key">关键人用户管理</a></li>
     <li class=""><a href="${pageContext.request.contextPath}/project/building">楼盘管理</a></li>
     <li class=""><a href="">楼栋管理</a></li>
     <li class=""><a href="${pageContext.request.contextPath}/project/houseType">户型管理</a></li>
     <li class=""><a href="">佣金管理</a></li>
 
    </ul>
  </div>