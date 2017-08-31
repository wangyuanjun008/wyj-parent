function save(model){
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
                        url : model.saveURL,
                        data : $('#' + model.formId).serialize(),
                        dataType : 'json',
                        success : function() {
                            if (result.success) {
                                refresh();
                            }
                            $('#' + model.id).model('hide');
                        }
                    });

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


function creat(model) {
    $(':input', '#' + model.formId).not(':button,:submit,:reset') //将myform表单中input元素type为button、submit、reset、hidden排除
    .val('') //将input元素的value设为空值
    .removeAttr('checked');
    $('#' + model.id).modal('show');
}

function edit(model) {
    var selectRow = $("#demo-table").bootstrapTable('getSelections');
    if (selectRow.length != 1) {
        alert('请选择并只能选择一条数据进行编辑！');
        return false;
    }
    var selectRowData = selectRow[0];
    var id;
    for(var entityId in selectRowData){
        if(model.entityId == entityId){
            id = selectRowData[entityId];
        }
    }
    $(':input', '#' + model.formId).not(':button,:submit,:reset') //将myform表单中input元素type为button、submit、reset、hidden排除
    .val('') //将input元素的value设为空值
    .removeAttr('checked')

    $('#' + model.id).modal('show');
    $.ajax({
        type : 'get',
        url : model.editURL + '/' + id + '?time=' + new Date().getTime(),
        dataType : 'json',
        success : function(data) {
            var obj = data.data.obj;
            for ( var o in obj) {
                var e = '#' + model.id + ' input[name=' + o + ']';
                $(e).val(obj[o]);
            }
        }

    })
}

function remove(model) {
    var selectRow = $("#demo-table").bootstrapTable('getSelections');
    if (selectRow.length != 1) {
        alert('请选择并只能选择一条数据进行编辑！');
        return false;
    }
    var id = selectRow[0].tableId;

    $.confirm({
        title : '提示！',
        content : '确定删除吗?',
        buttons : {
            ok : {
                text : "确定",
                btnClass : 'btn-primary',
                keys : [ 'enter' ],
                action : function() {
                    $.ajax({
                        type : 'post',
                        url : model.removeURL,
                        data : {
                            id : id
                        },
                        dataType : 'json',
                        success : function(result) {
                            if (result.success) {
                                refresh();
                            }
                        }
                    });

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