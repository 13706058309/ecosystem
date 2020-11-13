var path;
var existData=Object;
var notExistData=Object;
$(function () {
    path=$("#path").val();
    findRoles();
});
function showTree(listMap) {
    layui.use(['tree','util','form'], function(){
        console.log("2222222");
        var tree = layui.tree
            ,util = layui.util
            ,layer=layui.layer
            ,form=layui.form

        var tree1=tree.render({
            elem: '#tree1'
            ,data:listMap.existList
            ,showCheckbox:true
            // ,data:existData
            ,id: 'demoId' //定义索引
        });

        var tree2=tree.render({
            elem: '#tree2'
            ,data:listMap.notExistList
            ,showCheckbox:true
            // ,data:notExistData
            ,id: 'demoId2' //定义索引
        });

        util.event("lay-demo",{
            // 删除选中权限
            toRight: function () {
                var checkedData = tree.getChecked('demoId'); //获取选中节点的数据
                console.log(checkedData);
                var idArr=new Array();
                for (var i=0;i<checkedData.length;i++){
                    //子节点全选，父节点也要删除；获取父节点ID
                    if (checkedData[i].children.length==checkedData[i].childrenSize){
                        idArr.push(checkedData[i].id);
                        console.log(checkedData[i]);
                    }
                    //获取子节点ID
                    for (var k=0;k<(checkedData[i].children.length);k++){
                        idArr.push(checkedData[i].children[k].id);
                    }
                }
                layer.confirm("确定删除选中的权限吗？",function () {
                    modifyPower("del",idArr,layer,tree);
                })
            },
            // 删除所有权限
            allToRight:function () {
                var idArr=new Array();
                var exist=listMap.existList;
                console.log(exist);
                for (var i=0;i<exist.length;i++){
                    idArr.push(exist[i].id);
                    for (var j=0;j<(exist[i].children.length);j++){
                        idArr.push(exist[i].children[j].id);
                    }
                }
                layer.confirm("确定删除所有权限吗？",function () {
                    modifyPower("delAll",idArr,layer,tree);
                })

            },
            // 添加选中权限
            toLeft:function () {
                var checkedData = tree.getChecked('demoId2'); //获取选中节点的数据
                console.log(checkedData);
                var idArr=new Array();
                //获取已分配菜单的父节点
                var exist=listMap.existList;
                for (var i=0;i<checkedData.length;i++){
                    var flag=true;
                    //遍历父节点，判断要添加的父节点是否已近存在
                    for (var j=0;j<exist.length;j++){
                        if (exist[j].id==checkedData[i].id){
                            flag=false;
                        }
                    }
                    //父节点不存在,添加到数组中
                    if (flag==true){
                        idArr.push(checkedData[i].id);
                    }
                    for (var k=0;k<(checkedData[i].children.length);k++){
                        idArr.push(checkedData[i].children[k].id);
                    }
                }
                layer.confirm("确定添加选中的权限吗？",function () {
                    modifyPower("add",idArr,layer,tree);
                })

            },
            // 添加所有权限
            allToLeft:function () {
                var idArr=new Array();
                var notExist=listMap.notExistList;
                var exist=listMap.existList;
                console.log(notExist);
                for (var i=0;i<notExist.length;i++){
                    var flag=true;
                    for (var k=0;k<exist.length;k++){
                        if (exist[k].id==notExist[i].id){
                            flag=false;
                        }
                    }
                    //父节点不存在,添加到数组中
                    if (flag==true){
                        idArr.push(notExist[i].id);
                    }

                    for (var j=0;j<(notExist[i].children.length);j++){
                        idArr.push(notExist[i].children[j].id);
                    }
                }
                layer.confirm("确定添加所有权限吗？",function () {
                    modifyPower("addAll",idArr,layer,tree);
                })

            }
        })
    });
}
function findExistMenu(roleId){
    $.ajax({
        url:path+"/power/findExistMenu",
        sync:true,
        type:'post',
        dataType:'json',
        data:{"roleId":roleId},
        success:function (listMap) {
            existData=listMap.existList;
            notExistData=listMap.notExistList;
            showTree(listMap);
            console.log(existData);
            console.log(notExistData);
            console.log(listMap);
        }
    })
}

function findRoles(){
    $.ajax({
        url:path+"/power/findRoles",
        type:'post',
        dataType:'json',
        success:function (res) {
            console.log(res);
            $("#roleId").children().remove();
            for (var i=0;i<res.length;i++){
                if (i==0){
                    findExistMenu(res[i].roleId)
                }
                $("#roleId").append("<option value='"+res[i].roleId+"'>"+res[i].roleName+"</option>");
            }
        }
    })
}

function modifyPower(code,arr,layer,tree) {
    var layer=layer;
    var tree=tree;
    var code=code;
    var arr=arr;
    var roleId=$("#roleId").val();
    console.log(arr);
    $.ajax({
        type:"post",
        url:path+"/power/modifyPower",
        dataType:'text',
        data:{"roleId":roleId,"code":code,"menuIds":arr},
        beforeSend:function(){
            if (code=="del"){
                if (arr.length<1){
                    layer.msg("请选择已分配菜单中的权限！");
                    return false;
                }
            }
            if (code=="add"){
                if (arr.length<1){
                    layer.msg("请选择未分配菜单中的权限！");
                    return false;
                }
            }
            return true;
        },
        success:function (res) {
            if (res=="success"){
                layer.alert("修改成功！");
                findExistMenu(roleId);
            }
        }
    })
}
function changeRole(){
    var roleId=$("#roleId").val();
    console.log(roleId);
    findExistMenu(roleId);
}