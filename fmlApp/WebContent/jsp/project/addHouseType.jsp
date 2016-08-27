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
<form id="add" method="post" ModelAttribute="building" action="${pageContext.request.contextPath}/project/addHouseType;jsessionid=${pageContext.request.session.id}">
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
        <div>
            <dl class="form_edit">
                <dt><span class="item_title">创建时间</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">更新时间</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">删除标识</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">所属楼盘</span></dt>
                <dd>
                    <div class="dropdown">
                        <button type="button" class="btn dropdown-toggle" id=""
                                data-toggle="dropdown">
                            所属楼盘
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation">
                                <a role="menuitem" tabindex="-1" href="#">楼盘1</a>
                            </li>
                            <li role="presentation">
                                <a role="menuitem" tabindex="-1" href="#">楼盘2</a>
                            </li>
                            <li role="presentation">
                                <a role="menuitem" tabindex="-1" href="#">楼盘1</a>
                            </li>
                            <li role="presentation">
                                <a role="menuitem" tabindex="-1" href="#">楼盘2</a>
                            </li>
                        </ul>
                    </div>
                </dd>
                <dt><span class="item_title">所属楼栋</span></dt>
                <dd>
                    <div class="dropdown">
                        <button type="button" class="btn dropdown-toggle" id=""
                                data-toggle="dropdown">
                            所属楼栋
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                            <li role="presentation">
                                <a role="menuitem" tabindex="-1" href="#">楼栋1</a>
                            </li>
                            <li role="presentation">
                                <a role="menuitem" tabindex="-1" href="#">楼栋2</a>
                            </li>
                        </ul>
                    </div>
                </dd>
                <dt><span class="item_title">户型名称</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">户型描述</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">户型图片</span></dt>
                <dd>
                    <div class="upload_widget">
                        <div class="thepic ">
                            <!--  <img src="../images/pic_default_project.png" />
                            <a href="#" class="btn_upload">选择图片</a>-->
                            <input id="file" name="image-upload" type="file" size="20" >
                            <button id="btnSubmit" type="button">上传文件</button>
                            <img alt="image preview " src="../images/pic_default_project.png" id="image-thumb"/>
                        </div>
                    </div>
                </dd>

                <dt><span class="item_title">客厅数目</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">卧室数目</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">卫生间数目</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">面积</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">单位</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">位置</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">总价</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">是否主力户型</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>
                <dt><span class="item_title">是否在售</span></dt>
                <dd><input type="text" class="common_input_text" name="" isrequired="true" autocomplete="off" value=""></dd>

                <dt></dt>
                <dd>
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
	
			document.getElementById("add").submit()
	}
	

</script>
</body>
</html>