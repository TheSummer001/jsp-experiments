<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户注册 - 美化与验证版</title>
    <!-- CSS 美化部分 (对应项目 4) -->
    <style>
        body {
            font-family: "Microsoft YaHei", sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            padding-top: 50px;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 500px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
            border-bottom: 2px solid #1890ff;
            padding-bottom: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th {
            text-align: right;
            padding: 12px;
            color: #555;
            width: 100px;
            font-weight: bold;
        }
        td {
            padding: 10px;
        }
        input[type="text"], input[type="password"], select, textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box; /* 确保内边距不撑大宽度 */
            transition: border 0.3s;
        }
        input[type="text"]:focus, input[type="password"]:focus, textarea:focus {
            border-color: #1890ff;
            outline: none;
        }
        .btn-submit {
            width: 100%;
            background-color: #1890ff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn-submit:hover {
            background-color: #40a9ff;
        }
    </style>

    <!-- JavaScript 验证部分 (对应项目 3) -->
    <script type="text/javascript">
        function checkForm() {
            // 获取表单元素
            var name = document.getElementsByName("name")[0].value;
            var pw = document.getElementsByName("pw")[0].value;
            var pw2 = document.getElementsByName("pw2")[0].value;
            var phone = document.getElementsByName("telephone")[0].value;

            // 1. 验证姓名不能为空
            if (name == null || name.trim() === "") {
                alert("错误：姓名不能为空！");
                return false; // 阻止表单提交
            }

            // 2. 验证密码长度
            if (pw.length < 6) {
                alert("错误：密码长度不能少于6位！");
                return false;
            }

            // 3. 验证两次密码是否一致
            if (pw !== pw2) {
                alert("错误：两次输入的密码不一致！");
                return false;
            }

            // 4. 简单验证电话号码 (必须是数字)
            if (isNaN(phone) || phone.trim() === "") {
                alert("错误：请输入有效的电话号码！");
                return false;
            }

            alert("验证通过，正在提交注册...");
            return true; // 允许提交
        }
    </script>
</head>
<body>

<div class="container">
    <h2>用户注册</h2>
    <!-- onsubmit return checkForm() 是关键，如果返回false则不提交 -->
    <form method="post" action="register_optimized.jsp" onsubmit="return checkForm()">
        <table>
            <tr>
                <th>姓名 <span style="color:red">*</span></th>
                <td><input type="text" name="name" placeholder="请输入姓名"></td>
            </tr>
            <tr>
                <th>密码 <span style="color:red">*</span></th>
                <td><input type="password" name="pw" placeholder="至少6位"></td>
            </tr>
            <tr>
                <th>确认密码 <span style="color:red">*</span></th>
                <td><input type="password" name="pw2" placeholder="再次输入密码"></td>
            </tr>
            <tr>
                <th>性别</th>
                <td>
                    <input type="radio" name="sex" value="男" checked id="male"><label for="male">男</label>
                    &nbsp;&nbsp;
                    <input type="radio" name="sex" value="女" id="female"><label for="female">女</label>
                </td>
            </tr>
            <tr>
                <th>职业</th>
                <td>
                    <select name="career">
                        <option value="教育工作者">教育工作者</option>
                        <option value="公司职员" selected>公司职员</option>
                        <option value="自由职业者">自由职业者</option>
                        <option value="其他">其他</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>电话号码</th>
                <td><input type="text" name="telephone" placeholder="请输入数字"></td>
            </tr>
            <tr>
                <th>电子邮箱</th>
                <td><input type="text" name="email"></td>
            </tr>
            <tr>
                <th>兴趣爱好</th>
                <td>
                    <input type="checkbox" name="fav" value="体育">体育
                    <input type="checkbox" name="fav" value="看书">看书
                    <input type="checkbox" name="fav" value="旅游">旅游
                    <input type="checkbox" name="fav" value="美食">美食
                </td>
            </tr>
            <tr>
                <th>自我简介</th>
                <td><textarea name="intro" rows="4"></textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="立即注册" class="btn-submit">
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>