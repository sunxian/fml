<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<div class="thepage_wraper">
<div class="thepages"> <span class="tongjinum">共${pageBean.totalRecord}条数据</span>
<a href="javascript:onPageTo('${pageBean.pageNo>1 ? pageBean.pageNo-1:1}');" class="back-index">上一页</a>
<c:if test="${pageBean.pageTotal == 1}">
  <a class="cur" href="javascript:onPageTo('1');">1</a>
</c:if>
<c:if test="${pageBean.pageTotal lt 10 and pageBean.pageTotal gt 1}">
 <c:forEach var="i" begin="1" end="${pageBean.pageTotal}">
   <a ${(i==pageBean.pageNo)?"class=\"cur\"":""} href="javascript:onPageTo('${i}');">${i}</a>
 </c:forEach>
</c:if>
<c:if test="${pageBean.pageTotal ge 10}">
<a href="javascript:onPageTo('1');">1</a>
<c:if test="${pageBean.pageNo lt 5 }">
 <c:forEach var="i" begin="2" end="8">
   <a ${(i==pageBean.pageNo)?"class=\"cur\"":""} href="javascript:onPageTo('${i}');">${i}</a>
 </c:forEach>
</c:if> 
<c:if test="${pageBean.pageNo ge 5 }">
 <c:forEach var="i" begin="${pageBean.pageNo-3}" end="${pageBean.pageNo+3<=pageBean.pageTotal?pageBean.pageNo+3:pageBean.pageTotal}">
   <a ${(i==pageBean.pageNo)?"class=\"cur\"":""} href="javascript:onPageTo('${i}');">${i}</a>
 </c:forEach>
</c:if>
<c:if test="${pageBean.pageNo+3 lt pageBean.pageTotal}">
<a href="javascript:onPageTo('${pageBean.pageTotal}');">${pageBean.pageTotal}</a>  
</c:if>
</c:if>
<a href="javascript:onPageTo('${pageBean.pageNo+1>pageBean.pageTotal?pageBean.pageTotal:pageBean.pageNo+1}');" class="next-page">下一页</a> 

<select name="pageSize" class="themount_select" onchange="javascript:onPageSizeTo(this.value);">
  <ui:Option value="10" label="10条/页" curValue="${pageSize}"/>
  <ui:Option value="20" label="20条/页" curValue="${pageSize}"/>
  <ui:Option value="50" label="50条/页" curValue="${pageSize}"/>
  <ui:Option value="100" label="100条/页" curValue="${pageSize}"/>
  <ui:Option value="-1" label="全部" curValue="${pageSize}"/>
</select>
</div></div>