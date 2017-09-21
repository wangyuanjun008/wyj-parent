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
<link href="${bathPath}/plugins/ztree.3.5.26/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" />

<style>
.select2-container--open {
	z-index: 9999999
}
</style>
</head>
<body>
	<div id="main">
		<div id="toolbar">
			<button type="button" class="btn btn-primary" data-toggle="modal" onclick='creat(model);'>新增角色</button>
			<button type="button" class="btn btn-primary" data-toggle="modal" onclick="edit(model);">编辑角色</button>
			<button type="button" class="btn btn-primary" onclick="remove(model);">删除角色</button>
			<button type="button" class="btn btn-primary" data-toggle="modal" onclick="operate(model);">操作权限</button>
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
					<h4 class="modal-title" id="myModalLabel">标题</h4>
				</div>
				<div class="modal-body">
					<form method="get" id="saveForm" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-4 control-label"><span class="red">*</span>角色名称:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="roleName">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label"><span class="red">*</span>角色标识:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="roleSign">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label"><span class="red">*</span>描述:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="remake">
							</div>
						</div>

						<input type="hidden" name="createTime" /> <input type="hidden" name="createUserId" /> <input type="hidden" name="roleId" />
					</form>
				</div>
				<div class="modal-footer" style="border: none; margin-left: 40%; padding-bottom: 20px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="save(model);">提交</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLable" aria-hidden="true">
		<div class="modal-dialog  modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
					<h4 class="modal-title" id="myModalLabel">操作权限</h4>
				</div>
				<div class="modal-body">
					<div class="col-lg-12" style="height: 300px; overflow: scroll;">
						<ul id="treeDemo" class="ztree" url="${ctx}/auth/renderTree"></ul>
					</div>
				</div>
				<div class="modal-footer" style="border: none; margin-left: 40%; padding-bottom: 20px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="allocationAuth(model);">保存</button>
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
	<script src="${bathPath}/plugins/ztree.3.5.26/js/jquery.ztree.all.js"></script>
	<script src="${bathPath}/plugins/ztree.3.5.26/js/jquery.ztree.all.js"></script>
	<script src="${bathPath}/plugins/ztree.3.5.26/js/jquery.ztree.core.min.js"></script>
	<script src="${bathPath}/plugins/ztree.3.5.26/js/jquery.ztree.excheck.min.js"></script>
	<script src="${bathPath}/plugins/ztree.3.5.26/js/jquery.ztree.exedit.min.js"></script>
	<script src="${bathPath}/plugins/ztree.3.5.26/js/jquery.ztree.exhide.min.js"></script>
	<script src="${bathPath}/js/base.js"></script>


	<script type="text/javascript">
        var model = {
            id : "myModal",
            formId : "saveForm",
            entityId : "roleId",
            createTitle : "新增角色",
            editTitle : "编辑角色",
            editURL : "${ctx}/role",
            saveURL : "${ctx}/role/add",
            removeURL : "${ctx}/role/remove"
        }

        var model1 = {
            id : "myModal1",
            formId : "saveForm",
            entityId : "roleId",
            authorizeURL : '${ctx}/role/authorize' 
//             createTitle : "新增角色",
//             editTitle : "编辑角色",
//             editURL : "${ctx}/role",
//             saveURL : "${ctx}/role/add",
//             removeURL : "${ctx}/role/remove"
        }
        var ztree;

        var setting = {
            data : {
                simpleData : {
                    enable : true,
                    idKey : "menuId",
                    pIdKey : "parentId",
                    rootPId : 0
                },
                key : {
                    url : "xUrl"
                }
            },
            check : {
                enable : true,
                chkStyle : "checkbox",
                chkboxType : {
                    "Y" : "ps",
                    "N" : "ps"
                }
            }
        };

        $(function() {
            //加载列表
            initTable();

            //加载树
            var jsonTree = getDataStore($("#treeDemo").attr("url"));
            ztree = $.fn.zTree.init($("#treeDemo"), setting, jsonTree);
        });

        function myCreate(model) {}

        function myEdit(obj, model) {}

        //点击分配权限
        function operate() {
            ztree.checkAllNodes(false);//全部节点取消勾选
            ztree.expandAll(true);
            var selectRow = $("#demo-table").bootstrapTable('getSelections');
            if (selectRow.length != 1) {
                alert('请选择并只能选择一条数据！');
                return false;
            }
            var selectRowData = selectRow[0];
            var id = selectRowData[model.entityId];
            var jsonMenus = getDataStore('${ctx}/role/' + id + '?time=' + new Date().getTime());
            //勾选角色所拥有的菜单
            var menuIds = jsonMenus.data.obj.menus;
            for (var i = 0; i < menuIds.length; i++) {
                var node = ztree.getNodeByParam("menuId", menuIds[i]);
                ztree.checkNode(node, true, false);
            }
            $('#' + model1.id).modal('show');
        }
        //保存分配权限
        function allocationAuth() {
            var selectRow = $("#demo-table").bootstrapTable('getSelections');
            var selectRowData = selectRow[0];
            var id = selectRowData[model.entityId];
            
            var nodes = ztree.getCheckedNodes(true);
            if(nodes.length == 0){
                return;
            }
            var menuList = new Array();
            for (var i = 0; i < nodes.length; i++) {
                menuList.push(nodes[i].menuId);
            }
            
            
            $.confirm({
                title : '提示！',
                content : '确定保存吗?',
                buttons : {
                    ok : {
                        text : "确定",
                        btnClass : 'btn-primary',
                        keys : [ 'enter' ],
                        action : function() {
                            $.ajax({
                                type : 'post',
                                url : model1.authorizeURL,
                                data : {
                					'menus' : menuList,
                					'roleId' : id
                                },
                                traditional: true,
                                dataType : 'json',
                                success : function(result) {
                                }
                            })
                        }
                    },
                    cancel : {
                        text : "取消",
                        btnClass : 'btn-primary',
                        keys : [ 'esc' ],
                        action : function() {
                        }

                    }
                }
            });            
            


        }
        function doQuery(params) {
            $('#demo-table').bootstrapTable('refresh'); //刷新表格
        }
        function initTable() {
            var url = "${ctx}/role/list";
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
                detailView : true,//设置为 true 可以显示详细页面模式。
                detailFormatter : 'detailFormatter',//格式化详细页面模式的视图。
                pagination : true,// 分页 
                paginationLoop : false,//设置为 true 启用分页条无限循环的功能
                pageList : [ 5, 10, 20 ],
                classes : 'table table-hover table-no-bordered',
                smartDisplay : false,
                idField : 'roleId',//指定主键列
                sortName : 'roleId',
                sortOrder : 'desc',
                escape : true,
                maintainSelected : true,//设置为 true 在点击分页按钮或搜索按钮时，将记住checkbox的选择项
                toolbar : '#toolbar',//一个jQuery 选择器，指明自定义的toolbar 例如:
                queryParams : queryParams,
                columns : [ {
                    field : 'state',
                    checkbox : true
                }, {
                    field : 'roleName',
                    title : '角色名称',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'roleSign',
                    title : '角色标识',
                    sortable : true,
                    halign : 'center'
                }, {
                    field : 'remake',
                    title : '描述',
                    sortable : true,
                    halign : 'center'
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

        function queryParams(params) {
            var param = {
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
