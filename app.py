from flask import Flask, render_template,request, redirect, session
import pymysql
app = Flask(__name__)
app.secret_key = 'drtyuijhgfdd'


@app.route('/userlogin', methods=['POST','GET'])
def userlogin():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        username = request.form['username']

        connection = pymysql.connect(host="localhost", user="root", password="", database="clinic_db")
        sql = "select email,password from users where email =%s and password =%s  and username =%s"
        cursor = connection.cursor()
        cursor.execute(sql,(email, password, username))
        if cursor.rowcount < 1:
            return render_template('userlogin.html', message='login failed')
        elif cursor.rowcount ==1:
            # session is created upon successful login
            # use email as unique identifier,store the email in session var
            session['key'] = email # session key carries login user email
            return redirect('/userprofile')
            # return render_template('login.html', message='log in success')

        else:
            return render_template('userlogin.html', message="Error try again later")

    else:
        return render_template('userlogin.html')


import  re


@app.route('/usersignup', methods=['POST', 'GET'])
def usersignup():
    # model- model view controller
    # model - where you store data eg sql database
    # controller - controls how to view links with model
    # when a user submits the form with data ,the user inputs are placed here
    # we need to set a database and a table
    # sql

    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        password_again = request.form['password_again']

        if password != password_again:
            # print("Your password do not match")
            return render_template('signup.html', message2="password do not match")
        if len(password) < 8:
            return render_template('signup.html', message2="password too short")
        elif re.search("[A-Z]", password):
            return render_template('signup.html', message2=" Enter atleast 1 capital")
        elif re.search("[a-z]", password):
            return render_template('signup.html', message2="Enter atleast a small letter")
        elif re.search("[0-9]", password):
            return render_template('signup.html', message2="Enter atleast a number")
        elif re.search("[-@$]", password):
            return render_template('signup.html', message2="Should contain atleast 1 symbol")

        else:
            connection = pymysql.connect(host="localhost", user="root", password="", database="clinic_db")
            # above we establish connection to xampp
            sql = "insert into users (username,email,password) values(%s, %s ,%s)"

            cursor = connection.cursor()  # the cursor is now connected to the db
            try:
                cursor.execute(sql, (username, email, password))
                connection.commit()  # let the save happen
                return render_template('usersignup.html', message="Registration Successfully")
            except:
                connection.rollback()
                return render_template('usersignup.html', message="Registration failed")
    else:
        return render_template('usersignup.html')


@app.route('/adminlogin', methods=['POST','GET'])
def adminlogin():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']

        connection = pymysql.connect(host="localhost", user="root", password="", database="clinic_db")
        sql = "select username,email,password from admin  where username =%s and  email=%s and password =%s "
        cursor = connection.cursor()
        cursor.execute(sql, (username, email, password))
        if cursor.rowcount < 1:

            return render_template('adminlogin.html', message='login failed')
        elif cursor.rowcount ==1:
            # session is created upon successful login
            # use email as unique identifier,store the email in session var
            session['key1'] =email  # session key carries login user email
            return redirect('/admin')
           # return render_template('adminlogin.html', message='log in success')
        else:
            return render_template('adminlogin.html', message="Error try again later")
    else:
        return render_template('adminlogin.html')


@app.route('/userprofile')
def userprofile():
    if 'key' in session:
        email = session['key']
        #  return 'logged in,you can access this page'
        connection = pymysql.connect(host="localhost", user="root", password="", database="clinic_db")
        sql = "select * from users where email =%s "
        cursor = connection.cursor()
        cursor.execute(sql, (email))

        # we get all other user entire details from a row
        row = cursor.fetchone()
        # print(row)
        # return the row to html template html
        return render_template('userprofile.html',email=email,row=row)

    else:
        return redirect('/userlogin')
    # create a link to logout in profile.html



@app.route('/doctorsprofile')
def doctorsprofile():
    connection = pymysql.connect(host="localhost", user="root", password="", database="clinic_db")
    sql = "SELECT * FROM `doctors` WHERE speciality= 'doctor' ORDER BY doctor_id DESC"
    cursor = connection.cursor()
    cursor.execute(sql,)

    # cout how many phones were found
    if cursor.rowcount == 0:
        return render_template("doctorsprofile.html", message='Record could not be found!')
    else:
        rows= cursor.fetchall()
        return render_template('doctorsprofile.html', rows=rows)


@app.route('/book<id>')
def book(id):
    if id == "":
        return redirect('/doctorsprofile')
    else:
        pass
    connection = pymysql.connect(host="localhost", user="root", password="", database="clinic_db")
    sql = "SELECT * FROM `doctors` WHERE doctor_id=%s"
    cursor=connection.cursor()
    cursor.execute(sql,(id))

    if cursor.rowcount==0:
    # render_template("purchase.html", message="product does not exist")
        return redirect('/doctorsprofile')

    else:
        row=cursor.fetchone()
        return render_template("book.html", row=row)


from flask import url_for


@app.route('/appointment', methods=['POST', 'GET'])
def appointment():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        time = request.form['time']
        telephone = request.form['telephone']
        country = request.form['country']
        city = request.form['city']
        location = request.form['location']
        medical = request.form['medical']

        connection = pymysql.connect(host="localhost", password="", user="root", database="clinic_db")

        sql = "insert into appointment (username, email, time, telephone, country, city, location, medical) values(%s, %s ,%s,%s,%s,%s,%s,%s)"

        cursor = connection.cursor()
        try:
            cursor.execute(sql, (username, email, time, telephone, country, city, location, medical))
            connection.commit()

            return redirect('/success')
        except:
            connection.rollback()

        return redirect('/failed')
    else:
        return redirect('/doctorsprofile')


@app.route('/logout')
def logout():
    session.pop('key',None)
    return redirect('/userlogin')


@app.route('/admin')
def admin():
   if "key1" in session:
    connection = pymysql.connect(host="localhost", password="", user="root", database="clinic_db")
    sql = "select * from appointment where status='pending' order by created_date desc"
    cursor = connection.cursor()

    cursor.execute(sql,)

    if cursor.rowcount ==0:
        return render_template('admin.html',message="No pending patients appointment")
    else:
        #create admin template ,bind message and rows
        rows = cursor.fetchall()
        return render_template('admin.html', rows=rows)
   else:
       return redirect('/adminlogin')


@app.route('/approved/<id>')
def approved(id):
    if id =="":
        return redirect("/admin")
    else:
        connection = pymysql.connect(host="localhost", password="", user="root", database="clinic_db")
        sql = "UPDATE  appointment SET status = 'approved' where appointment_id =%s"
        cursor = connection.cursor()
        cursor.execute(sql, (id))
        connection.commit()
        if cursor.rowcount ==0:
            return redirect('/admin')

        else:
            return redirect('/admin')


@app.route('/reschedule/<id>')
def reschedule(id):
    if id =="":
        return redirect("/admin")
    else:
        connection = pymysql.connect(host="localhost", password="", user="root", database="clinic_db")
        sql = "UPDATE  appointment status = 'rescheduled' where appointment_id =%s"
        cursor = connection.cursor()
        cursor.execute(sql, (id))
        connection.commit()
    if cursor.rowcount ==0:
        return redirect('/admin')
    else:
        return redirect('/admin')


@app.route('/success')
def success():
    return render_template('success.html')


@app.route('/failed')
def failed():
    return render_template('failed.html')


@app.route('/approved_appointments')
def approved_appointments():
    connection = pymysql.connect(host="localhost", password="", user="root", database="clinic_db")
    sql = "select * from appointment where status='approved' order by created_date desc"
    cursor = connection.cursor()
    cursor.execute(sql)

    if cursor.rowcount ==0:
        return render_template('approved.html', message="No pending patients appointment")
    else:
        #create admin template ,bind message and rows
        rows = cursor.fetchall()
        return render_template('approved.html', rows=rows)



@app.route('/reschedule_appointments')
def reschedule_appointments():
    connection = pymysql.connect(host="localhost", password="", user="root", database="clinic_db")
    sql = "select * from appointment where status='reschedule' order by created_date desc"
    cursor = connection.cursor()
    cursor.execute(sql)

    if cursor.rowcount ==0:
        return render_template('reschedule.html', message="No pending patients appointment")
    else:
        #create admin template ,bind message and rows
        rows = cursor.fetchall()
        return render_template('reschedule.html', rows=rows)



@app.route('/')
def home():
    # create a home.html for this route
    # this route finds its html page in template folder
    return render_template('home.html')





if __name__ == '__main__':
    app.run()
