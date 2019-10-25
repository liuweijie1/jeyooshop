/**
 * wbliywj


 * @returns
 */
var form = '';
$(document).keydown(function (event) {
    switch (event.keyCode) {
        case 13:
            return false;
    }
});
$(function () {
    $("#companya").addClass("layui-nav-itemed");
    $("#lay-account").addClass("layui-this");
})
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function () {

    form = layui.form
        , layer = layui.layer
        , laydate = layui.laydate;
    form.render();//初始化下拉框

    //日期  注意：定义页面日期控件id不要重复!!!
    laydate.render({
        elem: '#startTime'
    });
    laydate.render({
        elem: '#endTime'
    });


    var laypage = layui.laypage //分页
        , layer = layui.layer //弹层
        , table = layui.table //表格
        , carousel = layui.carousel //轮播
        , upload = layui.upload //上传
        , element = layui.element //元素操作
        , slider = layui.slider //滑块

    var dtt = {};// 搜索条件

    /*  //监听Tab切换
     element.on('tab(demo)', function(data){
       layer.tips('切换了 '+ data.index +'：'+ this.innerHTML, this, {
         tips: 1
       });
     }); */

    res(dtt);// 页面加载的时候渲染

    $("#searchBtn").click(function () {
        var companyid = $('#companyname option:selected').val();
        var state = $('#state option:selected').val();
        dtt = {companyid: companyid,state:state};
        res(dtt);
    })

    // table渲染
    function res(dtt) {
        //执行一个 table 实例
        table.render({
            elem: '#usercontact'
            , id: "accountid"
            , height: 475
            , url: '/usercompanyaccount/findUserCompanyAccount' //数据接口
            , title: '資訊管理'
            , page: false //开启分页
            , totalRow: false //开启合计行
            , limit: 10
            , where: dtt
            , method: 'GET'
            , cols: [[  //表头
                //{type: 'checkbox', fixed: 'left'}
                {field: 'accountid', title: 'accountid', align: 'center', width: '60', hide: true, sort: false}
                , {field: 'companyname', title: '公司名稱', align: 'center', width: '25%', hide: false, sort: false}
                /* ,{field: 'account', title: '賬號名',align:'center', width:'20%'}*/
                , {
                    field: 'email',
                    title: '賬戶登入電郵',
                    align: 'center',
                    width: '25%',
                    sort: false,
                    totalRow: true,
                    hide: false
                }
                , {field: 'status', title: '賬戶狀態', align: 'center', width: '25%'}
                , {fixed: 'right', title: '操作', width: '25%', align: 'center', toolbar: '#barDemo'}
            ]]
            , page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                , groups: 5 //只显示 1 个连续页码
                , first: '首页' //不显示首页
                , last: '尾页' //不显示尾页
                , elem: 'bottomPage'
            }
            , parseData: function (res, curr, count) {
                if (res.data != null) {
                    for (var i = 0; i < res.data.length; i++) {
                        var data = res.data[i];
                        if (data.status == 'Normal') {
                            data.status = "正常";
                        } else if (data.status == 'Disable') {
                            data.status = "停用";
                        }

                    }
                }
            }
            , response: {
                statusName: 'code' //规定数据状态的字段名称，默认：code
                , statusCode: 0 //规定成功的状态码，默认：0
                , msgName: 'msg' //规定状态信息的字段名称，默认：msg
                , countName: 'count' //规定数据总数的字段名称，默认：count
                , dataName: 'data' //规定数据列表的字段名称，默认：data
            }


        });

    }

    //监听头工具栏事件
    table.on('toolbar(user)', function (obj) {
        var checkStatus = table.checkStatus(obj.config.id)
            , data = checkStatus.data; //获取选中的数据
        switch (obj.event) {
            case 'add':
                layer.msg('添加');
                break;
            case 'update':
                if (data.length === 0) {
                    layer.msg('请选择一行');
                } else if (data.length > 1) {
                    layer.msg('只能同时编辑一个');
                } else {
                    layer.alert('编辑 [id]：' + checkStatus.data[0].id);
                }
                break;
            case 'delete':
                if (data.length === 0) {
                    layer.msg('请选择一行');
                } else {
                    layer.msg('删除');
                }
                break;
        }
        ;
    });

    //监听行工具事件
    table.on('tool(usertool)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data //获得当前行数据
        var accountid = data.accountid
        //編輯二級分類顯示一級分類
        var categorynamestr = data.categorynamestr


            , layEvent = obj.event; //获得 lay-event 对应的值
        if (layEvent === 'detail') {
            var newWeb = window.open('_blank');
            newWeb.location = '/usercontactmanage/toDetail?contactID=' + contactID

        } else if (layEvent === 'del') {
            layer.confirm('真的删除行么', function (index) {
                deleteObj(catagoryid, index, obj)

                //向服务端发送删除指令
            });
        } else if (layEvent === 'edit') {
            edit(accountid)

        }
    });
    $("#addCoinset").click(function () {
        form.render(addCoinset());
    })
    //执行一个轮播实例
    carousel.render({
        elem: '#test1'
        , width: '100%' //设置容器宽度
        , height: 200
        , arrow: 'none' //不显示箭头
        , anim: 'fade' //切换动画方式
    });


});


function deleteObj(catagoryid, index, obj) {
    $.ajax({
        url: "/infomationmanage/delCategory",
        data: {catagoryId: catagoryid},
        type: "GET",
        contentType: "application/json;charset=utf-8",
        success: function (res) {
            if (res.success == true) {
                obj.del(); //删除对应行（tr）的DOM结构
                layer.close(index);
                layer.msg('刪除成功');
            } else {
                layer.close(index);
                layer.msg('刪除失败');
            }

        }

    });

}

//參數驗證
function verify(companyid, email, status) {

    if (companyid == null || companyid == ''
        || companyid == undefined) {

        layer.msg('請選擇代理公司');
        return false;
    }

    /*if (account == null || account == '' || account == undefined) {

        layer.msg('賬號名不可為空');
        return false;
    }*/
    if (email == null || email == ''
        || email == undefined) {

        layer.msg('賬戶登入電郵不可為空');
        return false;
    }
    if (status == null || status == '' || status == undefined) {

        layer.msg('請選擇賬戶狀態');
        return false;
    }

    return true;
}

// 查看
var temp = 1;

function add() {

    var index = layer.open({
        type: 1

        , area: ['650px', '550px'] //宽高
        , title: " "
        , content: $("#storeValuePage")
        , btn: ['確定', '取消']
        , method: 'GET'
        , btnAlign: 'c'
        , maxmin: true
        , yes: function (index, layero) {
        	var indexfirst=index;
            var companyid = $("#catselect").val()
            var company = $("#catselect").find("option:selected").text();
            var companyen = $("#catselect").find("option:selected").attr("data-comen");
            if (companyid == null || companyid == ''
                || companyid == undefined) {

                layer.msg('請選擇代理公司');
                return;
            }
            var trs = $(".coinsetTr");
            if (trs.length <= 0) {
                layer.msg("請添加管理員賬戶");
                return;
            }
            var coinsets = new Array();
            var emails = new Array();
            for (var i = 0; i < trs.length; i++) {
                var $input = trs.eq(i).find("input");
                var coinset = {};

                var email = $input.eq(0).val();

                if (email == null || email == '') {
                    $input.eq(0).css("border-color", "red");
                    layer.msg("賬戶登入電郵不能為空！");
                    return;
                } else {
                    var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9-]{2,3}){1,2})$/;
                    if (!reg.test(email)) {
                        $input.eq(0).css("border-color", "red");
                        layer.msg("電郵格式錯誤");
                        return false;
                    } else {
                        $input.eq(0).css("border-color", "#D2D2D2");
                    }
                }
                emails.push(email);
                coinset["email"] = email;
                coinset["companyid"] = companyid;
                coinset["company"] = company;
                coinset["companyen"] = companyen;
                coinsets.push(coinset);
            }
            //判斷電郵是否重複

            var nary = emails.sort();
            for (var i = 0; i < nary.length - 1; i++) {
                if (nary[i] == nary[i + 1]) {
                    layer.msg("電郵[" + nary[i] + "]輸入重複");
                    return;
                }
            }
            //console.log(JSON.stringify(coinsets));
           
          
          
            var str='<div align="center" style="font-weight: bold">是否確定添加賬戶？</div>  <br/>'
            
            	layer.confirm(str, {title:' ',yes: function(index){
            	 
            	 layer.close(index);
            	
            	 layer.close(indexfirst);
            	 layer.msg('正在保存...',{time:5000});
          
            $.ajax({
                type: "GET",
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                contentType: "application/x-www-form-urlencoded;charset=utf-8",

                url: "/usercompanyaccount/addUserCompanyAccount",
                type: "POST",
                //url : "/coinset/saveCoinset",
                dataType: "json",
                data: JSON.stringify(coinsets),
                /* data:{

                  email:coinsets
                 },*/
                error: function (request) {
                
                    layer.msg('服務器異常...');
                },
                success: function (res) {
                
                    if (res.success) {
                        //const hint="<h5 align=\"center\">是否通過審核?</h5> <br/> <label >請通知相關人員前往賬戶郵箱查看初始密碼電郵</label>"
                        layer.close(index);
                        layer.confirm('<div align="center" style="font-weight: bold">賬戶添加成功</div> <br/> <label >請通知相關人員前往賬戶郵箱查看初始密碼電郵</label> <br/>', {
                            btn: [],
                            title: ' ',
                            end: function () {
                                location.reload();
                            }
                        });
                    } else if (res.repeat) {
                        layer.msg('新增失敗,賬戶登入電郵已存在');
                    } else {
                        layer.msg('新增失敗');
                    }


                }
            })
            
           
       
            	 },
            	 cancel: function(index, layero){ 
            		 
            	 layer.close(index);
            	 //reload();// 可以在这里刷新窗口
            	} 
            	});
            
            

        },
        btn2: function (index, layero) {
            $(".coinsetTr").remove();
           
            layer.close(index);

        }


    });


    $.ajax({
        url: "/usercompanyaccount/queryCompanyName",
        async: false,
        data: {categoryname: 'true'},
        type: "GET",
        contentType: "application/json;charset=utf-8",
        success: function (res) {
            var options = '<option value="">請選擇/輸入代理公司</option>';
            $.each(res, function (index, val) {
                
                options += "<option value='" + val.CompanyID + "'data-comen='" + val.CompanyNameEN + "'>" + val.CompanyName + "</option>";


            });

            $("#catselect").html(options);
            form.render();//初始化下拉框
        }

    });


}

//編輯
function edit(accountid) {

    var index = layer.open({
        type: 1
        //skin: 'layui-layer-rim', //加上边框
        , area: ['600px', '500px'] //宽高
        , title: " "
        , content: $("#editscore")
        , btn: ['確定', '取消']
        , method: 'GET'
        , btnAlign: 'c'
        , maxmin: true
        , yes: function (index, layero) {

            var companyid = $("#editselect").val()

            /*var account = $("#edaccount").val()*/
            var email = $("#edemail").val()
            var status = $("#edstatus").val()
            $.ajax({
                type: "POST",
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                //contentType : "application/json;charset=utf-8",
                url: "/usercompanyaccount/editUserCompanyAccount",
                data: {
                    accountid: accountid,
                    /* companyid:companyid,
                     account:account,
                   email:email,*/
                    status: status
                },
                error: function (request) {
                    layer.msg('系統異常');
                },
                success: function (res) {
                    if (res.success == true) {
                        layer.close(index);
                        location.reload();
                    } else {
                        layer.msg('修改失敗');
                    }


                }
            })


        },
        btn2: function (index, layero) {
            layer.close(index);

        }
    });


    $.ajax({
        url: "/usercompanyaccount/getUserCompanyAccount",
        async: false,
        data: {accountid: accountid},
        type: "GET",
        contentType: "application/json;charset=utf-8",
        success: function (res) {

            /*	$("#edaccount").val(res.UserCompanyAccount.account);*/
            if (res.UserCompanyAccount.email == null || res.UserCompanyAccount.email == '') {
                $("#edemail").html("/");
            } else {
                $("#edemail").html(res.UserCompanyAccount.email);
            }
            var companyname = res.UserCompanyAccount.companyname;
            var companynameen = res.UserCompanyAccount.companynameen;
            var companynamestr = null;
            if (companyname == null || companyname == '') {
                companyname = "/";
            }
            if (companynameen == null || companynameen == '') {
                companynameen = "/";
            }
            if (companynameen == "/" && companyname == "/") {
                companynamestr = "/"
            } else {
                companynamestr = companyname + companynameen
            }
            //$("#editselect").find("option[value='"+res.UserCompanyAccount.companyid.toString()+"']").prop("selected",true);
            $("#editselect").html(companyname + "&nbsp&nbsp" + companynameen)
            $("#edstatus").find("option[value='" + res.UserCompanyAccount.status + "']").prop("selected", true);

            form.render();


        }

    });


    $("#closePage").click(function () {

        layer.close(index);
    })

}

function checkEmail(obj) {
    if (obj != '') {
        /*	var trs = $(".coinsetTr");
            var coinsets = new Array();
            for (var i = 0; i < trs.length-1; i++) {
                var $input = trs.eq(i).find("input");
                var coinset = {};
                var email = $input.eq(0).val();

                if(email==obj){
                    layer.msg('您輸入的登入賬號電郵['+obj+']已存在，請重新輸入',{time:800});
                    return;
                }
            }*/

        $.ajax({
            type: "GET",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",

            url: "/usercompanyaccount/getUserCompanyAccount",
            data: {
                email: obj
            },
            error: function (request) {
                layer.msg('服務器異常...');
            },
            success: function (data) {
                if (data.UserCompanyAccount != null) {
                    layer.msg('賬戶登入電郵[' + obj + ']已存在，請重新輸入', {time: 2000});
                    return false;
                }
            }
        })

    }
}

function addCoinset() {
    var tr =
        '<tr class="coinsetTr">'
        + '<td><span class="red">*</span>賬戶登入電郵:</td>'
        + '<td><input type="tel" name="money' + temp + '"  autocomplete="off" class="layui-input" value=""  onmouseout="checkEmail(this.value)"></td>'

        + '<td>'
        + '<button class="layui-btn layui-btn-danger" onclick="delRow(this)">刪除</button>'
        + '</td>'
        + '</tr>'
    $("#coinsetTable").append(tr);
    temp = temp + 1;
}

function delRow(obj) {
    obj.parentElement.parentElement.remove();

}
