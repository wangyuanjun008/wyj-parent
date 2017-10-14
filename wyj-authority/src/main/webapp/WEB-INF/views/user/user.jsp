<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div id="main">
		<div id="toolbar">
			<shiro:hasPermission name="user:save">
				<button type="button" class="btn btn-primary" data-toggle="modal" onclick='creat(model);'>新增用户</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="user:edit">
				<button type="button" class="btn btn-primary" data-toggle="modal" onclick="edit(model);">编辑用户</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="user:remove">
				<button type="button" class="btn btn-primary" onclick="remove(model);">删除用户</button>
			</shiro:hasPermission>
		</div>
		<table id="table"></table>
	</div>
	<div class="container" style="width: 100%">
		<table id="demo-table">
		</table>
	</div>


	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLable" aria-hidden="true">
		<div class="modal-dialog  modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
					<h4 class="modal-title" id="myModalLabel">标题</h4>
				</div>
				<div class="modal-body">
					<div class="col-lg-12">
						<form method="get" id="saveForm" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-1 control-label"><span class="red">*</span>帐号:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="userName" required="required">
								</div>
								<label class="col-sm-1 control-label"><span class="red">*</span>密码:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="password" required="required">
								</div>
								<label class="col-sm-1 control-label"><span class="red">*</span>姓名:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="name" required="required">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-1 control-label">手机号码:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="phone">
								</div>
								<label class="col-sm-1 control-label">邮箱:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="email">
								</div>
								<label class="col-sm-1 control-label select-margin">性别:</label> <select id="sex" name="sex" class="col-sm-1 form-control select2">
								</select>
							</div>
							<div class="form-group">
								<label class="col-sm-1 control-label">地址:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="address">
								</div>
								<div>
									<label class="col-sm-1 control-label select-margin"><span class="red">*</span>可选角色:</label> <select id="roles" name="roles" class="col-sm-3 form-control select2" required="true">
									</select>
								</div>
								<div class="form-group"></div>
								<input type="hidden" name="userId">
						</form>
					</div>
				</div>
				<div class="modal-footer" style="border: none; margin-left: 40%; padding-bottom: 20px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="save(model);">提交</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
        var model = {
            id : "myModal",
            formId : "saveForm",
            entityId : "userId",
            createTitle : "新增用户",
            editTitle : "编辑用户",
            editURL : "${ctx}/user",
            saveURL : "${ctx}/user/add",
            removeURL : "${ctx}/user/remove",
            dataURL : '${ctx}/dataDict/getData?groupCode='
        }
        var sexStore = getDataStore(model.dataURL + 'sex');
        var roleStore = getDataStore('${ctx}/role/getAllRoles');
        function myCreate(model) {
        }

        function myEdit(obj, model) {
        }

        $(function() {
            initTable();
            $("#sex").select2({
                placeholder : "--请选择--",
                dropdownParent : $("#myModal"),
                allowClear : true,
                width : 188,
                minimumResultsForSearch : -1,
                data : sexStore
            });
            $("#roles").select2({
                placeholder : "--请选择--",
                dropdownParent : $("#myModal"),
                allowClear : true,
                multiple : true,
                width : 188,
                minimumResultsForSearch : -1,
                data : roleStore,
                multiple : true
            });
        });

        function initTable() {
            var url = "${ctx}/user/list";
            $('#demo-table').bootstrapTable({
                method : 'post',
                contentType : 'application/x-www-form-urlencoded',
                url : url,
                editable : true,//开启编辑模式
                height : $(window).height() - 110,//定义表格的高度。
                striped : true,//设置为 true 会有隔行变色效果
                search : true,//是否启用搜索框
                searchOnEnterKey : true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
                showRefresh : true,//是否显示 刷新按钮
                showToggle : true,//是否显示 切换试图（table/card）按钮
                showColumns : true,//是否显示 内容列下拉框
                minimumCountColumns : 2,
                showPaginationSwitch : true,//是否显示 数据条数选择框
                clickToSelect : true,//设置true 将在点击行时，自动选择rediobox 和 checkbox
                pagination : true,// 分页 
                paginationLoop : false,//设置为 true 启用分页条无限循环的功能
                pageList : [ 5, 10, 20 ],
                classes : 'table table-hover table-no-bordered',
                smartDisplay : false,
                idField : 'userId',//指定主键列
                sortName : 'userId',
                sortOrder : 'desc',
                escape : true,
                maintainSelected : true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项
                toolbar : '#toolbar',//一个jQuery 选择器，指明自定义的toolbar 例如:
                queryParams : queryParams,
                columns : [ {
                    field : 'state',
                    checkbox : true
                }, {
                    field : 'userName',
                    title : '账号',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'password',
                    title : '密码',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'name',
                    title : '姓名',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'sex',
                    title : '性别',
                    sortable : true,
                    halign : 'center',
                    formatter : sexFormatter
                }, {
                    field : 'age',
                    title : '年龄',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'phone',
                    title : '手机',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'email',
                    title : '邮箱',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'address',
                    title : '地址',
                    sortable : true,
                    halign : 'center'
                } ]
            }).on('all.bs.table', function(e, name, args) {
                $('[data-toggle="tooltip"]').tooltip();
                $('[data-toggle="popover"]').popover();
            });

        }

        /** 替换数据为文字 */
        function sexFormatter(value) {
            if (value == null || value == undefined) {
                return "-";
            } else if (value == 1) {
                return "男";
            } else if (value == 2) {
                return "女";
            }
        }
        
        function queryParams(params) {
            var param = {
                limit : this.limit, // 页面大小
                offset : this.offset, // 页码
                pageindex : this.pageNumber,
                pageSize : this.pageSize
            }
            return param;
        }

        /** 刷新页面 */
        function refresh() {
            $('#demo-table').bootstrapTable('refresh');
        }
    </script>
</body>
</html>
