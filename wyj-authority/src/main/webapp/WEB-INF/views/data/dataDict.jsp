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
	<div class="col-sm-2">
		<ul id="treeDemo" class="ztree" url="${ctx}/dataDict/renderTree"></ul>
	</div>
	<div class="col-sm-10">
		<div id="toolbar">
			<shiro:hasPermission name="dataDict:save">
				<button type="button" class="btn btn-primary" data-toggle="modal" onclick='creatBefore(model);'>新增数据字典</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="dataDict:edit">
				<button type="button" class="btn btn-primary" data-toggle="modal" onclick="edit(model);">编辑数据字典</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="dataDict:remove">
				<button type="button" class="btn btn-primary" onclick="remove(model);">删除数据字典</button>
			</shiro:hasPermission>
			<input id="search_dataGroupId" type="hidden">
		</div>
		<div class="container" style="width: 100%">
			<table id="demo-table">
			</table>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLable" aria-hidden="true">
		<div class="modal-dialog  modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
					<h4 class="modal-title" id="myModalLabel">数据字典</h4>
				</div>
				<div class="modal-body">
					<div class="col-lg-12">
						<form method="get" id="saveForm" class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-1 control-label"><span class="red">*</span>编码:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="dictCode" required="true">
								</div>
								<label class="col-sm-1 control-label"><span class="red">*</span>名称:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="dictName" required="true">
								</div>
								<label class="col-sm-1 control-label">描述:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="remark">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-1 control-label">父节点ID:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" name="dictParentId">
								</div>
								<label class="col-sm-1 control-label">使用状态:</label> <select id="status" name="status" class="col-sm-3 form-control select2">
								</select>
							</div>
							<input type="hidden" name="dictId"> <input type="hidden" name="dataGroup.groupId">
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
            entityId : "dictId",
            createTitle : "新增数据字典",
            editTitle : "编辑数据字典",
            editURL : "${ctx}/dataDict",
            saveURL : "${ctx}/dataDict/add",
            removeURL : "${ctx}/dataDict/remove",
            dataURL : '${ctx}/dataDict/getData?groupCode='
        }
        var dataStore = getDataStore(model.dataURL + 'yesOrNo');
        var setting = {
            data : {
                simpleData : {
                    enable : true,
                    idKey : "id",
                    pIdKey : "parentId",
                    rootPId : 0
                },
                key : {
                    url : "xUrl"
                }
            },
            callback : {
                onClick : zTreeOnClick
            }
        };

        var ztree;

        function zTreeOnClick(event, treeId, treeNode, clickFlag) {
            $('#search_dataGroupId').val(treeNode.id);
            $('#demo-table').bootstrapTable('refresh'); //刷新表格
        }

        function myCreate(model) {
            $('#' + model.formId + " input[name='dataGroup.groupId']").val($('#search_dataGroupId').val());
        }
        function creatBefore(model) {
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
            var treeNodes = treeObj.getSelectedNodes();
            if (!!treeNodes[0] && treeNodes[0].isParent == true) {
                creat(model);
            } else {
                alert('数据分组暂不支持级联!');
                return false;
            }
        }
        function myEdit(obj, model) {
            $('#' + model.formId + " input[name='dataGroup.groupId']").val(obj.dataGroup.groupId);
        }

        $(function() {
            initTable();
            //加载树
            var jsonTree = getDataStore($("#treeDemo").attr("url"));
            ztree = $.fn.zTree.init($("#treeDemo"), setting, jsonTree);

            $("#status").select2({
                placeholder : "--请选择--",
                dropdownParent : $("#myModal"),
                allowClear : true,
                width : 150,
                minimumResultsForSearch : -1,
                data : dataStore
            });
        });

        function doQuery(params) {
            $('#demo-table').bootstrapTable('refresh'); //刷新表格
        }
        function initTable() {
            var url = "${ctx}/dataDict/list";
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
                idField : 'dictId',//指定主键列
                sortName : 'dictId',
                sortOrder : 'desc',
                escape : true,
                maintainSelected : true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项
                toolbar : '#toolbar',//一个jQuery 选择器，指明自定义的toolbar 例如:
                queryParams : queryParams,
                columns : [ {
                    field : 'state',
                    checkbox : true
                }, {
                    field : 'dictCode',
                    title : '编码',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'dictName',
                    title : '名称',
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
                dataGroupId : $('#search_dataGroupId').val(),
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
