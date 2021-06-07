<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>B_01</title>
</head>
<body>
    <h1>투표하기</h1>
    <table>
        <tr>
            <form method="post" action="B_02_H.jsp" name="B_01_Form">
                <td>
                    <p>
                        <select name="choice" id="selectHubo">
                            <option value="1">1 김일도</option>
                            <option value="2">2 김이도</option>
                            <option value="3">3 김삼도</option>
                            <option value="4">4 김사도</option>
                            <option value="5">5 김오도</option>
                        </select>
                    </p>
                </td>
                <td>
                    <p>
                        <select name="age" id="selectAge">
                            <option value="1">10대</option>
                            <option value="2">20대</option>
                            <option value="3">30대</option>
                            <option value="4">40대</option>
                            <option value="5">50대</option>
                            <option value="6">60대</option>
                            <option value="7">70대</option>
                            <option value="8">80대</option>
                            <option value="9">90대</option>
                        </select>
                    </p>
                </td>
                <td>
                    <input type="submit" value="투표하기">
                </td>
            </form>
        </tr>
    </table>
</body>
</html>