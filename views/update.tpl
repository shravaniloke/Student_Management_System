<html>
<head>
<title>Update Student</title>
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
    background: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}
input[type=text], input[type=submit] {
    padding: 8px;
    margin: 5px;
    border-radius: 5px;
    border: 1px solid #ccc;
}
input[type=submit] {
    background: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
}
input[type=submit]:hover { background: #45a049; }
p { color: red; font-weight: bold; }
a { display: block; margin-top: 15px; text-decoration: none; color: #333; }
</style>
</head>
<body>
<h2>Update Student</h2>
<form method="post" action="/update">
Enter Roll No: <input type="text" name="roll_no" required>
<input type="submit" value="Search">
</form>
<p>{{msg}}</p>
<a href="/">Back to Home</a>
</body>
</html>
