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
<form id="update" method="post" ModelAttribute="houseType" action="${pageContext.request.contextPath}/project/updateHouseTypeToDb;jsessionid=${pageContext.request.session.id}">
  <input name="action" id="action" type="hidden" value="init"/>
  <input name="pageNo" id="pageNo" type="hidden" value="${pageNo}"/>
  <input name="pageSize" id="pageSize" type="hidden" value="${pageSize}"/>
  <input name="chk" id="chk" type="hidden" value="${chk[0]}"/>
<div class="page_inner">
  <jsp:include page="/common/leftMenu.jsp"></jsp:include>
    
   <div class="right_main">
        <div class="common_header border_bottom">
            <div class="actions_btn"></div>
            <h3>添加户型</h3>
        </div>
        <div class="form_edit" style="overflow-x: auto">
           
            <div>

                <table class="">

                    <thead>
                    <tr><th style="display:none;">楼盘id</th>
                    <th style="display:none;">id</th>
                        <th>户型名称</th>
                        <th>户型图片</th>
                        <th>客厅数目</th>
                        <th>卧室数目</th>
                        <th>卫生间数</th>
                        <th>面积</th>
                        <th>单价</th>
                        <th>总价</th>
                        <th>是否在售</th>
                        <th  width="200px">描述</th>
                        
                    </tr>
                    </thead>
                    <tbody id="detail">
                        <tr class="demo">
                         <td style="display:none;"><input  type="text" name="buildingId" class="form-control"  value="${houseType.buildingId}"placeholder=""></td>
                            <td style="display:none;"><input type="text" name="id" value="${houseType.id}"class="form-control"  value=""placeholder=""></td>
                            <td><input type="text" name="name" value="${houseType.name}" class="form-control" placeholder=""></td>
                            <td>
                                <div class="upload_widget">
                                <div class="thepic ">
                                    <img src="../images/pic_default_project.png" />
                                  
                                </div>
                                </div>
                            </td>                           
                            <td><input type="text" name="livingRooms" value="${houseType.livingRooms}"  class="form-control" placeholder=""></td>
                            <td><input type="text" name="bedrooms" value="${houseType.bedrooms}" class="form-control" placeholder=""></td>
                            <td><input type="text" name="toilets" value="${houseType.toilets}" class="form-control" placeholder=""></td>
                            <td><input type="text" name="square" value="${houseType.square}" class="form-control" placeholder=""></td>
                            <td><input type="text" name="unitPrice" value="${houseType.unitPrice}" class="form-control" placeholder=""></td>
                            <td><input type="text" name="totalPrice"  value="${houseType.totalPrice}" class="form-control" placeholder=""></td>
                            <td><input type="text" name="isSalingFlag"  value="${houseType.isSalingFlag}" class="form-control"></td>
                            <td><textarea class="form-control" name="descp" rows="3" >${houseType.descp}</textarea></td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>

            <dl>
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