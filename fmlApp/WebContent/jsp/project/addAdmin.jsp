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
<form id="add" method="post" ModelAttribute="admin"  action="${pageContext.request.contextPath}/project/addAdminToDB;jsessionid=${pageContext.request.session.id}">
  <input name="action" id="action" type="hidden" value="init"/>
  <input name="pageNo" id="pageNo" type="hidden" value="${pageNo}"/>
  <input name="pageSize" id="pageSize" type="hidden" value="${pageSize}"/>
  <input name="chk" id="chk" type="hidden" value="${chk[0]}"/>
<div class="page_inner">
  <jsp:include page="/common/leftMenu.jsp"></jsp:include>
    
   <div class="right_main">
    <div class="common_header border_bottom">

      <div class="actions_btn"></div>
      <h3>添加管理员</h3>
    </div><div>
    <dl class="form_edit">
        <dt><span class="star">*</span><span class="item_title">管理员姓名</span></dt>
        <dd><input type="text" class="common_input_text" id="name" name="userName" isrequired="true" autocomplete="off" ></dd>
        <dt><span class="star">*</span><span class="item_title">密码</span></dt>
        <dd><input type="password" class="common_input_text" id="pass" name="password" isrequired="true" autocomplete="off" ></dd>
        <dt>&nbsp;</dt>
        <dd>
         <input type="button" onclick="addAdmin();" value="添加">
      <!--  <a href="${pageContext.request.contextPath}/project/addAdminToDB" class="common_btn btn_large common_btn_add" title="">添加</a>
      <a href="user_list.html" class="common_btn btn_large common_btn_normal" title="">取消</a>-->
        </dd>
      </dl>
  <div class="clear"></div>
</div></div>
</div>

</form>
<jsp:include page="/common/footer.jsp"></jsp:include>
<!-- 筛选Modal -->
<div class="modal fade" id="qa_filter" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">关闭</button>
        <h4 class="modal-title" id="myModalLabel">项目筛选</h4>
      </div>
  
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">
	function addProject() {
		document.getElementById().action = "";
	}
	function addAdmin() {
		var name = $("#name").val();
		var pass = $("#pass").val();
		if (name != "" && pass != "") {
			document.getElementById("add").submit();
		}
	}
</script>
</body>
</html>