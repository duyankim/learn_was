<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>A_01_H</title>
</head>
<body>
    <h1>후보등록</h1>
    <table>
        <tr>
            <td>
                <p>후보명 입력</p>
            </td>
        </tr>
        <tr>
            <td>
                <form method="post" action="A_02.jsp" id="A_01_Form">
                    기호: <input type="text" name="id" value="1" readonly>
                    이름: <input type="text" name="name" value="김일도" readonly>
                    <input type="submit" value="삭제" onclick="submitForm('delete')">
                </form>
            </td>
        </tr>
        <tr>
            <td>
                <form method="post" action="A_02.jsp" id="A_01_Form">
                    기호: <input type="text" name="id" value="1" readonly>
                    이름: <input type="text" name="name" value="김이도" readonly>
                    <input type="submit" value="삭제" onclick="submitForm('delete')">
                </form>
            </td>
        </tr>
        <tr>
            <td>
                <form method="post" action="A_02.jsp" id="A_01_Form">
                    기호: <input type="text" name="id" value="1" readonly>
                    이름: <input type="text" name="name" value="김삼도" readonly>
                    <input type="submit" value="삭제" onclick="submitForm('delete')">
                </form>
            </td>
        </tr>
        <tr>
            <td>
                <form method="post" action="A_02.jsp" id="A_01_Form">
                    기호: <input type="text" name="id" value="1" readonly>
                    이름: <input type="text" name="name" value="김사도" readonly>
                    <input type="submit" value="삭제" onclick="submitForm('delete')">
                </form>
            </td>
        </tr>
        <tr>
            <td>
                <form method="post" action="A_03.jsp" name="A_01_Form" id="A_01_Form">
                    기호: <input type="text" name="id" value="">
                    이름: <input type="text" name="name" value="">
                    <input type="submit" value="추가" onclick="checkNameAndUpdate(document.A_01_Form.name, event)">
            </td>
        </tr>
    </table>
    <script src="../../script/form.js"></script>
</body>
</html>