<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="../static/date/laydate.js"></script>
	<jsp:include page="/common/header.jsp"/>
	<jsp:include page="/common/commons.jsp"/>
	   <style type="text/css">
        .tip{
            background-color: white;
            position: absolute;
            font-size: 12px;
            width: 20px;
            height: 20px;
        }

        #preview, .img, img
        {
            width:600px;
            height:auto;
            min-height: 200px;
            max-width: 1060px;
        }
        #preview
        {
            border:1px solid #000;
            position: relative;
        }

        table th,table td{
            padding:5px;
        }
        table td .form-control{
            padding: 0 2px;
        }
        .dele{
            cursor: pointer;
        }
        dl{
            margin-top: 40px;
        }
    </style>
     <script type="text/javascript">
        $(document).ready(function(){
        	   $('#submit').click(function () {
                var saveDataAry=[];
                var trs=$('#detail tr');
                console.log('len='+trs.length);
                for(var i=0;i<trs.length;i++){
                    var data= new Object;
                    var inputs=trs.eq(i).find('input');
                    data.name=inputs.eq(0).val();
                    data.isSalingFlag=inputs.eq(1).val();
                    data.openTime=inputs.eq(2).val();
                    data.leadTime=inputs.eq(3).val();
                    data.units=inputs.eq(4).val();
                    data.layers=inputs.eq(5).val();
                    data.salingHouses=inputs.eq(6).val();
                    data.houseRatio=inputs.eq(7).val();
                    data.x=inputs.eq(8).val();
                    data.y=inputs.eq(9).val();
                    data.buildingId=inputs.eq(10).val();
                    saveDataAry.push(data);
                }
              
               $.ajax({
                       type:"POST",
                       url:"http://localhost:8080/fml/project/addHouseBanToDb",
                       dataType:"json",
                       contentType:"application/json;charset=UTF-8",
                       data:JSON.stringify(saveDataAry),
                       success:function(data){

                       }
                   });
        });

    });
    </script>
</head>
<body>
<jsp:include page="/common/menu.jsp"></jsp:include>
<form id="add" method="post" action="${pageContext.request.contextPath}/project/addHouseBanToDb;jsessionid=${pageContext.request.session.id}">
  <input name="action" id="action" type="hidden" value="init"/>
  <input name="pageNo" id="pageNo" type="hidden" value="${pageNo}"/>
  <input name="pageSize" id="pageSize" type="hidden" value="${pageSize}"/>
  <input name="chk" id="chk" type="hidden" value="${chk[0]}"/>
<div class="page_inner">
  <jsp:include page="/common/leftMenu.jsp"></jsp:include>
  <div class="right_main">
        <div class="common_header border_bottom">
            <div class="actions_btn"></div>
            <h3>添加楼栋</h3>
        </div>
        <div class="form_edit">
            <div id="preview"></div>
            <input type="file" onchange="preview(this)" />
            <div>

                <table>
                    <col width="80px">
                    <col width="80px">
                    <col width="80px">
                    <col width="160px">
                    <col width="160px">
                    <col width="60px">
                    <col width="60px">
                    <col width="60px">
                    <col width="80px">
                    <col width="60px">
                    <col width="60px">
                    <col width="40px">

                    <thead>
                    <tr>
                        <th>临时id</th>
                        <th style="display:none;">楼盘号</th>
                        <th>楼栋号</th>
                        <th>状态</th>
                        <th>开盘时间</th>
                        <th>入住时间</th>
                        <th>单元</th>
                        <th>层数</th>
                        <th>户数</th>
                        <th>梯户配比</th>
                        <th>X坐标</th>
                        <th>Y坐标</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="detail">

                    </tbody>
                </table>
            </div>

            <dl>
                <dt></dt>
                <dd>
           
                <input type="submit"id="submit" value="确认提交"/>
               
                   

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

<!-- #BeginLibraryItem "/html/library/footer.lbi" -->
<div class="footer">
    <div class="inner">
        <div class="right_part">上海大众汽车有限公司版权所有</div>
        <div class="left_part">V1.01</div>
    </div>
</div><!-- #EndLibraryItem --><script>
    laydate.skin('lan');//切换皮肤，请查看skins下面皮肤库
    laydate({elem: '#indate1'});//绑定元素
    laydate({elem: '#indate2'});//绑定元素
    $(document).ready(function(){
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
        $(".common_select_company").select2({ width: 252,placeholder: "请选择所属公司…" });
    });
</script>
<script type="text/javascript">
    var id=1;
    var width=0.0;
    var height=0.0;
    var flag=-1;
    function preview(file)
    {
        var prevDiv = document.getElementById('preview');
        if (file.files && file.files[0])
        {
            var reader = new FileReader();
            reader.onload = function(evt){
                prevDiv.innerHTML = '<img id="unit-img" onclick="addItem()" src="' + evt.target.result + '" />';
            }
            reader.readAsDataURL(file.files[0]);

        }
        else
        {
            prevDiv.innerHTML = '<div class="img"  style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
        }
        $("#detail").html("");
        id=1;
        flag=1;
    }

    function addTipDiv(x,y) {
        var div=$('<div id="tip'+id+'"></div>');
        div.addClass("tip");
        div.text("#"+id);
        div.css("top",y-20+"px");
        div.css("left",x+"px");
        $("#preview").append(div);
    }
    function addRow(x,y) {
        x=x/width;
        y=y/height;
        var html= '<td>'+id+'#</td>'  +
                '<td><input type="text" name="id" class="form-control" placeholder="楼栋号"></td>' +
                '<td><input type="text" name="isSalingFlag" class="form-control" id="indate1" placeholder="在售状态"></td>' +
                '<td><input type="text" name="openTime" class="form-control" id="indate-open'+id+'"  placeholder="开盘时间"></td>' +
                '<td><input type="text" name="leadTime" class="form-control"id="indate-lead'+id+'" placeholder="入住时间"></td>' +
                '<td><input type="text" name="units" class="form-control" placeholder="单元"></td>' +
                '<td><input type="text" name="layers" class="form-control" placeholder="层数"></td>' +
                '<td><input type="text" name="" class="form-control" placeholder="户数"></td>' +
                '<td><input type="text" name="houseRatio" class="form-control" placeholder="梯户配比"></td>'+
                '<td><input type="text" name="" class="form-control" value='+x+' readonly></td>'+
                '<td><input type="text" name="" class="form-control" value='+y+' readonly></td>'+'<td style="display:none;"><input type="text" name="buildingId" value="${requestScope.buildingId}" class="form-control" placeholder=""></td>'
                +'<td><span onclick="dele('+id+')" class="dele">删除</span></td>';
        //   $("#detail").append($("#demo-row").clone());
        var row=$('<tr id="row'+id+'"></tr>');
        row.html(html);
        $("#detail").append(row);

    }
    function dele(i) {
        console.log("删除"+i);
        $('#row'+i).remove();
        $('#tip'+i).remove();
    }
    function addItem () {
        if(flag==1){
            width=$('#unit-img').width();
            height=$('#unit-img').height();
            console.log(width+';'+height);
            flag=0;
        }

        x=event.offsetX;
        y=event.offsetY;
        console.log("X 坐标: " + x + ", Y 坐标: " + y);
        addRow(x,y);
        addTipDiv(x,y);
        id++;

        //  console.log("hh");
    }
	function addHouseBan() {
		
		document.getElementById("add").submit();
	

	}
	 function addDate(t_id) {
	        setTimeout(function () {
	            laydate({elem: '#indate-open'+t_id});//绑定元素
	            laydate({elem: '#indate-lead'+t_id});//绑定元素
	         //   console.log("绑定日历indate-open"+t_id);

	        },500);

	    }

</script>


</body>

</html>
