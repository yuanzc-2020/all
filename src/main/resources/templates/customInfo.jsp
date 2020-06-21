<%@ page  contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <script src="../js/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../bootstrap-4.4.1-dist/css/bootstrap.min.css">
    <script src="../bootstrap-4.4.1-dist/js/bootstrap.min.js"></script>
    <script src="../bootstrap-4.4.1-dist/js/bootstrap.bundle.js"></script>
    <script src="../js/qrcode.js"></script>
    <style>
        *{
            margin: 0px;
            padding: 0px;
        }
        #long{
            width: 100%;
            height: 100px;
            float: left;
        }
        #yuan{
            width: 100%;
            height: 800px;
            float: left;
        }
        #qrcode{
            width: 96px;
            height: 96px;
            position: absolute;
            margin:200px auto;
        }


    </style>
    <script>

        $(function () {
            var qrcode = new QRCode(document.getElementById("qrcode"), {
                width : 96,//设置宽高
                height : 96
            });
            var thisURL = document.URL+"54";

            document.getElementById("send").onclick =function(){
                qrcode.makeCode(thisURL);
            }
        })
        $(function () {
            let gro_id = $("#gpid")[0].innerText;
            let linetab = document.getElementById("linetab");
            let groupId = document.getElementById("groupId");
            let price = document.getElementById("price");
            let Snum = document.getElementById("Snum");
            let Enum = document.getElementById("Enum");
            let group_idc = document.getElementsByName("group_idc")[0];
            if (gro_id>0){
                groupId.value = gro_id;
                group_idc.value = gro_id;
            $.ajax({
                url: "../servletTest.mvc/findAllCustom.mvc",
                type: "post",
                data:{
                    "group":gro_id
                },
                success:function (data) {
                    for (var q = linetab.rows.length; q > 1; q--) {
                        linetab.deleteRow(q - 1);
                    }

                    price.value = data[0].price;
                    Enum.value = data[0].estimate_num;
                    let enu = parseInt(data[0].estimate_num);

                    for ( i = 0;i<data.length;i++){
                        Snum.value = enu-data.length;
                        let tt = linetab.rows.length;
                        let tr = linetab.insertRow(tt);

                        tr.insertCell(0).innerText = i;

                        let cell1 = tr.insertCell(1);
                        let name  = document.createElement("input");
                        name.value =  data[i].name;
                        name.style.border = "0px";
                        name.style.width = "auto";
                        name.readOnly = true;
                        name.onchange=function(){
                            $.ajax({
                                url:"../servletTest.mvc/updataCus.mvc",
                                type:"post",
                                data:{
                                    "name":name.value,
                                    "certificates_num":certificates_num.innerText
                                }
                            })
                        }
                        cell1.appendChild(name);

                        let cell2 = tr.insertCell(2);
                        let sex  = document.createElement("input");
                        sex.value =  data[i].sex;
                        sex.readOnly = true;
                        sex.style.border = "0px";
                        sex.style.width = "auto";
                        sex.onchange=function(){
                            $.ajax({
                                url:"../servletTest.mvc/updataCus.mvc",
                                type:"post",
                                data:{
                                    "sex":sex.value,
                                    "certificates_num":certificates_num.innerText
                                }
                            })
                        }
                        cell2.appendChild(sex);

                        let cell3 = tr.insertCell(3);
                        let birthday  = document.createElement("input");
                        birthday.value =  data[i].birthday;
                        birthday.readOnly = true;
                        birthday.style.border = "0px";
                        birthday.style.width = "auto";
                        birthday.onchange=function(){
                            $.ajax({
                                url:"../servletTest.mvc/updataCus.mvc",
                                type:"post",
                                data:{
                                    "birthday":birthday.value,
                                    "certificates_num":certificates_num.innerText
                                }
                            })
                        }
                        cell3.appendChild(birthday);

                        tr.insertCell(4).innerText = data[i].certificates_type;
                        let certificates_num = tr.insertCell(5);
                        certificates_num.innerText = data[i].certificates_num;

                        let cell6 = tr.insertCell(6);
                        let address  = document.createElement("input");
                        address.value =  data[i].address;
                        address.readOnly = true;
                        address.style.border = "0px";
                        address.style.width = "auto";
                        address.onchange=function(){
                            $.ajax({
                                url:"../servletTest.mvc/updataCus.mvc",
                                type:"post",
                                data:{
                                    "address":address.value,
                                    "certificates_num":certificates_num.innerText
                                }
                            })
                        }
                        cell6.appendChild(address);

                        tr.insertCell(7).innerText = data[i].tel;
                        tr.insertCell(8).innerText = data[i].traveller_type;
                        tr.insertCell(9).innerText = data[i].upload;

                        let cell10 = tr.insertCell(10);
                        let remarks  = document.createElement("input");
                        remarks.value =  data[i].remarks;
                        remarks.readOnly = true;
                        remarks.style.border = "0px";
                        remarks.style.width = "auto";
                        remarks.onchange=function(){
                            $.ajax({
                                url:"../servletTest.mvc/updataCus.mvc",
                                type:"post",
                                data:{
                                    "remarks":remarks.value,
                                    "certificates_num":certificates_num.innerText
                                }
                            })
                        }
                        cell10.appendChild(remarks);

                        let cell11 = tr.insertCell(11);
                        let rewrite  = document.createElement("button");
                        rewrite.innerText = '修改';
                        rewrite.style.border = "1px";
                        rewrite.style.width = "60px";
                        rewrite.style.height = "50px";
                        rewrite.onclick=function(){
                            name.readOnly = false;
                            sex.readOnly = false;
                            address.readOnly = false;
                            remarks.readOnly = false;
                            birthday.readOnly = false;

                        }
                        cell11.appendChild(rewrite);

                    }
                }
            })
            }
            $("#groupId").change(function () {

                $.ajax({
                    url: "../servletTest.mvc/findAllCustom.mvc",
                    type: "post",
                    data:{
                        "group":this.value
                    },
                    success:function (data) {
                        for (var q = linetab.rows.length; q > 1; q--) {
                            linetab.deleteRow(q - 1);
                        }
                        price.value = data[0].price;
                        Enum.value = data[0].estimate_num;
                        let enu = parseInt(data[0].estimate_num);
                        for ( i = 0;i<data.length;i++){
                            Snum.value = enu-data.length;
                            let tt = linetab.rows.length;
                            let tr = linetab.insertRow(tt);
                            tr.insertCell(0).innerText = i;

                            let cell1 = tr.insertCell(1);
                            let name  = document.createElement("input");
                            name.value =  data[i].name;
                            name.style.border = "0px";
                            name.style.width = "auto";
                            name.readOnly = true;
                            name.onchange=function(){
                                $.ajax({
                                    url:"../servletTest.mvc/updataCus.mvc",
                                    type:"post",
                                    data:{
                                        "name":name.value,
                                        "certificates_num":certificates_num.innerText
                                    }
                                })
                            }
                            cell1.appendChild(name);

                            let cell2 = tr.insertCell(2);
                            let sex  = document.createElement("input");
                            sex.value =  data[i].sex;
                            sex.readOnly = true;
                            sex.style.border = "0px";
                            sex.style.width = "auto";
                            sex.onchange=function(){
                                $.ajax({
                                    url:"../servletTest.mvc/updataCus.mvc",
                                    type:"post",
                                    data:{
                                        "sex":sex.value,
                                        "certificates_num":certificates_num.innerText
                                    }
                                })
                            }
                            cell2.appendChild(sex);

                            let cell3 = tr.insertCell(3);
                            let birthday  = document.createElement("input");
                            birthday.value =  data[i].birthday;
                            birthday.readOnly = true;
                            birthday.style.border = "0px";
                            birthday.style.width = "auto";
                            birthday.onchange=function(){
                                $.ajax({
                                    url:"../servletTest.mvc/updataCus.mvc",
                                    type:"post",
                                    data:{
                                        "birthday":birthday.value,
                                        "certificates_num":certificates_num.innerText
                                    }
                                })
                            }
                            cell3.appendChild(birthday);

                            tr.insertCell(4).innerText = data[i].certificates_type;
                            let certificates_num = tr.insertCell(5);
                            certificates_num.innerText = data[i].certificates_num;

                            let cell6 = tr.insertCell(6);
                            let address  = document.createElement("input");
                            address.value =  data[i].address;
                            address.readOnly = true;
                            address.style.border = "0px";
                            address.style.width = "auto";
                            address.onchange=function(){
                                $.ajax({
                                    url:"../servletTest.mvc/updataCus.mvc",
                                    type:"post",
                                    data:{
                                        "address":address.value,
                                        "certificates_num":certificates_num.innerText
                                    }
                                })
                            }
                            cell6.appendChild(address);

                            tr.insertCell(7).innerText = data[i].tel;
                            tr.insertCell(8).innerText = data[i].traveller_type;
                            tr.insertCell(9).innerText = data[i].upload;

                            let cell10 = tr.insertCell(10);
                            let remarks  = document.createElement("input");
                            remarks.value =  data[i].remarks;
                            remarks.readOnly = true;
                            remarks.style.border = "0px";
                            remarks.style.width = "auto";
                            remarks.onchange=function(){
                                $.ajax({
                                    url:"../servletTest.mvc/updataCus.mvc",
                                    type:"post",
                                    data:{
                                        "remarks":remarks.value,
                                        "certificates_num":certificates_num.innerText
                                    }
                                })
                            }
                            cell10.appendChild(remarks);

                            let cell11 = tr.insertCell(11);
                            let rewrite  = document.createElement("button");
                            rewrite.innerText = '修改';
                            rewrite.style.border = "1px";
                            rewrite.style.width = "60px";
                            rewrite.style.height = "50px";
                            rewrite.onclick=function(){
                                name.readOnly = false;
                                sex.readOnly = false;
                                address.readOnly = false;
                                remarks.readOnly = false;
                                birthday.readOnly = false;

                            }
                            cell11.appendChild(rewrite);
                        }
                    }
                })
            })
        })

    </script>
</head>
<body>


    <div id="long">
        团期编号:<span id="gpid"> ${sessionScope.root}</span><br>
        团期编号: <input type="text" placeholder="团期编号" id="groupId" value=" ">单价:<input type="text" placeholder="单价" id="price"  readonly="readonly">
        预收人数:<input type="text" placeholder="预收人数" id="Enum" readonly="readonly">剩余人数:<input type="text" placeholder="剩余人数" id="Snum"  readonly="readonly">
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
            添加
        </button>
    </div>
    <div id="yuan">
        <table id="linetab" border="1px" cellspacing="0px" cellpadding="16px">
            <tr>
                <td>序号</td>
                <td>姓名</td>
                <td>性别</td>
                <td>出生日期</td>
                <td>证件类型</td>
                <td>证件号</td>
                <td>出生地址</td>
                <td>联系电话</td>
                <td>旅客类型</td>
                <td>上传复印件</td>
                <td>备注</td>
                <td>restory</td>
            </tr>
        </table>
        <center id="pageDemo"><input type="button" value="上一页" id = "0">
            <input type="button" id="1" value="1">
            <input type="button" value="下一页" id="2020"></center>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <form action="../servletTest.mvc/fileOp.mvc" method="post" enctype="multipart/form-data">
                        <input type="text" placeholder="团期" name="group_idc" class="form-control" aria-describedby="basic-addon1">
                        <input type="text" placeholder="姓名" name="name" class="form-control" aria-describedby="basic-addon1"><input type="text" placeholder="性别" name="sex" class="form-control" aria-describedby="basic-addon1">
                        出生日期<input type="date" name="birthday" class="form-control" aria-describedby="basic-addon1"><input type="text" placeholder="联系电话" name="tel" class="form-control" aria-describedby="basic-addon1">
                        <input type="text" placeholder="证件类型" name="certificates_type" class="form-control" aria-describedby="basic-addon1">><input type="text" placeholder="证件号码" name="certificates_num" class="form-control" aria-describedby="basic-addon1">
                        <input type="text" placeholder="地址" name="address" class="form-control" aria-describedby="basic-addon1"> <input type="text" placeholder="旅客类型" name="traveller_type" class="form-control" aria-describedby="basic-addon1">
                        <input type="text" placeholder="备注" name="remarks" class="form-control" aria-describedby="basic-addon1"> <input type="text" placeholder="上传" name="upload" value ="上传" class="form-control" aria-describedby="basic-addon1">
                        <input type="file" name="image"><div id="qrcode"></div>
                        <input type="submit" value="提交" id="send">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
