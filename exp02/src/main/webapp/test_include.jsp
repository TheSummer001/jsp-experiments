<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>JSP Include 动作演示</title>
</head>
<body>

<!-- 动态包含头部文件 -->
<!-- 这里的 flush="true" 是标准写法，表示在包含前先输出缓冲区 -->
<jsp:include page="header.jsp" flush="true" />

<div style="padding: 20px; text-align: center;">
    <h3>这是主页面内容</h3>
    <p>上方的黑色横幅是来自于 header.jsp 的内容。</p>
    <p>使用 jsp:include 可以实现代码复用。</p>
</div>

<hr>
<div style="text-align: center; color: gray;">页面底部</div>

</body>
</html>