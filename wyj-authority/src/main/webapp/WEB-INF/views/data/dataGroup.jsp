<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>huiju</title>
<link href="${bathPath}/plugins/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" />
<link href="${bathPath}/plugins/bootstrap-table-1.11.1/bootstrap-table.min.css" rel="stylesheet" />
<link href="${bathPath}/plugins/jquery-confirm/jquery-confirm.min.css" rel="stylesheet" />
<link href="${bathPath}/css/public.css" rel="stylesheet" />
<link href="${bathPath}/plugins/select2-4.0.3/dist/css/select2.min.css" rel="stylesheet" />

<style>
.select2-container--open {
	z-index: 9999999
}
</style>
</head>
<body>
	<div id="main">
		<div id="toolbar">
			<button type="button" class="btn btn-primary" data-toggle="modal" onclick='creat(model);'>新增分组</button>
			<button type="button" class="btn btn-primary" data-toggle="modal" onclick="edit(model);">编辑分组</button>
			<button type="button" class="btn btn-primary" onclick="remove(model);">删除分组</button>
		</div>
		<table id="table"></table>
	</div>
	<div class="container" style="width: 100%">
		<table id="demo-table">
		</table>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLable" aria-hidden="true">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
					<h4 class="modal-title" id="myModalLabel">数据字典</h4>
				</div>
				<div class="modal-body">
					<form method="get" id="saveForm" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-4 control-label"><span class="red">*</span>分组编码:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="groupCode">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label"><span class="red">*</span>分组名称:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="groupName">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label"><span class="red">*</span>描述:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="remark">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">使用状态:</label> <select id="sel_status" name="status" class="col-sm-1 form-control select2">
							</select>
						</div>
						<input type="hidden" name="groupId">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="save(model);">提交</button>

				</div>
			</div>
		</div>
	</div>


	<script src="${bathPath}/plugins/jquery-3.2.1/jquery-3.2.1.min.js"></script>
	<script src="${bathPath}/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script src="${bathPath}/plugins/bootstrap-table-1.11.1/bootstrap-table.min.js"></script>
	<script src="${bathPath}/plugins/bootstrap-table-1.11.1/locale/bootstrap-table-zh-CN.js"></script>
	<script src="${bathPath}/plugins/jquery-confirm/jquery-confirm.min.js"></script>
	<script src="${bathPath}/plugins/select2-4.0.3/dist/js/select2.min.js"></script>
	<script src="${bathPath}/plugins/select2-4.0.3/dist/js/i18n/zh-CN.js"></script>
	<script src="${bathPath}/js/base.js"></script>

	<script type="text/javascript">
        var model = {
            id : "myModal",
            formId : "saveForm",
            entityId : "groupId",
            createTitle : "新增分组",
            editTitle : "编辑分组",
            editURL : "${ctx}/dataGroup",
            saveURL : "${ctx}/dataGroup/add",
            removeURL : "${ctx}/dataGroup/remove"
        }

        $(function() {
            initTable();
            $("#sel_status").select2({
                placeholder : "--请选择--",
                dropdownParent : $("#myModal"),
                allowClear : true,
                width : 150,
                data : [ {
                    id : 1,
                    text : '是'
                }, {
                    id : 0,
                    text : '否'
                } ]
            });
        });

        function doQuery(params) {
            $('#demo-table').bootstrapTable('refresh'); //刷新表格
        }
        function initTable() {
            var url = "${ctx}/dataGroup/list";
            $('#demo-table').bootstrapTable({
                method : 'post',
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
                detailView : true,//设置为 true 可以显示详细页面模式。
                detailFormatter : 'detailFormatter',//格式化详细页面模式的视图。
                pagination : true,// 分页 
                paginationLoop : false,//设置为 true 启用分页条无限循环的功能
                pageList : [ 5, 10, 20 ],
                classes : 'table table-hover table-no-bordered',
                smartDisplay : false,
                idField : 'groupId',//指定主键列
                sortName : 'groupId',
                sortOrder : 'desc',
                escape : true,
                maintainSelected : true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项
                toolbar : '#toolbar',//一个jQuery 选择器，指明自定义的toolbar 例如:
                queryParams : queryParams,
                columns : [ {
                    field : 'state',
                    checkbox : true
                }, {
                    field : 'groupId',
                    title : '分组Id',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'groupCode',
                    title : '分组编码',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'groupName',
                    title : '分组名称',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'remark',
                    title : '描述',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'status',
                    title : '使用状态',
                    sortable : true,
                    halign : 'center',
                    formatter : genderFormatter
                } ]
            }).on('all.bs.table', function(e, name, args) {
                $('[data-toggle="tooltip"]').tooltip();
                $('[data-toggle="popover"]').popover();
            });

        }
        function detailFormatter(index, row) {
            var html = [];
            $.each(row, function(key, value) {
                html.push('<p><b>' + key + ':</b> ' + value + '</p>');
            });
            return html.join('');
        }

        /** 替换数据为文字 */
        function genderFormatter(value) {
            if (value == null || value == undefined) {
                return "-";
            } else if (value == 1) {
                return "是";
            } else if (value == 0) {
                return "否";
            }
        }

        function queryParams(params) {
            var param = {
                //                 orgCode : $("#orgCode").val(),
                //                 userName : $("#userName").val(),
                //                 startDate : $("#startDate").val(),
                //                 endDate : $("#endDate").val(),
                limit : this.limit, // 页面大小
                offset : this.offset, // 页码
                pageindex : this.pageNumber,
                pageSize : this.pageSize
            }
            return param;
        }

        // 用于server 分页，表格数据量太大的话 不想一次查询所有数据，可以使用server分页查询，数据量小的话可以直接把sidePagination: "server"  改为 sidePagination: "client" ，同时去掉responseHandler: responseHandler就可以了，
        function responseHandler(res) {
            if (res) {
                return {
                    "rows" : res.result,
                    "total" : res.totalCount
                };
            } else {
                return {
                    "rows" : [],
                    "total" : 0
                };
            }
        }

        /** 刷新页面 */
        function refresh() {
            $('#demo-table').bootstrapTable('refresh');
        }
    </script>
</body>
</html>
