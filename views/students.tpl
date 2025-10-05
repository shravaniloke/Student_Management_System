<html>
<head>
    <title>All Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h2 {
            margin-top: 40px;
            color: #333;
        }

        table {
            margin: 30px auto;
            border-collapse: collapse;
            width: 90%;
            background: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
        }

        tr:nth-child(even) { background-color: #f9f9f9; }

        tr:hover { background-color: #f1f1f1; }

        a.action-btn {
            padding: 6px 12px;
            margin: 2px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            font-weight: bold;
            transition: 0.3s;
        }

        a.edit-btn { background-color: #2196F3; }
        a.edit-btn:hover { background-color: #0b7dda; }

        a.delete-btn { background-color: #f44336; }
        a.delete-btn:hover { background-color: #da190b; }

        a.add-btn {
            display: inline-block;
            margin: 20px 0;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.3s;
        }
        a.add-btn:hover { background-color: #45a049; }
        a { display: inline-block; margin-top: 15px; text-decoration: none; color: #333; }

        @media screen and (max-width: 768px) {
            table, th, td { font-size: 14px; }
            a.action-btn { padding: 5px 8px; font-size: 12px; }
        }
    </style>
</head>
<body>
    <h2>All Students</h2>


    <table>
        <tr>
            <th>Roll No</th>
            <th>Name</th>
            <th>Subject 1</th>
            <th>Subject 2</th>
            <th>Subject 3</th>
            <th>Total</th>
            <th>Percentage</th>
            <th>Actions</th>
        </tr>
        % for s in students:
            % total = s[2] + s[3] + s[4]
            % percentage = total / 3
        <tr>
            <td>{{s[0]}}</td>
            <td>{{s[1]}}</td>
            <td>{{s[2]}}</td>
            <td>{{s[3]}}</td>
            <td>{{s[4]}}</td>
            <td>{{total}}</td>
            <td>{{round(percentage, 2)}}%</td>
            <td>
                <a href="/update" class="action-btn edit-btn">Edit</a>
                <a href="/delete" class="action-btn delete-btn">Delete</a>
            </td>
        </tr>
        % end
    </table>
        <a href="/add" class="add-btn">Add New Student</a>
<br/>
<a href="/">Back to Home</a>


</body>
</html>
