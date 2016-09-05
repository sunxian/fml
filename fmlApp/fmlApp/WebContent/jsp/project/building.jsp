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
  <div class="right_main qa_list">
    <div class="common_header">
    <div class="search-bar">
            <form action="${pageContext.request.contextPath}/project/building">
                <label>楼盘查询</label>
                <input class="common_input_text" name="name" type="text"/>
                <label>机构查询</label>
                <input class="common_input_text" type="text"/>
                <button type="submit" class="common_btn btn_large common_btn_add">查询</button>
            </form>
        </div>
      <div class="actions_btn">
      	<a href="${pageContext.request.contextPath}/project/addBuilding" class="common_btn btn_large common_btn_add" onclick="addProject();">新增</a>
      </div>
      <h3>楼盘管理</h3>
    </div>
    <div class="table">
    <table cellspacing="0" cellpadding="0" id="con_table">
      <tbody>
       <tr class="con_table_title">

                    <th scope="col" width="50px;">序号</th>
                    <th scope="col" width="150px;">楼盘名称</th>
                    <th scope="col" width="100px;">楼盘类型</th>
                    <th scope="col" width="100px;">均价</th>
                    <th scope="col" width="250px;">地址</th>
                    <th scope="col" width="250px;">入住时间</th>
                    <th scope="col" width="250px;">物业类型</th>
                    <th scope="col" width="250px;"> 建筑类型</th>
                    <th scope="col" width="250px;">装修状况</th>
                    <th scope="col" width="250px;">住户数</th>
                    <th scope="col" width="250px;">绿化率</th>
                    <th scope="col" width="250px;">容积率</th>
                    <th scope="col" width="250px;">停车位</th>
                    <th scope="col" width="250px;">产权年限</th>
                    <th scope="col" width="250px;">开发商名称</th>
                    <th scope="col" width="250px;">开发商说明</th>
                    <th scope="col" width="250px;">物业费</th>
                    <th scope="col" width="250px;">物业公司名称</th>
                    <th scope="col" width="250px;">楼盘描述</th>
                    <th scope="col" width="250px;">预售许可</th>
                    <th scope="col" width="250px;">区域id</th>
                    <th scope="col" width="250px;">区域行政级别</th>
                    <th scope="col" width="250px;">经度</th>
                    <th scope="col" width="250px;">纬度</th>
                    <th scope="col" width="250px;">地图放大级别</th>
                    <th scope="col" width="100px:">操作</th>
                </tr>
        <c:forEach items="${pageBean.list}" var="item" varStatus="st">
        <tr>
          <td width="50px;">${st.index+1}</td>
          <td width="150px;">${item.name}</td>
          <td width="100px;">${item.type}</td>
          <td width="100px;">${item.averagePrice}</td>     
           <td width="100px;">${item.address}</td>      
                    <th width="250px;">${item.leadTime}</th>
                    <th width="250px;">${item.propertyType}</th>
                    <th width="250px;">${item.buildingType}</th>
                    <th width="250px;">${item.renovationStatus}</th>
                    <th width="250px;">${item.households}</th>
                    <th width="250px;">${item.greeningRate}</th>
                    <th width="250px;">${item.volumeRatio}</th>
                    <th width="250px;">${item.parkingSpace}</th>
                    <th width="250px;">${item.periodOfRights}</th>
                    <th width="250px;">${item.developersName}</th>
                    <th width="250px;">${item.developersDesc}</th>
                     <th width="250px;">${item.propertyFee}</th>                 
                    <th width="250px;">${item.propertyCompany}</th>
                    <th width="250px;">${item.descp}</th>
                     <th width="250px;">${item.preSalePermit}</th>
                    <th width="250px;">${item.areaId}</th>
                    <th width="250px;">${item.areaLevel}</th>
                    <th width="250px;">${item.longitude}</th>
                    <th width="250px;">${item.latitude}</th>
                    <th width="250px;">${item.zoom}</th>
           <td class="theactions">
            <a href="${pageContext.request.contextPath}/project/addHouseBan?id=${item.id}" class="common_btn btn_small common_btn_normal2" >添加楼栋</a>
          <a href="${pageContext.request.contextPath}/project/updateBuilding?id=${item.id}" class="common_btn btn_small common_btn_normal2" >编辑</a>
          <a href="${pageContext.request.contextPath}/project/deleteBuilding?id=${item.id}" class="common_btn btn_small common_btn_notice" >删除</a>
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