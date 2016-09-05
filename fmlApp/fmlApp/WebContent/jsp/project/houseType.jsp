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
<form id="frm"  ModelAttribute="building" method="post" action="${pageContext.request.contextPath}/project/list;jsessionid=${pageContext.request.session.id}">
  <input name="action" id="action" type="hidden" value="init"/>
  <input name="pageNo" id="pageNo" type="hidden" value="${pageNo}"/>
  <input name="pageSize" id="pageSize" type="hidden" value="${pageSize}"/>
  <input name="chk" id="chk" type="hidden" value="${chk[0]}"/>
<div class="page_inner">
  <jsp:include page="/common/leftMenu.jsp"></jsp:include>
  +
  <div class="right_main qa_list">
    <div class="common_header">
    <div class="search-bar">
            <form action="">
                <label>所属楼盘查询</label>
                <input class="common_input_text" name="" type="text"/>
                <label>所属楼栋查询</label>
                <input class="common_input_text" name=""  type="text"/>
                <button type="submit" class="common_btn btn_large common_btn_add">查询</button>
            </form>
        </div>
      <div class="actions_btn">
      	<a href="${pageContext.request.contextPath}/project/addHouseType" class="common_btn btn_large common_btn_add" onclick="addProject();">新增</a>
      </div>
      <h3>户型管理</h3>
    </div>
    <div class="table">
    <table cellspacing="0" cellpadding="0" id="con_table">
      <tbody>
       <tr class="con_table_title">

                    <th scope="col" width="50px;">序号</th>
                    <th scope="col" width="100px;">所属楼盘</th>
                    <th scope="col" width="250px;">所属楼栋</th>
                    <th scope="col" width="250px;">户型名称</th>
                    <th scope="col" width="250px;">户型描述</th>
                    <th scope="col" width="250px;">户型图片</th>
                    <th scope="col" width="100px;">客厅数目</th>
                    <th scope="col" width="100px;">卧室数目</th>
                    <th scope="col" width="100px;">卫生间数目</th>
                    <th scope="col" width="100px;">面积</th>
                    <th scope="col" width="100px;">单价</th>
                    <th scope="col" width="100px;">总价</th>                    
                    <th scope="col" width="50px;">是否在售</th>
                      <th scope="col" width="250px;">位置</th>
                    <th scope="col" width="100px;">编辑</th>
                </tr>
        <c:forEach items="${pageBean.list}" var="item" varStatus="st">
        <tr>
          <td width="50px;">${st.index+1}</td>
          <td width="100px;">${item.buildingName}</td>     
           <td width="100px;">${item.houseBanName}</td>      
                    <th width="250px;">${item.name}</th>
                    <th width="250px;">${item.descp}</th>
                    <th width="250px;">${item.imageUrl}</th>
                    <th width="250px;">${item.livingRooms}</th>
                    <th width="250px;">${item.rooms}</th>
                    <th width="250px;">${item.toilets}</th>
                    <th width="250px;">${item.square}</th>
                    <th width="250px;">${item.unitPrice}</th>
                    <th width="250px;">${item.totalPrice}</th>
                     <th width="250px;">${item.isSalingFlag}</th>                 
                    <th width="250px;"></th>
                   
           <td class="theactions">
          <a href="${pageContext.request.contextPath}/project/updateHouseType?id=${item.id}" class="common_btn btn_small common_btn_normal2" >编辑</a>
          <a href="${pageContext.request.contextPath}/project/deleteHouseType?id=${item.id}" class="common_btn btn_small common_btn_notice" >删除</a>
          </td>
        </tr>
        </c:forEach>
       </tbody>
    </table>
    </div>
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