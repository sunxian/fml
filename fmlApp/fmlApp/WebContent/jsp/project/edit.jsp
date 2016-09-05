<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><jsp:include page="/common/header.jsp"/><jsp:include page="/common/commons.jsp"/></head>
<body>
<jsp:include page="/common/menu.jsp"></jsp:include>

<input type="hidden" name="bean.id" value="${bean.id}" />
<div class="page_inner">
  <jsp:include page="/common/leftMenu.jsp"></jsp:include>
  <div class="right_main">
    <div class="common_header border_bottom">
      <div class="actions_btn"></div>
      <h3>公司信息</h3>
    </div>
    <ui:Form>
      <dl class="form_edit">
        <dt><span class="item_title">公司代码</span></dt>
        <dd><input type="text" class="common_input_text" maxlength="5" name="bean.code" isrequired="true" autocomplete="off" value="${bean.code}" /></dd>
      
      <dt><span class="star">*</span><span class="item_title">英文名称</span></dt>
        <dd><input type="text" class="common_input_text" id="name" maxlength="30" name="bean.name" isrequired="true" autocomplete="off" value="${bean.name}" /></dd>
        <dt><span class="star">*</span><span class="item_title">中文名称</span></dt>
        <dd><input type="text" class="common_input_text" id="fullName" maxlength="50" name="bean.fullName" isrequired="true" autocomplete="off" value="${bean.fullName}"></dd>
        <dt><span class="star">*</span><span class="item_title">Logo图片</span></dt>
        <dd>
        <div class="upload_widget">
        <jsp:include page="/common/uploadFile.jsp">
<jsp:param value="img" name="fileType"/>
<jsp:param value="${bean.logoAttachmentId}" name="assetId"/>
<jsp:param value="200" name="width"/>
<jsp:param value="120" name="height"/>
</jsp:include>
<p>仅支持JPG、GIF、PNG格式，文件小于512K；建议尺寸为400x240px</p>
</div>
        </dd>
       
        <dt>&nbsp;</dt>
        <dd>
        <ui:Link action="save" href="javascript:onSave('save','company');" label="确认提交" className="common_btn btn_large common_btn_add" />
        <ui:Link action="cancel" label="取消" className="common_btn btn_large common_btn_normal" />
        </dd>
      </dl>
      </ui:Form>
  </div>
  <div class="clear"></div>
</div>

<jsp:include page="/common/footer.jsp"></jsp:include>
</body>
</html>