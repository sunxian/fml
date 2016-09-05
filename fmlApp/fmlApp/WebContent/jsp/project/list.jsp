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
<form id="frm" method="post" action="${pageContext.request.contextPath}/project/list;jsessionid=${pageContext.request.session.id}">
  <input name="action" id="action" type="hidden" value="init"/>
  <input name="pageNo" id="pageNo" type="hidden" value="${pageNo}"/>
  <input name="pageSize" id="pageSize" type="hidden" value="${pageSize}"/>
  <input name="chk" id="chk" type="hidden" value="${chk[0]}"/>
<div class="page_inner">
  <jsp:include page="/common/leftMenu.jsp"></jsp:include>
  <div class="right_main qa_list">
    <div class="common_header">
      <div class="actions_btn">
      	<a href="#" class="common_btn btn_large common_btn_add" onclick="addProject();">新增</a>
      </div>
      <h3>项目管理</h3><a href="#" class="qa_filter" data-toggle="modal" data-target="#qa_filter">项目筛选</a>
    </div>
    <table cellspacing="0" cellpadding="0" id="con_table">
      <tbody>
        <tr class="con_table_title">
          <th scope="col" width="50px;">序号</th>
          <th scope="col" width="150px;">项目名称</th>
          <th scope="col" width="100px;">项目类型</th>
          <th scope="col" width="100px;">均价</th>
          <th scope="col" width="250px;">地址</th>
          <th scope="col" >操作</th>
        </tr>
        <c:forEach items="${pageBean.list}" var="item" varStatus="st">
        <tr>
          <td width="50px;">${st.index+1}</td>
          <td width="150px;">${item.name}</td>
          <td width="100px;">${item.type}</td>
          <td width="100px;">${item.averagePrice}</td>
          <td width="250px;">${item.address}</td>
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
<!-- 筛选Modal -->
<div class="modal fade" id="qa_filter" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">关闭</button>
        <h4 class="modal-title" id="myModalLabel">项目筛选</h4>
      </div>
      <form>
      <div class="modal-body">
        <dl class="form_edit">

		<dt><span class="star"></span><span class="item_title">名称：</span></dt>
            <dd><input type="text" class="common_input_text" name="theid" isrequired="true" autocomplete="off"></dd>
            <dt><span class="star"></span><span class="item_title">类型：</span></dt>
            <dd><input type="text" class="common_input_text" name="theid" isrequired="true" autocomplete="off"></dd>
            <dt><span class="star"></span><span class="item_title">部门：</span></dt>
            <dd><input type="text" class="common_input_text" name="theid" isrequired="true" autocomplete="off"></dd>
            <dt><span class="star"></span><span class="item_title">授权项目：</span></dt>
            <dd><input type="text" class="common_input_text" name="theid" isrequired="true" autocomplete="off"></dd>

        </dl>
      </div>
      <div class="modal-footer">
      <a href="#" class="common_btn btn_large common_btn_add">确认筛选</a> <a href="#" class="common_btn btn_large common_btn_normal" data-dismiss="modal">清空条件</a>
      </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">
	function addProject() {
		document.getElementById().action = "";
	}
</script>
</body>
</html>