//JavaScript代码区域
$(function () {
    $.ajax({
        type : "POST",
        contentType : "application/x-www-form-urlencoded;charset=utf-8",
        url : "/admin/queryEmpno",
        success:function(data){
            $("#name").html(data.name);
            if(data.show===true){
                $("#lay-admin").show();
            }
        }
    })

})
layui.use('element', function(){
    var element = layui.element;

    var $fangpan = $("#fangpan");
    var $companya = $("#companya");
    var $information = $("#information");
    var $fangpanSession =  sessionStorage.getItem("fangpan");
    var $companyaSession =  sessionStorage.getItem("companya");
    var $informationSession =  sessionStorage.getItem("information");
    if($fangpanSession == "1"){
        $fangpan.addClass("layui-nav-itemed");
    }
    if($companyaSession == "1"){
        $companya.addClass("layui-nav-itemed");
    }
    if($informationSession == "1"){
        $information.addClass("layui-nav-itemed");
    }
    $("#fangpanUrl").click(function(){
        closeAndUnfold($fangpan,"fangpan");
    })
    $("#companyaUrl").click(function(){
        closeAndUnfold($companya,"companya");
    })
    $("#informationUrl").click(function(){
        closeAndUnfold($information,"information");
    })
});
//菜單欄展開和關閉方法
function closeAndUnfold(obj,value){
    var $session =  sessionStorage.getItem(value);
    if(obj.hasClass("layui-nav-itemed")){
        if($session == null){
            sessionStorage.setItem(value, "1");
            obj.addClass("layui-nav-itemed");
        }else if($session == "1"){
            obj.removeClass("layui-nav-itemed");
            sessionStorage.removeItem(value);
        }
    }else{
        obj.removeClass("layui-nav-itemed");
        //obj.find("dd").removeClass("layui-this");
        sessionStorage.removeItem(value);
    }
}

function logout() {
    $.ajax({
        url: "/logout",
        type : "GET",
        success:function () {
            window.location.href = "/redirect";
        }



    });

}
var flag = true;
function editPassword(){
    var inde = layer.open({
        type:1
        //skin: 'layui-layer-rim', //加上边框
        ,area: ['700px', '600px'] //宽高
        ,title:" "
        ,content: $("#editAccount")
        ,btn: ['確認', '取消']
        ,btnAlign: 'c'
        //,maxmin:true
        ,yes: function(index, layero){
            var flag=true;
            var pwd=$("#pwd").val().trim();
            var pwd1=$("#pwd1").val().trim();
            var pwd2=$("#pwd2").val().trim();
            $("#pwdLab").html('')
            $("#pwd1Lab").html('')
            $("#pwd2Lab").html('')
            if(pwd===''){
                $("#pwdLab").html("必須填寫")
                return;
            }
            if(pwd1===''){
                $("#pwd1Lab").html("必須填寫")
                return;
            }
            if(pwd2===''){
                $("#pwd2Lab").html("必須填寫")
                return;
            }
            if(pwd1!==pwd2){
                $("#pwd2Lab").html("新密碼與確認密碼不一致")
                return;
            }
            if(pwd2===pwd1){
                var regu = /^(?=.*\d)(?=.*[A-Za-z])[\x20-\x7e]{6,20}$/;
                var re = new RegExp(regu);
                if(!re.test(pwd1)){
                    $("#pwd1Lab").html("必須為6-20位英文數字組合")
                    return;
                }
            }
            $.ajax({
                type: "POST",
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                url: "/admin/checkoldPwd",
                async:false,
                data:  {password: pwd},
                success: function (data) {
                    if (data.valid === false) {
                        $("#pwdLab").html("原密碼錯誤");
                        flag = false;

                    }
                }
            });
            if(flag===false){
                return;
            }
            var cof=  layer.confirm(' <div align="center"><h3 style="margin-top: 10px">是否確認修改密碼？</h3></div> ',{
                btn: ['確認','取消'],
                title:'',
                btnAlign: 'c',
                area:['350px','150px'],
                yes:function () {
                    if(!flag){
                        return;
                    }
                    flag=false;
                    $.ajax({
                        type : "POST",
                        contentType : "application/x-www-form-urlencoded;charset=utf-8",
                        url : "/admin/editPassword",
                        data:{
                            employeeno:$("#name").html().trim(),
                            password:$("#pwd1").val(),
                        },
                        error:function(request){
                            layer.msg("失敗了");
                            flag = true;
                        },
                        success:function(data){
                            if(data.msg==="success"){
                                layer.close(inde)
                                 let rechargesucc =  layer.confirm(' <div align="center"><h3>賬號添加成功</h3>   <input type="button" class="layui-btn layui-btn-primary"  id="continue" onclick="continuemethod()" value="關閉"></input></div> ',{
                                    btn: [],
                                    title:'',
                                    area:['350px','150px']
                                });
                            }else{
                                layer.msg("出錯了")
                            }
                            flag = true;
                        }

                    })
                },
                btn2:function () {

                }
            });
            }
        ,
        btn2:function(index, layero){
            layer.close(index);
        },
        success:function () {
            $("#account").html($("#name").html().trim());
        },
        end:function(){

        }
    });
}