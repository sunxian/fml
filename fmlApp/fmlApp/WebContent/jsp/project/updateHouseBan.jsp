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
<form id="update" method="post" ModelAttribute="houseBan" action="${pageContext.request.contextPath}/project/updateHouseBanToDb;jsessionid=${pageContext.request.session.id}">
  <input name="action" id="action" type="hidden" value="init"/>
  <input name="pageNo" id="pageNo" type="hidden" value="${pageNo}"/>
  <input name="pageSize" id="pageSize" type="hidden" value="${pageSize}"/>
  <input name="chk" id="chk" type="hidden" value="${chk[0]}"/>
<div class="page_inner">
  <jsp:include page="/common/leftMenu.jsp"></jsp:include>
    
   <div class="right_main">
        <div class="common_header border_bottom">
            <div class="actions_btn"></div>
            <h3>修改楼栋</h3>
        </div>
        
        <div>
             <dl class="form_edit">
                <dt style="display: none"><span class="item_title">id</span></dt>
                <dd style="display: none"><input type="text" class="common_input_text" name="id" isrequired="true" autocomplete="off" value="${houseBan.id}"></dd>
                <dt><span class="item_title">楼栋号</span></dt>
                <dd><input type="text" class="common_input_text" name="name" isrequired="true" autocomplete="off" value="${houseBan.name}"></dd>
                <dt><span class="item_title">是否在售</span></dt>
                <dd><input type="text" class="common_input_text" name="isSalingFlag" isrequired="true" autocomplete="off" value="${houseBan.isSalingFlag}"></dd>
                <dt><span class="item_title">开盘时间</span></dt>
                <dd><input type="text" style="width: 225px" class="common_input_text laydate-icon" id="indate1" name="openTime" isrequired="true" autocomplete="off" value="${houseBan.openTime}"></dd>
                <dt><span class="item_title">入住时间</span></dt>
                <dd><input type="text" style="width: 225px" class="common_input_text laydate-icon" id="indate2" name="leadTime" isrequired="true" autocomplete="off" value="${houseBan.leadTime}"></dd>
                <dt><span class="item_title">单元数</span></dt>
                <dd><input type="text" class="common_input_text" name="units" isrequired="true" autocomplete="off" value="${houseBan.units}"></dd>
                <dt><span class="item_title">层数</span></dt>
                <dd><input type="text" class="common_input_text" name="layers" isrequired="true" autocomplete="off" value="${houseBan.layers}"></dd>
                <dt><span class="item_title">在售房源数</span></dt>
                <dd><input type="text" class="common_input_text" name="salingHouses" isrequired="true" autocomplete="off" value="${houseBan.salingHouses}"></dd>
                <dt><span class="item_title">梯户配比</span></dt>
                <dd><input type="text" class="common_input_text" name="houseRatio" isrequired="true" autocomplete="off" value="${houseBan.houseRatio}"></dd>
                <dt></dt>
                <dd>
 <input type="button" onclick="update();" value="确认修改"  class="common_btn btn_large common_btn_add">
            

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
	function update() {
	
			document.getElementById("update").submit();
		
	}
</script>
</body>
</html>