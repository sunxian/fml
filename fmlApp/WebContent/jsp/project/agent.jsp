<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="/common/header.jsp"/>
	<jsp:include page="/common/commons.jsp"/>
</head>
<body>
<jsp:include page="/common/menu.jsp"></jsp:include>
<form id="frm" method="post" action="${pageContext.request.contextPath}/project/agent;jsessionid=${pageContext.request.session.id}">
  <input name="action" id="action" type="hidden" value="init"/>
  <input name="pageNo" id="pageNo" type="hidden" value="${pageNo}"/>
  <input name="pageSize" id="pageSize" type="hidden" value="${pageSize}"/>
  <input name="chk" id="chk" type="hidden" value="${chk[0]}"/>
<div class="page_inner">
  <jsp:include page="/common/leftMenu.jsp"></jsp:include>
  <div class="right_main qa_list">
    <div class="common_header">
      <div class="actions_btn">
      	<a href="${pageContext.request.contextPath}/project/adminEdit" class="common_btn btn_large common_btn_add" onclick="addProject();">新增</a>
      </div>
      <h3>经济人管理</h3>
    </div>
    <table cellspacing="0" cellpadding="0" id="con_table">
      <tbody>
          <tr class="con_table_title">
          <th scope="col" width="50px;">序号</th>
                <th scope="col" width="100px;">用户姓名</th>
                <th scope="col" width="100px;">性别</th>
                <th scope="col" width="200px;">用户帐号</th>
                <th scope="col" width="300px;">所属机构</th>
                <th scope="col">操作</th>

            </tr>
     <c:forEach items="${pageBean.list}" var="item" varStatus="st">
        <tr style="background-color: rgb(255, 255, 255);"> 
          <td width="50px;">${st.index+1}</td>
          <td width="150px;">${item.userName}</td>
          <td width="150px;">${item.sex}</td>
          <td width="100px;">${item.phoneNo}</td>
          <td width="100px;">${item.agencyName}</td>
          <td class="theactions">
          <a href="" class="common_btn btn_small common_btn_normal2" >编辑</a>
          <a href="" class="common_btn btn_small common_btn_notice" >删除</a>
          </td>
        </tr>
        </c:forEach>
       </tbody>
    </table>
    <jsp:include page="/common/pageable.jsp"></jsp:include>
  </div>
  <div class="clear"></div>
</div>
</form>
<jsp:include page="/common/footer.jsp"></jsp:include>

<script type="text/javascript">
	function addProject() {
		document.getElementById().action = "";
	}
</script>
</body>
</html>