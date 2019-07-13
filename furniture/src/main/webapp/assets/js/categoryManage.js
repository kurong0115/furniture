var url;
function newCategory(){
    $('#dlg').dialog('open').dialog('center').dialog('setTitle','添加分类');
    $('#fm').form('clear');
    url = 'saveCategory.do';
}
function editCategory(){
    var row = $('#dg').datagrid('getSelected');
    if (row){
        $('#dlg').dialog('open').dialog('center').dialog('setTitle','修改分类');
        $('#fm').form('load',row);
        url = 'updateCategory.do?cid='+row.cid;
    }
}

function saveCategory(){
    $('#fm').form('submit',{
        url: url,
        onSubmit: function(){
            return $(this).form('validate');
        },
        success: function(result){
        	result = JSON.parse(result);
            if (result.code == 1){
                $.messager.show({
                    title: '提示',
                    msg: result.message,
                    timeout:2000,
                    showType:"slide"
                });
                
            } else {
            	$.messager.show({
                    title: '错误',
                    msg: result.message,
                    timeout:2000,
                    showType:"slide"
                });    
            }
            $('#dlg').dialog('close');      
            $('#dg').datagrid('reload');
        }
    });
}
function destroyCategory(){
    var row = $('#dg').datagrid('getSelected');
    if (row){
        $.messager.confirm('确认','您确定删除此分类吗?',function(r){
            if (r){
                $.post('removeCategory.do',{cid:row.cid},function(result){
                    if (result.code == 1){
                    	$.messager.show({   // show error message
                            title: '提示',
                            msg: result.message,
                            timeout:2000,
                            showType:"slide"
                        });
                        $('#dg').datagrid('reload');    // reload the user data
                    } else {
                        $.messager.show({   // show error message
                            title: '错误',
                            msg: result.message,
                            timeout:2000,
                            showType:"slide"
                        });
                    }
                },'json');
            }
        });
    }
}