<html>
<head>
<title>Add Student</title>
<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f6f9;
    text-align: center;
    margin-top: 50px;
}
h2 {
    color: #333;
}
form {
    display: inline-block;
    text-align: left;
    padding: 20px;
    background: #fff;
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
p { color: green; font-weight: bold; }
a { display: block; margin-top: 15px; text-decoration: none; color: #333; }
</style>
</head>
<body>
<h2>Add Student</h2>
<form method="post" action="/add">
    Roll No: <input type="text" name="roll_no" required><br>
    Name: <input type="text" name="name" required><br>
    Subject1: <input type="number" name="subject1" required><br>
    Subject2: <input type="number" name="subject2" required><br>
    Subject3: <input type="number" name="subject3" required><br>
    <input type="submit" value="Save">
</form>

<p>{{msg}}</p>
<a href="/students">View All Students</a>
<br/>
<a href="/">Back to Home</a>
</body>
</html>
