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
<form id="add" method="post" ModelAttribute="building" action="${pageContext.request.contextPath}/project/addBuildingToDb;jsessionid=${pageContext.request.session.id}">
  <input name="action" id="action" type="hidden" value="init"/>
  <input name="pageNo" id="pageNo" type="hidden" value="${pageNo}"/>
  <input name="pageSize" id="pageSize" type="hidden" value="${pageSize}"/>
  <input name="chk" id="chk" type="hidden" value="${chk[0]}"/>
<div class="page_inner">
  <jsp:include page="/common/leftMenu.jsp"></jsp:include>
    
   <div class="right_main">
        <div class="common_header border_bottom">
            <div class="actions_btn"></div>
            <h3>添加楼盘</h3>
        </div>
        <div>
            <dl class="form_edit">
                <dt><span class="item_title">楼盘名称</span></dt>
                <dd><input type="text" class="common_input_text" name="name" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">楼盘类型</span></dt>
                <dd><input type="text" class="common_input_text" name="type" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">均价</span></dt>
                <dd><input type="text" class="common_input_text" name="averagePrice" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">地址</span></dt>
                <dd><input type="text" class="common_input_text" name="address" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">入住时间</span></dt>
                <dd><input type="text" class="common_input_text" name="leadTime" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">物业类型</span></dt>
                <dd><input type="text" class="common_input_text" name="propertyType" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">建筑类型</span></dt>
                <dd><input type="text" class="common_input_text" name="buildingType" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">装修状况</span></dt>
                <dd><input type="text" class="common_input_text" name="renovationStatus" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">住户数</span></dt>
                <dd><input type="text" class="common_input_text" name="households" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">容积率</span></dt>
                <dd><input type="text" class="common_input_text" name="volumeRatio" isrequired="true" autocomplete="off" value=""></dd>
                 <dt><span class="item_title">绿化率</span></dt>
                <dd><input type="text" class="common_input_text" name="greeningRate" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">停车位</span></dt>
                <dd><input type="text" class="common_input_text" name="parkingSpace" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">产权年限</span></dt>
                <dd><input type="text" class="common_input_text" name="periodOfRights" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">开发商名称</span></dt>
                <dd><input type="text" class="common_input_text" name="developersName" isrequired="true" autocomplete="off" value=""></dd>
                  <dt><span class="item_title">开发商说明</span></dt>
                <dd><input type="text" class="common_input_text" name="developersDesc" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">预售许可</span></dt>
                <dd><input type="text" class="common_input_text" name="preSalePermit" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">物业费</span></dt>
                <dd><input type="text" class="common_input_text" name="propertyFee" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">物业公司名称</span></dt>
                <dd><input type="text" class="common_input_text" name="propertyCompany" isrequired="true" autocomplete="off" value=""></dd>
                      <dt><span class="item_title">楼盘描述</span></dt>
                <dd><input type="text" class="common_input_text" name="descp" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">区域id</span></dt>
                <dd><input type="text" class="common_input_text" name="areaId" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">区域行政级别</span></dt>
                <dd><input type="text" class="common_input_text" name="areaLevel" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">经度</span></dt>
                <dd><input type="text" class="common_input_text" name="longitude" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">纬度</span></dt>
                <dd><input type="text" class="common_input_text" name="latitude" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">地图放大级别</span></dt>
                <dd><input type="text" class="common_input_text" name="zoom" isrequired="true" autocomplete="off" value=""></dd>
                <dt></dt>
                <dd>
 <input type="button" onclick="addAdmin();" value="添加">
                    <a href="brand_list.tml" class="common_btn btn_large common_btn_add" title="">
                        确认提交

                    </a>

                    <a href="brand_list.tml" class="common_btn btn_large common_btn_normal" title="">
                        取消

                    </a>

                </dd>
            </dl>
            <div class="clear"></div>
        </div>
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
  
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script type="text/javascript">
	function addProject() {
		document.getElementById().action = "";
	}
	function addAdmin() {
	
			document.getElementById("add").submit();
		
	}
</script>
</body>
</html>