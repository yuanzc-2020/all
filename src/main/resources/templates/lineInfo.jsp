<%--
  Created by IntelliJ IDEA.
  User: Royal
  Date: 2020/1/6
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>旅游资讯</title>
    <script src="../js/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../bootstrap-4.4.1-dist/css/bootstrap.min.css">
    <script src="../bootstrap-4.4.1-dist/js/bootstrap.min.js"></script>
    <script src="../bootstrap-4.4.1-dist/js/bootstrap.bundle.js"></script>
    <style>
        #demo{
            width: 20%;
            height: 1000px;
            position: absolute;
        }
        #tab{
            width: 80%;
            height: 1000px;
            position: absolute;
            left: 20%;
        }
        #infomation{

            width:300px;
            height:300px;

            border-radius: 10px;
        }
        #country{
            width:100%;
            height:50px;
        }
        #provience{
            width:100%;
            height:auto;

        }

    </style>
</head>
<body>
<script>

    $(function () {
        let linetab = document.getElementById("linetab");
        $.ajax({
            type:"post",
            url:"../servletTest.mvc/getline.mvc",
            data:{

            },
            success:function (data) {
                for ( i = 0;i<10&&i<data.length;i++){
                    let tt = linetab.rows.length;
                    let tr = linetab.insertRow(tt);
                    tr.insertCell(0).innerText = i+1;
                    tr.insertCell(1).innerText = data[i].out_date;
                    let cell2 =  tr.insertCell(2);
                    cell2.innerText = data[i].group_id;
                    tr.insertCell(3).innerText = data[i].price;
                    tr.insertCell(4).innerText = data[i].estimate_num;
                    tr.insertCell(5).innerText = data[i].adult;
                    tr.insertCell(6).innerText = data[i].old;
                    tr.insertCell(7).innerText = data[i].children;
                    tr.insertCell(8).innerText = data[i].baby;
                    tr.insertCell(9).innerText = data[i].over_time;


                    let detal = document.createElement("span");
                    detal.innerText = data[i].detailed;
                    detal.id = i +1000;
                    detal.onclick = function () {
                        $("#infomation").toggle();
                        $.ajax({
                            url:"../servletTest.mvc/getInfo.mvc",
                            type:"post",
                            data:{
                                "g_id":cell2.innerText
                            },
                            success:function (data) {
                                var infomation = document.getElementById("infomation");
                                infomation.innerText = data.info;
                                infomation.style.position = "absolute";
                                infomation.style.left = "50%";
                                infomation.style.top = "18%";
                                infomation.style.border = "2px solid blue";
                                infomation.style.background = "#7abaff";

                            }
                        })
                    };
                    tr.insertCell(10).appendChild(detal);

                    let er = document.createElement("input");
                    er.name="number1";
                    er.id = i+10000;
                    er.type = "button";
                    er.value = "报名";
                    er.onclick = function () {
                        $.ajax({
                            url:"../servletTest.mvc/sendMessage.mvc",
                            type:"post",
                            data:{
                                "g_id":cell2.innerText
                            },
                            success:function (data) {
                                window.location='customInfo.jsp';
                            }
                        })
                    };
                    er.style.width="60px";
                    er.style.height="40px";
                    tr.insertCell(11).appendChild(er);
                }

            }
        })
    })
    $(function () {
        $.ajax({
            type: "post",
            url: "../servletTest.mvc/getPage.mvc",
            success: function (data) {
                let x = parseInt(data);

                for (var i = x-1; i >0; i--) {
                    var opchange = document.getElementById("pageDemo");
                    var pageone = document.getElementById("1");
                    var page = document.createElement("input");
                    page.id = i + 1;
                    page.type = "button";
                    page.value = i + 1;
                    //opchange.appendChild(page);
                    $("#1").after(page);
                }
            }
        })
    })
    var recentpage = 1;
    setTimeout(function(){
        $('body').on('click','center>input',function(){

            let table1 = document.getElementById("linetab");
            let id = $(this).attr("id");
            id = parseInt(id);
            if ( id != 0 && id != 2020) {
                recentpage = id;
            }
            if (id == 0 && recentpage >1) {
                    recentpage = recentpage-1;
            }
            if(id == 2020 && recentpage+1 < 5){
                    recentpage = recentpage+1;
            }
                $("#table1 tr:not(:first)").remove();
                $.ajax({
                    url: "../servletTest.mvc/otherPage.mvc",
                    type: "POST",
                    data: {
                        "page": recentpage,
                    },
                    success: function (data) {
                        for (var q = table1.rows.length; q > 1; q--) {
                            table1.deleteRow(q - 1);
                        }
                        for (var i = 0; i < data.length; i++) {
                            let tt = table1.rows.length;
                            let tr = table1.insertRow(tt);
                            tr.insertCell(0).innerText = (recentpage-1)*10+i+1;
                            tr.insertCell(1).innerText = data[i].out_date;
                            let cell2 =  tr.insertCell(2);
                            cell2.innerText = data[i].group_id;
                            tr.insertCell(3).innerText = data[i].price;
                            tr.insertCell(4).innerText = data[i].estimate_num;
                            tr.insertCell(5).innerText = data[i].adult;
                            tr.insertCell(6).innerText = data[i].old;
                            tr.insertCell(7).innerText = data[i].children;
                            tr.insertCell(8).innerText = data[i].baby;
                            tr.insertCell(9).innerText = data[i].over_time;

                            let detal = document.createElement("span");
                            detal.innerText = data[i].detailed;
                            detal.id = i +1000;
                            detal.onclick =function () {
                                $("#infomation").toggle();
                                $.ajax({
                                    url:"../servletTest.mvc/getInfo.mvc",
                                    type:"post",
                                    data:{
                                        "g_id":cell2.innerText,
                                    },
                                    success:function (data) {
                                        var infomation = document.getElementById("infomation");
                                        infomation.innerHTML = data.info;
                                        infomation.style.position = "absolute";
                                        infomation.style.left = "50%";
                                        infomation.style.top = "18%";
                                        infomation.style.border = "2px solid blue";
                                        infomation.style.background = "#7abaff";

                                    }
                                })
                            };
                            tr.insertCell(10).appendChild(detal);
                            let er = document.createElement("input");
                            er.name="number1";
                            er.id = i+10000;
                            er.type = "button";
                            er.value = "报名";
                            er.onclick=function () {
                                $.ajax({
                                    url:"../servletTest.mvc/sendMessage.mvc",
                                    type:"post",
                                    data:{
                                        "g_id":cell2.innerText,
                                    },
                                    success:function (data) {
                                        window.location='customInfo.jsp';
                                    }
                                })
                            } ;
                            er.style.width="60px";
                            er.style.height="40px";
                            tr.insertCell(11).appendChild(er);
                        }
                    }
                });
            })
    },500);
    $(function () {
        $.ajax({
            type: "post",
            url: "../servletTest.mvc/getAllCountry.mvc",
            success: function (data) {
                let x = parseInt(data.length);

                for (var i = 0; i < x; i++) {

                    let page = document.createElement("option");
                    page.id = i + 1406014;
                    page.value = i+1;
                    page.innerText = data[i].c_name;

                    $("#1406013").after(page);
                }
            }
        })
        $("#country").change(function () {
            $.ajax({
                type: "post",
                url: "../servletTest.mvc/getCountry.mvc",
                data:{
                    "id":this.value
                },
                success: function (data) {
                    $('#provience option').not('option:first').remove();
                    let x = parseInt(data.length);

                    let linetab = document.getElementById("linetab");
                    var countp = [];
                    for(var i = 0; i < x; i++){
                        countp.push(data[i].p_name);
                    }

                    for (var i = 0; i < countp.length; i++) {
                        for (var j = i + 1; j < countp.length; j++) {
                            if (countp[i] == countp[j]) {
                                countp.splice(j, 1);
                                j--;
                            }
                        }
                    }

                    $("#provience")[0].size = countp.length;
                    for (var i = 0; i < countp.length; i++) {
                        let page = document.createElement("option");
                        page.id = i + 1950;
                        page.value = i+101;
                        page.innerText =countp[i];
                        $("#1949").after(page);
                    }
                    for (var q = linetab.rows.length; q > 1; q--) {
                        linetab.deleteRow(q - 1);
                    }
                    for (var i = 0; i < data.length; i++) {
                        let tt = linetab.rows.length;
                        let tr = linetab.insertRow(tt);
                        tr.insertCell(0).innerText = i+1;
                        tr.insertCell(1).innerText = data[i].out_date;
                        let cell2 =  tr.insertCell(2);
                        cell2.innerText = data[i].group_id;
                        tr.insertCell(3).innerText = data[i].price;
                        tr.insertCell(4).innerText = data[i].estimate_num;
                        tr.insertCell(5).innerText = data[i].adult;
                        tr.insertCell(6).innerText = data[i].old;
                        tr.insertCell(7).innerText = data[i].children;
                        tr.insertCell(8).innerText = data[i].baby;
                        tr.insertCell(9).innerText = data[i].over_time;

                        let detal = document.createElement("span");
                        detal.innerText = data[i].detailed;
                        detal.id = i +1000;
                        detal.onclick =function () {
                            $("#infomation").toggle();
                            $.ajax({
                                url:"../servletTest.mvc/getInfo.mvc",
                                type:"post",
                                data:{
                                    "g_id":cell2.innerText,
                                },
                                success:function (data) {
                                    var infomation = document.getElementById("infomation");
                                    infomation.innerHTML = data.info;
                                    infomation.style.position = "absolute";
                                    infomation.style.left = "50%";
                                    infomation.style.top = "18%";
                                    infomation.style.border = "2px solid blue";
                                    infomation.style.background = "#7abaff";
                                }
                            })
                        };
                        tr.insertCell(10).appendChild(detal);

                        let er = document.createElement("input");
                        er.name="number1";
                        er.id = i+10000;
                        er.type = "button";
                        er.value = "报名";
                        er.onclick=function () {
                            $.ajax({
                                url:"../servletTest.mvc/sendMessage.mvc",
                                type:"post",
                                data:{
                                    "g_id":cell2.innerText,
                                },
                                success:function (data) {
                                    window.location='customInfo.jsp';
                                }
                            })
                        } ;
                        er.style.width="60px";
                        er.style.height="40px";
                        tr.insertCell(11).appendChild(er);
                    }

                }
            })
        })
        $("#provience").click(function () {
            $.ajax({
                type: "post",
                url: "../servletTest.mvc/getProvience.mvc",
                data:{
                    "id":this.value
                },
                success: function (data) {
                    let linetab = document.getElementById("linetab");
                    for (var q = linetab.rows.length; q > 1; q--) {
                        linetab.deleteRow(q - 1);
                    }
                    for (var i = 0; i < data.length; i++) {
                        let tt = linetab.rows.length;
                        let tr = linetab.insertRow(tt);
                        tr.insertCell(0).innerText = i+1;
                        tr.insertCell(1).innerText = data[i].out_date;
                        let cell2 =  tr.insertCell(2);
                        cell2.innerText = data[i].group_id;
                        tr.insertCell(3).innerText = data[i].price;
                        tr.insertCell(4).innerText = data[i].estimate_num;
                        tr.insertCell(5).innerText = data[i].adult;
                        tr.insertCell(6).innerText = data[i].old;
                        tr.insertCell(7).innerText = data[i].children;
                        tr.insertCell(8).innerText = data[i].baby;
                        tr.insertCell(9).innerText = data[i].over_time;

                        let detal = document.createElement("span");
                        detal.innerText = data[i].detailed;
                        detal.id = i +1000;
                        detal.onclick =function () {
                            $("#infomation").toggle();
                            $.ajax({
                                url:"../servletTest.mvc/getInfo.mvc",
                                type:"post",
                                data:{
                                    "g_id":cell2.innerText,
                                },
                                success:function (data) {
                                    var infomation = document.getElementById("infomation");
                                    infomation.innerHTML = data.info;
                                    infomation.style.position = "absolute";
                                    infomation.style.left = "50%";
                                    infomation.style.top = "18%";
                                    infomation.style.border = "2px solid blue";
                                    infomation.style.background = "#7abaff";
                                }
                            })
                        };
                        tr.insertCell(10).appendChild(detal);

                        let er = document.createElement("input");
                        er.name="number1";
                        er.id = i+10000;
                        er.type = "button";
                        er.value = "报名";
                        er.onclick=function () {
                            $.ajax({
                                url:"../servletTest.mvc/sendMessage.mvc",
                                type:"post",
                                data:{
                                    "g_id":cell2.innerText,
                                },
                                success:function (data) {
                                    window.location='customInfo.jsp';
                                }
                            })
                        } ;
                        er.style.width="60px";
                        er.style.height="40px";
                        tr.insertCell(11).appendChild(er);
                    }
                }
            })
        })
        $("#sousou").click(function () {
            let keyword = document.getElementById("keyword");
            $.ajax({
                type: "post",
                url: "../servletTest.mvc/whereLike.mvc",
                data:{
                    "val":keyword.value
                },
                success: function (data) {
                    let linetab = document.getElementById("linetab");
                    for (var q = linetab.rows.length; q > 1; q--) {
                        linetab.deleteRow(q - 1);
                    }
                    for (var i = 0; i < data.length&&i<10; i++) {
                        let tt = linetab.rows.length;
                        let tr = linetab.insertRow(tt);
                        tr.insertCell(0).innerText = i+1;
                        tr.insertCell(1).innerText = data[i].out_date;
                        let cell2 =  tr.insertCell(2);
                        cell2.innerText = data[i].group_id;
                        tr.insertCell(3).innerText = data[i].price;
                        tr.insertCell(4).innerText = data[i].estimate_num;
                        tr.insertCell(5).innerText = data[i].adult;
                        tr.insertCell(6).innerText = data[i].old;
                        tr.insertCell(7).innerText = data[i].children;
                        tr.insertCell(8).innerText = data[i].baby;
                        tr.insertCell(9).innerText = data[i].over_time;

                        let detal = document.createElement("span");
                        detal.innerText = data[i].detailed;
                        detal.id = i +1000;
                        detal.onclick =function () {
                            $("#infomation").toggle();
                            $.ajax({
                                url:"../servletTest.mvc/getInfo.mvc",
                                type:"post",
                                data:{
                                    "g_id":cell2.innerText,
                                },
                                success:function (data) {
                                    var infomation = document.getElementById("infomation");
                                    infomation.innerHTML = data.info;
                                    infomation.style.position = "absolute";
                                    infomation.style.left = "50%";
                                    infomation.style.top = "18%";
                                    infomation.style.border = "2px solid blue";
                                    infomation.style.background = "#7abaff";
                                }
                            })
                        };
                        tr.insertCell(10).appendChild(detal);

                        let er = document.createElement("input");
                        er.name="number1";
                        er.id = i+10000;
                        er.type = "button";
                        er.value = "报名";
                        er.onclick=function () {
                            $.ajax({
                                url:"../servletTest.mvc/sendMessage.mvc",
                                type:"post",
                                data:{
                                    "g_id":cell2.innerText,
                                },
                                success:function (data) {
                                    window.location='customInfo.jsp';
                                }
                            })
                        } ;
                        er.style.width="60px";
                        er.style.height="40px";
                        tr.insertCell(11).appendChild(er);
                    }
                }
            })
        })

    })
</script>
        <div id="demo">按国家搜索<br>
            <select id="country" >
                <option id="1406013" value="0">国家</option>
            </select><br>
            <select id="provience">
                <option id="1949" value="0">省份</option>
            </select>
        </div>
        <div id="tab">
            关键字：<input type="text" placeholder="请输入关键字" id="keyword"><input type="button" id="sousou" value="提交">
            <table id="linetab" border="1px" cellspacing="0px" cellpadding="16px">
                <tr>
                    <td>序号</td>
                    <td>出团日期</td>
                    <td>团期编号</td>
                    <td>单价</td>
                    <td>预收人数</td>
                    <td>成人</td>
                    <td>老人</td>
                    <td>儿童</td>
                    <td>婴儿</td>
                    <td>报名结束时间</td>
                    <td>详细</td>
                    <td>选择</td>
                </tr>
            </table>
            <center id="pageDemo"><input type="button" value="上一页" id = "0">
                <input type="button" id="1" value="1">
                <input type="button" value="下一页" id="2020"></center>
        </div>
                    <div id="infomation"></div>
</body>
</html>
