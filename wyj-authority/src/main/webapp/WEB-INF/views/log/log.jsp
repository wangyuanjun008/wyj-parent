<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${bathPath}/plugins/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" />
<link href="${bathPath}/plugins/bootstrap-table-1.11.1/bootstrap-table.min.css" rel="stylesheet" />
<link href="${bathPath}/plugins/jquery-confirm/jquery-confirm.min.css" rel="stylesheet" />
<link href="${bathPath}/css/public.css" rel="stylesheet" />
<link href="${bathPath}/plugins/select2-4.0.3/dist/css/select2.min.css" rel="stylesheet" />
<link href="${bathPath}/plugins/bootstrapvalidator/css/bootstrapValidator.min.css" rel="stylesheet" />
</head>
<body>
	<div id="main">
		<div id="toolbar">
			<shiro:hasPermission name="log:remove">
				<button type="button" class="btn btn-primary" onclick="remove(model);">删除日志</button>
			</shiro:hasPermission>
		</div>
		<table id="table"></table>
	</div>
	<div class="container" style="width: 100%">
		<table id="demo-table">
		</table>
	</div>

	<script src="${bathPath}/plugins/jquery-3.2.1/jquery-3.2.1.min.js"></script>
	<script src="${bathPath}/plugins/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script src="${bathPath}/plugins/bootstrap-table-1.11.1/bootstrap-table.min.js"></script>
	<script src="${bathPath}/plugins/bootstrap-table-1.11.1/locale/bootstrap-table-zh-CN.js"></script>
	<script src="${bathPath}/plugins/jquery-confirm/jquery-confirm.min.js"></script>
	<script src="${bathPath}/plugins/select2-4.0.3/dist/js/select2.min.js"></script>
	<script src="${bathPath}/plugins/select2-4.0.3/dist/js/i18n/zh-CN.js"></script>
	<script src="${bathPath}/plugins/jquery-validation/jquery.validate.min.js"></script>
	<script src="${bathPath}/plugins/jquery-validation/messages_zh.min.js"></script>
	<script src="${bathPath}/js/base.js"></script>

	<script type="text/javascript">
        var model = {
            id : "myModal",
            formId : "saveForm",
            entityId : "logId",
            createTitle : "新增日志",
            editTitle : "编辑日志",
            removeURL : "${ctx}/log/remove",
            dataURL : '${ctx}/dataDict/getData?groupCode='
        }
        function myCreate(model) {}
        
        function myEdit(obj,model){}
        
        $(function() {
            initTable();
        });

        function doQuery(params) {
            $('#demo-table').bootstrapTable('refresh'); //刷新表格
        }
        function initTable() {
            var url = "${ctx}/log/list";
            $('#demo-table').bootstrapTable({
                method : 'post',
                contentType : 'application/x-www-form-urlencoded',
                url : url,
                editable : true,//开启编辑模式
                height : $(window).height() - 110,//定义表格的高度。
                striped : true,//设置为 true 会有隔行变色效果
                search : false,//是否启用搜索框
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
                idField : 'logId',//指定主键列
                sortName : 'logId',
                sortOrder : 'desc',
                escape : true,
                maintainSelected : true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项
                toolbar : '#toolbar',//一个jQuery 选择器，指明自定义的toolbar 例如:
                queryParams : queryParams,
                columns : [ {
                    field : 'state',
                    checkbox : true
                }, {
                    field : 'operation',
                    title : '操作',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'method',
                    title : '方法',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'params',
                    title : '参数',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'time',
                    title : '耗时',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'createTime',
                    title : '创建时间',
                    sortable : true,
                    halign : 'center'
                } ]
            }).on('all.bs.table', function(e, name, args) {
                $('[data-toggle="tooltip"]').tooltip();
                $('[data-toggle="popover"]').popover();
            });

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
