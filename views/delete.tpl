<html>
<head>
<title>Delete Student</title>
<style>
body {
    font-family: Arial, sans-serif;
    text-align: center;
    background: #f4f6f9;
    margin-top: 50px;
}
h2 { color: #c00; }
form {
    display: inline-block;
    background: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}
input[type=text] { padding: 8px; width: 200px; margin: 5px; }
input[type=submit] {
    padding: 8px 15px;
    background: #c00;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}
input[type=submit]:hover { background: #45a049; }
p { font-weight: bold; margin-top: 20px; color: #333; }
a { display: block; margin-top: 15px; text-decoration: none; color: #333; }
</style>
</head>
<body>
<h2>Delete Student</h2>
<form method="post" action="/delete">
Enter Roll No to Delete:<input type="text" name="roll_no" required>
<input type="submit" value="Delete">
</form>
<p>{{msg}}</p>
<a href="/">Back to Home</a>
</body>
</html>
