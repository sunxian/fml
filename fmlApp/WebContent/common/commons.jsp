<%@ page pageEncoding="UTF-8"%>
<script type="text/javascript">
	/**验证添加**/
	function onSave(action,param) {
		$("#action").val(action);
		if (param=="user") {
			//验证用户必填项
			var code = $("#code");
			if (code.val().length<1) {
				showMsg("请输入工号");
				code.focus();
				return;
			}
			var name = $("#name");
			if (name.val().length<1) {
				showMsg("请输入姓名");
				name.focus();
				return;
			}
		} else if(param=="role") {
			//验证角色必填项
			var name = $("#name");
			if (name.val().length<1) {
				showMsg("请输入角色名称");
				name.focus();
				return;
			}
		} else if(param=="company") {
			//验证公司必填项
			var name = $("#name");
			if (name.val().length<1) {
				showMsg("请输入英文名称");
				name.focus();
				return;
			}
			var fullName = $("#fullName");
			if (fullName.val().length<1) {
				showMsg("请输入中文名称");
				fullName.focus();
				return;
			}
			var logoAssetId = $("#assetId").val();
			if (!logoAssetId) {
				showMsg("请上传公司logo");
				return;
			}
		} else if(param=="brand") {
			//验证品牌必填项
			var company = $("#company");
			if (company.val().length<1) {
				showMsg("请选择所属公司");
				company.focus();
				return;
			}
			var code = $("#code");
			if (code.val().length<1) {
				showMsg("请输入英文名称");
				code.focus();
				return;
			}
			var name = $("#name");
			if (name.val().length<1) {
				showMsg("请输入中文名称");
				name.focus();
				return;
			}
			var logoAssetId = $("#assetId").val();
			if (!logoAssetId) {
				showMsg("请上传品牌logo");
				return;
			}
		} else if (param =="model") {
			//验证车型
			var common_select_company = $("#company");
			if (common_select_company.val().length < 1) {
				showMsg("请选择所属公司");
				common_select_company.focus();
				return;
			}
			var common_select_brand = $("#brand");
			if (common_select_brand.val().length < 1) {
				showMsg("请选择所属品牌");
				common_select_brand.focus();
				return;
			}
			var code = $("#code");
			if (code.val().length < 1) {
				showMsg("请输入英文名称");
				code.focus();
				return;
			}
			var name = $("#name");
			if (name.val().length < 1) {
				showMsg("请输入中文名称");
				name.focus();
				return;
			}
		} else if(param == "person") {
			var name = $("#name");
			if(name.val().length < 1) {
				showMsg("请输入姓名");
				name.focus();
				return;
			}
		} else if (param == "dict") {
			var code = $("#code");
			if(code.val().length < 1) {
				showMsg("请输入数据编码");
				code.focus();
				return;
			}
			var name = $("#name");
			if(name.val().length < 1) {
				showMsg("请输入数据名称");
				name.focus();
				return;
			}
		} else if(param == "dictDetail") {
			var code = $("#code");
			if(code.val().length < 1) {
				showMsg("请输入编码");
				code.focus();
				return;
			}
			var value = $("#value");
			if(value.val().length < 1) {
				alert("请输入名称");
				value.focus();
				return;
			}
		} else if(param == "device") {
			var sn = $("#sn");
			if(sn.val().length < 1) {
				showMsg("请输入设备序列号");
				sn.focus();
				return;
			}
			var name = $("#name");
			if(name.val().length < 1) {
				showMsg("请输入设备名称");
				name.focus();
				return;
			}
		} else if(param == "savePass") {
			var password = $("#password");
			if(password.val().length < 1) {
				showMsg("请输入ipad登陆密码");
				password.focus();
				return;
			}
		} else if(param == "saveDataRate") {
			var dataUploadRate = $("#dataUploadRate");
			if(dataUploadRate.val().length < 1) {
				showMsg("请输入数据上传频率");
				dataUploadRate.focus();
				return;
			}
		} else if(param == "saveGpsRate") {
			var gpsUploadRate = $("#gpsUploadRate");
			if(gpsUploadRate.val().length < 1) {
				showMsg("请输入gps上传频率");
				gpsUploadRate.focus();
				return;
			}
		} else if(param == "saveTrackRate") {
			var gpsUploadRate = $("#trackRate");
			if(gpsUploadRate.val().length < 1) {
				showMsg("请输入车辆跟踪间隔时间");
				gpsUploadRate.focus();
				return;
			}
		}
		$("#frm").submit();
	}
	
	function upload(action , param) {
		$("#action").val(action);
		if (param == "importPerson") {
			$("#frm").submit();
		} else if(param == "importQuestion") {
			$("#frm").submit();
		}
	}
	
</script>