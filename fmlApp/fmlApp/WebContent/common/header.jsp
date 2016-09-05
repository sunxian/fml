<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>上海大众车辆评价系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=8"/>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.form.js"></script>
<script type="text/javascript" src="../js/select2.js"></script>
<script type="text/javascript" src="../js/stickUp.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../upload/jquery.uploadify.min.js"></script>
<script type="text/javascript" src="../js/jstree.min.js"></script>
<link href="../style/jstree_theme.css" rel="stylesheet" type="text/css" />
<link href="../upload/uploadify.css" rel="stylesheet" type="text/css" />
<link href="../style/main.css" rel="stylesheet" type="text/css" />
<link href="../style/main02.css" rel="stylesheet" type="text/css" />
<link href="../style/select2.css" rel="stylesheet" type="text/css" />
<link href="../DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
jQuery(function($) {$(document).ready(function() {
	var xx = $('.stuckMenu');
	if (xx.length>0) {
		xx.stickUp();
	}
});});
$(document).ready(function(){
	onFilterEnter();
	$(".themount_select").select2({ width:88 });
	$(".setting_btn").mouseover(function(){
  		$(".setting_btn ul").show(0);
	});
	$(".setting_btn").mouseleave(function(){
		$(".setting_btn ul").hide(0);
  	});
  	$("#con_table tr[class!='con_table_title']").mouseover(function(){
  		$(this).css("background-color","#f0f8fd");
  	});
  	$("#con_table tr[class!='con_table_title']").mouseleave(function(){
  		$(this).css("background-color","#fff");
  	});
	$(".change_btn").mouseover(function(){
		$(".sub_change").show(0);
	});
	$(".change_btn").mouseleave(function(){
		$(".sub_change").hide(0);
	});
  	$(".dict .parent_a").click(function(){
  		if($(".dict").hasClass("hasopen")){
  			$(".dict").removeClass("hasopen");
  			$(".dict .sub_ul").hide(200);
  		}else{
  			$(".dict").addClass("hasopen");
  			$(".dict .sub_ul").show(200);
  		}
  	});
  	<c:if test="${not empty result.msg}">
	showMsg('${result.msg}');
  	</c:if> 
});
</script>
