<%--
  Created by IntelliJ IDEA.
  User: Royal
  Date: 2020/1/6
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="../js/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../bootstrap-4.4.1-dist/css/bootstrap.min.css">
    <script src="../bootstrap-4.4.1-dist/js/bootstrap.min.js"></script>
    <script src="../bootstrap-4.4.1-dist/js/bootstrap.bundle.js"></script>
    <link rel="stylesheet" href="../static/css/style.css" />

    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/script.js"></script>
    <script type="text/javascript" src="../js/homep.js"></script>
    <style>
        *{
            margin: 0px;
            height: 0px;
        }
        #h1{
            width: 20%;
            height: 500px;
            position: absolute;

        }
        body{
            background: white;
        }
        video{
            position: absolute;
            left: 50%;
            top: 60%;
        }

    </style>

</head>
<body>
<div id="h1" >
    <center>个人信息</center><br>
    <span>欢迎您，拓峰旅行社</span><br>
    <span>注册时间：</span><span>2020-1-6</span><br>
    <span>有效日期：</span><span>2020-12-21</span><br>
    <span>上次登录时间：</span><span id="da"></span><br>
    <span>登录次数：</span><span id="count"></span><br>
    <span>最新动态</span><br>
    </div>
        <div class="wrap">
            <div class="pic1 pic" id="p1">
                <div class="pic_num1 pic_num">风呼呼呼</div>
            </div>
            <div class="pic2 pic" id="p2">
                <div class="pic_num2 pic_num">水哗啦啦</div>
            </div>
            <div class="pic3 pic" id="p3">
                <div class="pic_num3 pic_num">宝贝贝贝</div>
            </div>
            <div class="pic4 pic" id="p4">
                <div class="pic_num4 pic_num">地大大大</div>
            </div>
            <div class="pic5 pic" id="p5">
                <div class="pic_num5 pic_num">在在子啊</div>
            </div>
            <div class="pic6 pic" id="p6">
                <div class="pic_num6 pic_num">这日日日啊</div>
            </div>
        </div>
        <br>
        <video width="400" height="400" controls="controls">
            <source src="../video/killer.mp4" type="video/mp4">
            <object data="../video/killer.mp4" width="400" height="400">
                <embed src="../video/killer.mp4" width="400" height="400">
            </object>

        </video>
    </body>
</html>
