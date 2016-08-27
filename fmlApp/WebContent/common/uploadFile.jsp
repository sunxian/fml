<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="hiddenId" >
 <c:out value="${param.hiddenId}" default="assetId"/>
</c:set>
	<script type="text/javascript">	
    function clearUploadFile_${hiddenId}(){
    	$("#${hiddenId}").val(data);
    	<c:if test='${param.fileType=="img"}'>
    		$("#${hiddenId}_imgShow").attr("src","");
    		$("#${hiddenId}_imgShow").hidden();
    	</c:if>
    	<c:if test='${param.fileType!="img"}'>
    	    $("#${hiddenId}_a").attr("href","");
    	    $("#${hiddenId}_a").show();
    	</c:if>
	}
	$(function(){		
		$("#${hiddenId}_uploadify").uploadify({
		    swf: 'upload/uploadify.swf',
		    formData:{fileType:'${param.fileType}'},
			removeTimeout : 1,
		    uploader: 'UploadFile',
		    buttonText: '选择文件',
<c:if test='${param.fileType=="img"}'>		    
		    fileTypeDesc : '图片文件',
	        fileTypeExts : '*.jpg; *.png',
</c:if>
<c:if test='${param.fileType=="excel"}'>		    
		    fileTypeDesc : 'Excel文件',
	        fileTypeExts : '*.xls; *.xlsx',
</c:if>
		    multi:false,   
		    queueID:'${hiddenId}_queueID',
		    fileObjName:'uploadFile',
		    onUploadSuccess:function(file, data, response){
                if (data=="-1") {
                	showMsg("图片尺寸超大了，请重新上传。");
                	return;
                }
		        $("#${hiddenId}").val(data);
<c:if test='${param.fileType=="img"}'>
		    	$("#${hiddenId}_imgShow").attr("src","Asset/" + data);
		    	$("#${hiddenId}_imgShow").show();
</c:if>
<c:if test='${param.fileType!="img"}'>
                $("#${hiddenId}_a").attr("href","Asset/" + data);
                $("#${hiddenId}_a").text(file.name);
                $("#${hiddenId}_a").show();
                $("#importError").hide();
</c:if>
		    }
		});
	});
</script>
<c:if test='${param.fileType=="img"}'>	
 <c:if test='${empty param.assetId}'>
 	<c:if test="${empty param.picType}"><img width="${param.width}" height="${param.height}" id="${hiddenId}_imgShow" onload="ImgAuto(this,${param.width},${param.height});" src="images/pic_default_project.png"/></c:if>
 	<c:if test='${param.picType=="logo"}'><img width="${param.width}" height="${param.height}" id="${hiddenId}_imgShow" onload="ImgAuto(this,${param.width},${param.height});" src="images/pic_nologo.png"/></c:if>
 </c:if>
 <c:if test='${not empty param.assetId}'><img width="${param.width}" height="${param.height}" onload="ImgAuto(this,${param.width},${param.height});" id="${hiddenId}_imgShow" src="Asset/${param.assetId}"/></c:if>
</c:if>
<c:if test='${param.fileType!="img"}'><a id="${hiddenId}_a"　title="下载"></a></c:if>
 <input id="${hiddenId}" type="hidden" name="${empty param.hiddenName?hiddenId:param.hiddenName}" value="${param.assetId}"/>
 <input id="${hiddenId}_uploadify" type="hidden" />
 <span id="${hiddenId}_queueID" width="${param.width}px;" class="tips upload_tips"></span>