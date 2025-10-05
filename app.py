from bottle import Bottle, run, template, request, redirect
from sqlite3 import connect

# ----------------- Database Setup -----------------
def db_setup():
    with connect("pysms.db") as con:
        sql = """CREATE TABLE IF NOT EXISTS students(
                     roll_no INTEGER PRIMARY KEY,
                     name TEXT,
                     subject1 REAL,
                     subject2 REAL,
                     subject3 REAL
                 )"""
        con.execute(sql)

db_setup()
application = Bottle()

# ----------------- Home Page -----------------
@application.route("/")
def home():
    return template("home")

# ----------------- Add Student -----------------
@application.route("/add", method=["GET", "POST"])
def add_student():
    if request.method == "POST":
        try:
            roll_no_raw = request.forms.get("roll_no")
            name = request.forms.get("name").strip()
            s1 = request.forms.get("subject1")
            s2 = request.forms.get("subject2")
            s3 = request.forms.get("subject3")

            if not roll_no_raw.isdigit():
                return template("add", msg="Roll No must be a number!")
            roll_no = int(roll_no_raw)

            if not all([name, s1, s2, s3]):
                return template("add", msg="All fields are required!")

            subject1 = float(s1)
            subject2 = float(s2)
            subject3 = float(s3)

            with connect("pysms.db") as con:
                con.execute(
                    "INSERT INTO students VALUES (?, ?, ?, ?, ?)",
                    (roll_no, name, subject1, subject2, subject3)
                )
            return template("add", msg="Student saved successfully!")

        except Exception as e:
            print("Error while inserting:", e)
            return template("add", msg=f"Error saving student: {e}")
    else:
        return template("add", msg="")

# ----------------- View Students -----------------
@application.route("/students")
def view_students():
    with connect("pysms.db") as con:
        cursor = con.cursor()
        cursor.execute("SELECT roll_no, name, subject1, subject2, subject3 FROM students")
        students = cursor.fetchall()
    return template("students", students=students)

# ----------------- Update Student (Search Roll No) -----------------
@application.route("/update", method=["GET", "POST"])
def update_student():
    if request.method == "POST":
        roll_no = request.forms.get("roll_no")
        if not roll_no.isdigit():
            return template("update", msg="Roll No must be a number!")

        roll_no = int(roll_no)
        with connect("pysms.db") as con:
            cursor = con.cursor()
            cursor.execute("SELECT * FROM students WHERE roll_no=?", (roll_no,))
            student = cursor.fetchone()

        if student:
            return template("update_form", student=student, msg="")
        else:
            return template("update", msg=f"No student found with Roll No {roll_no}")
    else:
        return template("update", msg="")

# ----------------- Edit Student Submission -----------------
@application.route("/edit/<roll_no>", method=["POST"])
def edit_student(roll_no):
    try:
        roll_no = int(roll_no)
        name = request.forms.get("name").strip()
        s1 = request.forms.get("subject1")
        s2 = request.forms.get("subject2")
        s3 = request.forms.get("subject3")

        if not all([name, s1, s2, s3]):
            return template("update_form", student=(roll_no, name, s1, s2, s3), msg="All fields are required!")

        subject1 = float(s1)
        subject2 = float(s2)
        subject3 = float(s3)

        with connect("pysms.db") as con:
            con.execute(
                "UPDATE students SET name=?, subject1=?, subject2=?, subject3=? WHERE roll_no=?",
                (name, subject1, subject2, subject3, roll_no)
            )

        # Pass success message to template instead of redirect
        return template("update_form", student=(roll_no, name, subject1, subject2, subject3), msg="Student updated successfully!")

    except Exception as e:
        print("Error while updating:", e)
        return template("update_form", student=(roll_no, name, s1, s2, s3), msg=f"Error updating student: {e}")

# ----------------- Delete Student -----------------
@application.route("/delete", method=["GET", "POST"])
def delete_student():
    if request.method == "POST":
        roll_no = request.forms.get("roll_no")
        if not roll_no.isdigit():
            return template("delete", msg="Roll No must be a number!")

        roll_no = int(roll_no)
        try:
            with connect("pysms.db") as con:
                cursor = con.cursor()
                cursor.execute("DELETE FROM students WHERE roll_no=?", (roll_no,))
                if cursor.rowcount > 0:
                    msg = f"Student with Roll No {roll_no} deleted successfully."
                else:
                    msg = f"No student found with Roll No {roll_no}."
            return template("delete", msg=msg)
        except Exception as e:
            print("Error deleting:", e)
            return template("delete", msg=f"Error while deleting student: {e}")
    else:
        return template("delete", msg="")

# ----------------- Run Application -----------------
#run(application, host="localhost", port=8080, debug=True, reloader=True)
