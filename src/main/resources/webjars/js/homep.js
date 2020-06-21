$(function () {
    $.ajax({
        type:"POST",
        url:"../servletTest.mvc/acount.mvc",
        success:function (val) {
            var c  = document.getElementById("count");
            var da  = document.getElementById("da");
            c.innerText = val.count;
            da.innerText = val.data;
        }
    })
    $("#p1,#p2,#p3,#p4,#p5,#p6").click(function () {
        $.ajax({
            type: "post",
            url:"../servletTest.mvc/register.mvc",
            data:{
                "s_point":this.id
            },
            success:function (data) {
                window.location='../../templates/customInfo.jsp';
            }
        })
    })
})