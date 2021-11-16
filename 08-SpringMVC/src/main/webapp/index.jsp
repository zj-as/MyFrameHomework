<%--
  Created by IntelliJ IDEA.
  User: Kurenai
  Date: 2021/7/17
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>08-SpringMVC</title>
    <script type="text/javascript" src="js/jQuery-3.6.0.js"></script>
    <script type="text/javascript">
        function fileUploadMethod(form){
            // 创建表单对象
            var formData = new FormData($("#js_form")[0]);

            $.ajax({
                url:"upload.do",
                type:"post",
                data:formData,
                processData: false, //对数据不做处理
                cache:false, //上传文件不需要缓存
                contentType:false,
                mimeType:form.enctype,
                success:function(data){
                    alert(data);
                },
                dataType:"text"
            })
        };

        function fileDownloadMethod(form){
            $.get(
                "download.do",
                "fileName=" + form.fileName.value,
                function(data){
                    // 根据返回数据的长度判断data是提示信息还是文件
                    if(data.length < 20){
                        // 如果是提示信息就输出
                        alert(data);
                    }else{
                        // 如果是文件的话，就创建一个a标签按原地址再访问一次，
                        // 不然的话下载不了文件，因为是一长串字符串。
                        var a = document.createElement("a");
                        a.href = "download.do?fileName=" + form.fileName.value;
                        a.click();
                    }
                },
                "text"
            )
        };
    </script>
</head>
<body>
<div align="center">
    <form id="js_form" enctype="multipart/form-data">
        <br/>
        <p>
            <input id="file" name="file" type="file"/>
            <input type="button" value="上传该文件" onclick="fileUploadMethod(this.form)"/>
        </p>
        <p>
            请输入要下载的文件名：
            <input name="fileName" type="text">
            <input type="button" value="下载该文件" onclick="fileDownloadMethod(this.form)"/>
            <a id="download" href="" hidden>111</a>
        </p>
    </form>
</div>
</body>
</html>
