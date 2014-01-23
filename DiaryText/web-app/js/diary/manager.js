/**
 * Created by IntelliJ IDEA.
 * User: xpyan
 * Date: 12-4-16
 * Time: 下午4:46
 * To change this template use File | Settings | File Templates.
 */



$(function () {

    $("form :input").blur(function(){
        if($(this).is("[name='userName']")){
        var userName = $(this).val();
        $("input[name='userName']~span").remove();
        if (userName.length < 3 || userName.length > 18) {
            $(this).after("<span class='error'>请输入长度在3-18之间的用户名</span>")
        } else {
            //检测用户是否已存在
            $.post("/DiaryText/user/checkUserName", {userName:userName}, function (data) {
                alert("hello");
                $("input[name='userName']").after(data);
            })
        }
        }

        if($(this).is("[name='password']")){
            var password = $(this).val()


            $("input[name='password']~span").remove();
            if (password.length < 3 || password.length > 18) {
                $(this).after("<span class='error'>请输入长度在3-18位之间的密码</span>");
            }
        }


        if($(this).is("[name='e_mail']")){
            var email = $(this).val();
            $("input[name='e_mail']~span").remove();
            if (!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(email)) {
                $("input[name='e_mail']").after("<span class='error'>邮箱格式不正确</span>");
            } else {
                //alert("ajax");
                $.ajax({
                    url:"/Eopoosp/user/checkEmail", //响应到那个处理 对应到controller的函数
                    data:"e_mail=" + email,
                    cache:false,
                    success:function (html) {
                        $("input[name='e_mail']").after(html);
                    }
                });
            }
        }



        if($(this).is("[name='cellphone']")){
            var cellphone = $(this).val();

            $("input[name='cellphone']~span").remove();
            if (!/(^((\(\d{3}\))|(\d{3}\-))?(13[0-9]\d{8}|15[89]\d{8})$)/.test(cellphone)) {
                $(this).after("<span class='error'>请输入您常用的手机号码</span>");
            }
        }

    });

//    $("input[name='userName']").blur(function () {
//        var userName = $(this).val();
//
//        $("input[name='userName']~span").remove();
//        if (userName.length < 6 || userName.length > 18) {
//            $(this).after("<span class='error'>请输入长度在6-18之间的用户名</span>")
//        } else {
//            //检测用户是否已存在
//            $.get("/Eopoosp/user/checkUserName", {userName:userName}, function (data) {
//                $("input[name='userName']").after("<span class='error'>" + data + "</span>");
//            })
//        }
//
//    });

//    $("input[name='password']").blur(
//        function checkPassword() {
//            var password = $(this).val()
//
//
//            $("input[name='password']~span").remove();
//            if (password.length < 6 || password.length > 18) {
//                $(this).after("<span class='error'>请输入长度在6-18位之间的密码</span>");
//
//            }
//
//        });

//
//    $("input[name='e_mail']").blur(function () {
//        var email = $(this).val();
//        $("input[name='e_mail']~span").remove();
//        if (!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(email)) {
//            $("input[name='e_mail']").after("<span class='error'>邮箱格式不正确</span>");
//        } else {
//            //alert("ajax");
//            $.ajax({
//                url:"/Eopoosp/user/checkEmail", //响应到那个处理 对应到controller的函数
//                data:"e_mail=" + email,
//                cache:false,
//                success:function (html) {
//                    $("input[name='e_mail']").after("<span class='error'>" + html + "</span>");
//                }
//            });
//        }
//
//
//    });
//
//    $("input[name='cellphone']").blur(function () {
//            var cellphone = $(this).val();
//
//            $("input[name='cellphone']~span").remove();
//            if (!/(^((\(\d{3}\))|(\d{3}\-))?(13[0-9]\d{8}|15[89]\d{8})$)/.test(cellphone)) {
//                $(this).after("<span class='error'>请输入您常用的手机号码</span>");
//            }
//        }
//    );

    $("input#submit").click(function(){

        $("form :input").trigger("blur");
        var numError = $("span.error").length;

        if(numError){
            return false;
        }
    });



});






