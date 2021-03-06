

 
$(function () {
	

    $("#scroll_sort,#scroll_food").height($("body").height()-89);
    calcStartPrice();
    /*商品页面滑动*/
    sortIScroll = new IScroll("#scroll_sort",{
        disableMouse:true,
        disablePointer:true,
        scrollbars:false
    });
    foodIScroll = new IScroll("#scroll_food",{
        disableMouse:true,
        disablePointer:true,
        scrollbars:false,
        fadeScrollbars:false
    });
    foodIScroll.on("scrollEnd", function(){
        var r = foodIScroll.y, i = 0, s = 0;
        $("#scroll_food").find(".foodlist_box").each(function() {
            var e = $(this);
            i += e.height();
            if (i > Math.abs(r)){
                return s = $("#scroll_food").find(".foodlist_box").index(e),!1
            }
        });
        $("#scroll_sort").find(".foodsort").removeClass("hover").eq(s).addClass("hover");
        sortIScroll.scrollToElement($("#scroll_sort").find(".foodsort").eq(s)[0],0);
        showFood();
    });

    $('#foot_goods a').addClass('hover');

    /*切换到店外卖模式*/
    if($("#restype_ul li").length==1){
        var thisType=$("#restype_ul li").attr("rel");
        onlyType("#type"+thisType);
    }else{
        var type = localStorage.getItem("dataType");
        if(!type){
            type = 2;
        }
        onlyType("#type"+type);
    }
    var tablemsg =getCookie("from_table");
    if(tablemsg){
        localStorage.setItem("dataType",1);

        $("#type2").hide();
        $("#type1").css({borderRadius:"18px"}).addClass("hover");
    }
    /*如果该分类下没有商品则隐藏分类*/
    $(".foodlist_label_no").each(function (){
        $(this).hide().next("ul").hide();
        var tagid = $(this).parent().data("tagid");
        $("#food_sort").find($("#sort_"+tagid)).hide();
    });
    foodIScroll.refresh();
    sortIScroll.refresh();
  /*  getSpecialList();*/
  /*  $.showLoading("正在付款",10000);*/
 
  
    
    
    
});


window.onload=function(){
  
 
    	$("#temppage").hide();
        $("#shoppage").show();
 
     
        var mySwiper = new Swiper ('.swiper-container', {
          // 滚动方向 horizontal/vertical
        direction: 'horizontal',
        // 自动播放
        autoplay:3000,
        // 是否循环播放
        loop: true,
        // 如果需要分页器（小圆点）
        // 是否需要分页器
        pagination: '.swiper-pagination',
        // 点击分页器是否切换到对应的图片 是 true 否 false
        paginationClickable:true,

        // 如果需要前进后退按钮
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',

         // 用户操作swiper之后，是否禁止autoplay。默认为true：停止。
        // 如果设置为false，用户操作swiper之后自动切换不会停止，每次都会重新启动autoplay。
        // 操作包括触碰，拖动，点击pagination等。
        autoplayDisableOnInteraction:false,
      })  

}
/*
var t_img; // 定时器
var isLoad = true; // 控制变量

// 判断图片加载状况，加载完成后回调
isImgLoad(function(){
    // 加载完成
	$("#temppage").hide();
    $("#shoppage").show();
});

// 判断图片加载的函数
function isImgLoad(callback){
    // 注意我的图片类名都是cover，因为我只需要处理cover。其它图片可以不管。
    // 查找所有封面图，迭代处理
    $('img').each(function(){
        // 找到为0就将isLoad设为false，并退出each
        if(this.height === 0){
            isLoad = false;
            return false;
        }
    });
    // 为true，没有发现为0的。加载完毕
    if(isLoad){
        clearTimeout(t_img); // 清除定时器
        // 回调函数
        callback();
    // 为false，因为找到了没有加载完成的图，将调用定时器递归
    }else{
        isLoad = true;
        t_img = setTimeout(function(){
            isImgLoad(callback); // 递归扫描
        },500); // 我这里设置的是500毫秒就扫描一次，可以自己调整
    }
}*/

/*获取特价商品列表*/
/*function getSpecialList(){
    $.ajax({
        url:'common/promotion/getStartedPromotions',
        type:'GET',
        data:{res_id:$('body').data('res_id')},
        success:function(data){
            if(data.code == 100 && data.data){
                var notNull = false,
                    showFlag = false;  //限时限量显示标记
                for(var i in data.data){
                    notNull = true;
                    // 处理未开始
                    if(data.data[i].status == 0){
                        data.data[i].sub_time = data.data[i].distance_time;
                    }
                    if(data.data[i].status == 0 || data.data[i].status == 2){
                        showFlag = true;
                    }
                    // 删除已过期的
                    if(data.data[i].sub_time < 0){
                     $('#food_price_num_'+data.data[i].food_id).text(data.data[i].native_price);
                     delete data.data[i];
                     continue;
                     }
                    if(parseInt(data.data[i].promotion_count) <= parseInt(data.data[i].seller_count)){
                        $('#food_'+data.data[i].food_id+' .img_list_price').html('<div class="img_plus sale_over">'+jsLangChange("完")+'</div>');
                    }
                }
                if(showFlag){
                    $('#sort_rush').show().addClass('hover').siblings().removeClass('hover');
                    $('#foodlist_rush').show();
                }
                var tmp = template('promotionTemplate', data);
                $('#special_list').html(tmp);
                if(notNull){
                    $('#special_list').find("li.rush_list").each(function () {
                        var that=$(this);
                        if(that.data("status")==0 || that.data("status")==2){
                            var fid=that.data("food_id");
                            $("li.food_"+fid).remove();
                        }
                    });
                    if(localStorage.getItem("dataType")!=1){
                        $("li.isnotaway").hide();
                    }
                }
                var timer = setInterval(function () {
                    $('#special_list .dish_time').each(function () {
                        var that=$(this);
                        var subTime = parseInt(that.data('end_time')),
                            d=parseInt(subTime/86400),
                            h=parseInt(subTime%86400/3600),
                            m=parseInt(subTime%86400%3600/60),
                            s=subTime%86400%3600%60;
                        d = d<10?'0'+d:d;
                        h = h<10?'0'+h:h;
                        m = m<10?'0'+m:m;
                        s = s<10?'0'+s:s;
                        subTime--;
                        that.data('end_time',subTime);
                        if(subTime > 0){
                            that.find('.days').text(d);
                            that.find('.hours').text(h);
                            that.find('.minutes').text(m);
                            that.find('.seconds').text(s);
                        } else if(subTime==0) {
                            // 未开始的商品倒计时至0时，则刷新页面
                            if(that.data('status') == 0){
                                setTimeout(function(){window.location.reload();},2000);
                            } else {
                                //已经开始的商品，倒计时至0时，则过期
                                //特价商品 时间到期时 要恢复特价商品价格 同时修改购物车价格,先让后台回复价格
                                $.ajax({
                                    url:'/common/Promotion/recoverPromotionPrice',
                                    type:'POST',
                                    data:{id:that.data('prom_id')},
                                    success:function (data) {
                                        if (data.code != 100) {
                                            clearpop(data.message);
                                            return;
                                        }
                                        // 页面上商品价格显示的地方回复原价
                                        $('#food_price_num_' + that.data('id')).text(that.data('native_price'));
                                        // 页面上商品添加/减少购物车按钮上价格数据恢复原价
                                        $('#addcart_btn_' + that.data('id')).data('foodprice', that.data('native_price'));
                                        $('#cutcart_btn_' + that.data('id')).data('foodprice', that.data('native_price'));
                                        var nums = $('#' + that.data('id') + '_amount_num_promotion').text();
                                        // 循环删除购物车
                                        for (var i = 0; i < nums; i++) {
                                            that.closest('li').find('.img_cut').trigger('touchstart');
                                        }
                                        // 删除页面上的过期商品dom
                                        that.closest('li').remove();
                                    }
                                });
                            }
                        }
                        that.find('.time_display').show();
                    });
                }, 1000);
                res_init();
            } else {
                $('#foodlist_rush').hide();
            }
        }
    });
}*/

function onlyType(obj){
    var object = $(obj),
        currentRel = object.attr("rel"),
        preType = localStorage.getItem('dataType'); //切换按钮前的状态
    localStorage.setItem("dataType", currentRel); //切换按钮后的状态

    if(currentRel==2){ // 切换到外卖，可能存在不能点的菜
        var key = "myfoodArr", myfood = $.cookie(key),existOrder = false;
        if(myfood){
            existOrder = true;
        }
        if(existOrder){
            if(preType != 2 && $("#restype_ul li").length==2){  //说明是从堂吃切换到外卖
                if(confirm(jsLangChange('切换将清空购物车？'))){
                    $.cookie(key, "", {"path":"/"});
                    $("#food_car").hide();
                    existOrder = false;
                    $("li.isnotaway").hide();
                    $("div.isnum").hide();
                    emptyCars();
                }else{
                    localStorage.setItem("dataType", 1);
                    return ;
                }
            }
        }else{
            $("li.isnotaway").hide();
        }
        $("li.isnotaway").hide();
    }else{
        $("li.isnotaway").show();
        recoveryBalanceBtn();
    }
    if(!object.hasClass("hover")){
        object.addClass("hover").siblings().removeClass("hover");
    }
    foodIScroll.refresh();
}

$(".foodsort").on("touchstart",function(){
    var sortId = $(this).data("sortid");
    $(this).addClass("hover").siblings().removeClass("hover");
    $("#nogood").hide();
    $(".foodlist_label, .foodlist_box li").show(); /*执行搜索后，再点分类，需全部显示菜品*/
    //判断是否隐藏非外卖的菜品
    var typeaway = localStorage.getItem('dataType');
    if(typeaway==2){
        $(".isnotaway").hide();
    }else{
        $(".isnotaway").show();
    }
    foodIScroll.refresh();
    foodIScroll.scrollToElement("#foodlist"+sortId,0);
    showFood();
});

$("#food_search").click(function(){
    if($("#foot_search_box").css("display")=="none"){
        $("#food_sort li").removeClass("hover");
        $("#foot_search_box").show();
        $("#foot_search_input").focus();
    }else{
        $("#foot_search_box").hide();
        $(".foodlist_label,.foodlist_box li").show();
        foodIScroll.refresh();
    }
});
/*显示商品--unveil(),延迟加载商品图片  提高网页性能*/
function showFood(){
    $("#food_img_list img").unveil();
    $("#scroll_food").scroll(function(){
        $("#food_img_list img").unveil();
    });
}
//搜索菜品
function findGood(){
    var good_name = $("#foot_search_input").val();
    if(good_name){
        $("#food_img_list li,.foodlist_label").hide();
        $(".food_img_name").each(function(){
            if($(this).text().indexOf(good_name)>=0){
                $(this).parent().parent().show();
            }
        });
        if($(".foodlist_box li:visible").length == 0){
            $("#nogood").show();
        }else{
            $("#nogood").hide();
        }
        foodIScroll.refresh();
    }else{
        $("#food_img_list li,.foodlist_label").show();
    }
    $("#foot_search_input").val("");
    $("#foot_search_box").hide();
}

//外卖弹出菜品图片
function food_img(obj){
    var name = $(obj).attr("alt"),
        img = $(obj).data("src"),
        des = $(obj).attr("des"),
        rel = $(obj).data("rel"),
        tag = typeof(rel)!="undefined",
        foodImgPath = $("#food_img_path"),
        food_id = $(obj).data('food');
    if(tag){
        foodImgPath.width("100%").height("80%").attr("src","").attr("src",rel);
    }else{
        foodImgPath.width("100%").height("100%").attr("src","").attr("src",img);
        foodImgPath.css("object-fit","cover")
    }
    $("#cainame").html(name);
    if(des!=null && des!=''){
        des = "商品描述</br>&nbsp;&nbsp;&nbsp;&nbsp;"+des;
        $("#food_desc").html("").html(des);
    }else{
        $("#food_desc").html("");
    }
   /* if(food_id*1 > 0){
        $.ajax({
            url:'wap/index/getFoodDetail',
            data:{food_id:food_id},
            type:'GET',
            success:function(res){
                if(res['code'] == 100){
                    $("#food_desc").append(res['data']);
                    setTimeout(function(){
                        popshow("#food_img");
                    },300);
                }
            },
            fail:function(){}
        })
    }*/
    setTimeout(function(){
        popshow("#food_img");
    },300);
   /* $(".img_list_price_box").html($(obj).parent().parent().find(".img_list_price").html());*/
   $(".food_price_dilog").html('¥'+$(obj).parent().parent().find('span[id^=food_price_num_]').html())
    
   
    shareqq_config = {
        url:location.href,
        showcount:'0', /*是否显示分享总数,显示：'1'，不显示：'0' */
        summary:des,   /*分享摘要(可选)*/
        title:name, /*分享标题(可选)*/
        pics:img, /*分享图片的路径(可选)*/
        site:location.href,
        style:'203'
    };
    shareSina_config = {
        url:location.href,
        title:name,
        pic:img
    };
}