<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>添加图书</title></head>
<body>
<h2>添加图书</h2>
<form action="bookServlet?action=save" method="post">
  <p>书名：<input type="text" name="name" required/></p>
  <p>作者：<input type="text" name="author" required/></p>
  <p>价格：<input type="number" step="0.01" name="price" required/></p>
  <p>日期：<input type="date" name="publishDate" required/></p>
  <p>
    <input type="submit" value="保存"/>
    <a href="bookServlet?action=list">返回列表</a>
  </p>
</form>
</body>
</html>