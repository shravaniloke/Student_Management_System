<html>
<head>
<title>Edit Student</title>
<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f6f9;
    text-align: center;
    margin-top: 50px;
}
h2 { color: #333; }
form {
    display: inline-block;
    text-align: left;
    background: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}
input[type=text], input[type=number] {
    padding: 8px;
    margin: 5px 0 15px 0;
    width: 100%;
    box-sizing: border-box;
}
input[type=submit] {
    padding: 10px 20px;
    background: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
input[type=submit]:hover { background: #45a049; }
a { display: block; margin-top: 15px; text-decoration: none; color: #333; }
<p style="color:green; font-weight:bold;">{{msg}}</p>
</style>
</head>
<body>
<h2>Edit Student</h2>
<p style="color:green; font-weight:bold;">{{msg}}</p>
<form method="post" action="/edit/{{student[0]}}">
Roll No: <input type="text" name="roll_no" value="{{student[0]}}" readonly><br>
Name: <input type="text" name="name" value="{{student[1]}}" required><br>
Subject1: <input type="number" name="subject1" value="{{student[2]}}" required><br>
Subject2: <input type="number" name="subject2" value="{{student[3]}}" required><br>
Subject3: <input type="number" name="subject3" value="{{student[4]}}" required><br>
<input type="submit" value="Update">
</form>
<a href="/students">Back to Student List</a>

</body>
</html>
