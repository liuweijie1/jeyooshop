layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function () {
    var form = layui.form
        , layer = layui.layer
        , laydate = layui.laydate;
    form.render();//初始化下拉框



})
//资料审核
/*function approval(approval,userid) {
    //页面层

    layer.open({
        title:"會員資料審核",
        type: 1,
        skin: 'layui-layer-rim', //加上边框
        area: ['420px', '240px'], //宽高
        content: $("#approval")
    });
}*/
//账号审核
function account(status,userid) {

alert(status)
}
//权重分值审核
function score(score,userid) {

    layer.open({
        title:"權重分值管理",
        type: 1,
        skin: 'layui-layer-rim', //加上边框
        area: ['420px', '240px'], //宽高
        content: '<div class="layui-card-body">\n' +
        '    <form class="layui-form" action="">\n' +
        '\n' +
        '        <div class="layui-form-item">\n' +
        '            <div class="layui-inline">\n' +
        '                <div class="layui-inline">\n' +
        '                    <label class="layui-form-label " >請輸入權重分值:</label>\n' +
        '                    <div class="layui-input-inline">\n' +
        '                        <!-- <label class="layui-form-label layui-label-width" >會員編號:</label> -->\n' +
        '                        <input type="tel" name="phone" autocomplete="off" class="layui-input ">\n' +
        '                    </div>\n' +
        '                </div>\n' +
        '    <div class="layui-btn-container">\n' +
        '        <input type="button" value="確定" class="layui-btn">\n' +
        '        <input type="button" value="取消" class="layui-btn layui-btn-danger">\n' +
        '    </div>\n' +
        '            </div>\n' +
        '        </div>\n' +
        '</div>'
    });


}

$("#approvalBtn").click(function () {
    alert("觸發")
    var userid = $("#userid").val();
    $.ajax({
        url: "/check/approval",
        type: "GET",
        data: {userid: userid, approvalstatus: "PassApproval"},
        success:function (res) {
            if (res=="success"){
                window.reload();
            }else{
                alert("修改失敗");
            }


        }
    });
}
