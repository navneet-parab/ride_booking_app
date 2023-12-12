from flask import Flask, render_template, request, redirect, url_for, jsonify
from flaskext.mysql import MySQL
from mysql.connector import connect, Error
from getpass import getpass

app = Flask(__name__)

# Configure MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'BookingRideApp'

#mysql = MySQL(app)
mysql = MySQL()
mysql.init_app(app)

try:
    conn = connect(
        host='127.0.0.1',
        user='root',  # input('Enter username: '),
        password='@Lamborgini1998',  # getpass('Enter password: '),
        database='RideBookingApp'
    )
except Error as e:
    print(e)

@app.route('/')
def home():
    return render_template('home.html')

# Sample route to display data from the database

@app.route('/')
def index():
    cur = conn.cursor()
    #cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM Users')
    data = cur.fetchall()
    cur.close()
    return render_template('index.html', users=data)


# Sample route to display user information
@app.route('/users')
def display_users():
    cur = conn.cursor()
    cur.execute('SELECT user_id, username, email FROM Users')
    users = cur.fetchall()
    cur.close()
    return render_template('users.html', users=users)

# Sample route to display rider information
@app.route('/riders')
def display_riders():
    cur = conn.cursor()
    cur.execute('SELECT r.rider_id, u.username, r.payment_method, r.loyalty_points FROM Riders r JOIN Users u ON r.user_id = u.user_id')
    riders = cur.fetchall()
    cur.close()
    return render_template('riders.html', riders=riders)

# Sample route to display driver information
@app.route('/drivers')
def display_drivers():
    cur = conn.cursor()
    cur.execute('SELECT d.driver_id, u.username, d.driver_license, d.vehicle_model, d.vehicle_plate, d.rating FROM Drivers d JOIN Users u ON d.user_id = u.user_id')
    drivers = cur.fetchall()
    cur.close()
    return render_template('drivers.html', drivers=drivers)

# Sample route to display trip information
@app.route('/trips')
def display_trips():
    cur = conn.cursor()
    cur.execute('SELECT t.trip_id, r.user_id AS rider_userid, d.driver_id AS driver_userid, t.start_time, t.end_time, t.fare, t.status FROM Trips t JOIN Riders r ON t.rider_id = r.user_id LEFT JOIN Drivers d ON t.driver_id = d.driver_id')
    trips = cur.fetchall()
    cur.close()
    return render_template('trips.html', trips=trips)

# Sample route to display rating information
@app.route('/ratings')
def display_ratings():
    cur = conn.cursor()
    cur.execute('SELECT r.rating_id, r.rider_rating, r.driver_rating, r.comments, t.trip_id, tr.username AS rider_username, td.username AS driver_username FROM Ratings r JOIN Trips t ON r.trip_id = t.trip_id JOIN Users tr ON t.rider_id = tr.user_id LEFT JOIN Users td ON t.driver_id = td.user_id')
    ratings = cur.fetchall()
    cur.close()
    return render_template('ratings.html', ratings=ratings)

# Route to display the registration form
@app.route('/register', methods=['GET'])
def show_registration_form():
    return render_template('register.html')

# Route to handle the registration form submission
@app.route('/register', methods=['POST'])
def register_user():
    username = request.form['username']
    password = request.form['password']
    email = request.form['email']
    phone_number = request.form['phone_number']

    # Insert new user into the Users table
    cur = conn.cursor()
    cur.execute("INSERT INTO Users (username, password, email, phone_number, registration_date) VALUES (%s, %s, %s, %s, NOW())",
                (username, password, email, phone_number))
    #cur.commit()
    cur.close()

    return redirect(url_for('show_registration_success'))

# Route to display a registration success message
@app.route('/registration-success', methods=['GET'])
def show_registration_success():
    return render_template('registration_success.html')

if __name__ == '__main__':
    app.run(debug=True)
