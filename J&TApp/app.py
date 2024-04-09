import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sqlalchemy import create_engine
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm import sessionmaker

import pymysql as mysql
import sqlalchemy as sqla
from flask import Flask, render_template, request, render_template_string, redirect, url_for, session
import matplotlib.pyplot as plt
import io
import base64
from sqlalchemy import create_engine, text

app = Flask(__name__)
app.secret_key = 'secret' 

def fig_to_base64(plt):
    """Converts a matplotlib figure to a base64 string for HTML embedding."""
    img = io.BytesIO()
    plt.savefig(img, format='png', bbox_inches='tight')
    plt.close()
    img.seek(0)
    img_base64 = base64.b64encode(img.getvalue()).decode('utf8')
    return img_base64

def plot_rentals_by_make():
    conn_str = 'mysql+pymysql://root:password@localhost/j&tcarrentals'
    db_con = sqla.create_engine(conn_str)

    sql_query = """
    SELECT v.make, v.model, COUNT(r.rentalID) as rental_count
    FROM Rental r
    JOIN Vehicles v ON r.vehicleID = v.vehicleID
    GROUP BY v.make, v.model
    ORDER BY rental_count DESC
    """

    df = pd.read_sql(sql_query, db_con)

    df['make_model'] = df['make'] + ' ' + df['model']

    df_sorted = df.sort_values('rental_count', ascending=False)

    plt.figure(figsize=(14, 10))

    plt.bar(df_sorted['make_model'], df_sorted['rental_count'], color='lightblue', edgecolor='black', width=0.5)

    plt.xticks(rotation=45, ha="right")

    plt.ylabel('Number of Rentals')
    plt.xlabel('Vehicle Make and Model')
    plt.title('Most Popular Vehicle Makes and Models by Rental Count')
    plt.tight_layout()

    return fig_to_base64(plt)

def plot_color_popularity():
    conn_str = 'mysql+pymysql://root:password@localhost/j&tcarrentals'
    db_con = sqla.create_engine(conn_str)

    sql_query = """
    SELECT v.color, COUNT(r.rentalID) as rental_count
    FROM Rental r
    JOIN Vehicles v ON r.vehicleID = v.vehicleID
    GROUP BY v.color
    ORDER BY rental_count DESC;
    """

    df_color = pd.read_sql(sql_query, db_con)

    db_con.dispose()

    plt.figure(figsize=(12, 8))
    plt.bar(df_color['color'], df_color['rental_count'], color=df_color['color'].str.lower(), edgecolor='black')
    plt.xlabel('Car Color')
    plt.ylabel('Number of Rentals')
    plt.title('Popularity of Car Colors Based on Rentals')
    plt.xticks(rotation=45)
    plt.tight_layout()
    
    return fig_to_base64(plt)

def plot_heatmap():
    conn_str = 'mysql+pymysql://root:password@localhost/j&tcarrentals'
    db_con = sqla.create_engine(conn_str)

    sql_query = """
    SELECT u.age, COUNT(r.rentalID) AS rental_count
    FROM Users u
    LEFT JOIN Rental r ON u.userID = r.userID
    WHERE u.age IS NOT NULL
    GROUP BY u.userID;
    """

    df_users = pd.read_sql(sql_query, db_con)

    db_con.dispose()

    df_users['age_bin'] = pd.cut(df_users['age'], bins=[0, 20, 30, 40, 50, 60, 70, 80, 90, 100], labels=['0-20', '21-30', '31-40', '41-50', '51-60', '61-70', '71-80', '81-90', '91-100'])
    df_users['rental_count_bin'] = pd.cut(df_users['rental_count'], bins=3, labels=['Low', 'Medium', 'High']) 

    pivot_table = df_users.pivot_table(index='age_bin', columns='rental_count_bin', aggfunc='size', fill_value=0)

    plt.figure(figsize=(10, 8))
    sns.heatmap(pivot_table, annot=True, cmap="YlGnBu", fmt='d')
    plt.title('Heatmap of User Age vs. Rental Count Intervals')
    plt.ylabel('Age Interval')
    plt.xlabel('Rental Count Interval')
    return fig_to_base64(plt)

def plot_monthly_revenue():
    conn_str = 'mysql+pymysql://root:password@localhost/j&tcarrentals'
    db_con = sqla.create_engine(conn_str)

    sql_query = """
    SELECT YEAR(initialDate) as year, MONTH(initialDate) as month, SUM(totalPrice) as total_revenue
    FROM Rental
    GROUP BY YEAR(initialDate), MONTH(initialDate)
    ORDER BY YEAR(initialDate), MONTH(initialDate);
    """

    df_revenue = pd.read_sql(sql_query, db_con)

    db_con.dispose()

    df_revenue['date'] = pd.to_datetime(df_revenue[['year', 'month']].assign(DAY=1))

    plt.figure(figsize=(14, 7))
    plt.plot(df_revenue['date'], df_revenue['total_revenue'], marker='o', linestyle='-', color='blue')
    plt.title('Monthly Revenue Over Time')
    plt.xlabel('Date')
    plt.ylabel('Total Revenue')
    plt.xticks(rotation=45)
    plt.tight_layout()

    return fig_to_base64(plt)
    
def plot_vehicle_tickets():
    conn_str = 'mysql+pymysql://root:password@localhost/j&tcarrentals'
    db_con = sqla.create_engine(conn_str)
    sql_query = """
    SELECT v.make, v.model, COUNT(t.ticketID) as ticket_count
    FROM Tickets t
    JOIN Rental r ON t.rentalID = r.rentalID
    JOIN Vehicles v ON r.vehicleID = v.vehicleID
    GROUP BY v.make, v.model
    ORDER BY ticket_count DESC

    """
    df = pd.read_sql(sql_query, db_con)
    db_con.dispose()

    df['make_model'] = df['make'] + ' ' + df['model']

    df_sorted = df.sort_values('ticket_count', ascending=True)

    plt.figure(figsize=(10, 8))  

    plt.bar(df_sorted['make_model'], df_sorted['ticket_count'], color='skyblue', edgecolor='black', width=0.8)

    plt.xticks(rotation=40, ha="right")

    plt.ylabel('Number of Tickets')
    plt.xlabel('Vehicle Make and Model')
    plt.title('Vehicle Make and Model with Most Tickets')
    plt.tight_layout()


    return fig_to_base64(plt)

def list_available_vehicles():
    conn_str = 'mysql+pymysql://root:password@localhost/j&tcarrentals'
    db_con = create_engine(conn_str)
    sql = "SELECT * FROM Vehicles WHERE isAvailable = TRUE"
    vehicles = []  # Initialize an empty list to store vehicle data
    with db_con.connect() as conn:
        result = conn.execute(text(sql))
        vehicles = [dict(row) for row in result]
    db_con.dispose()
    return vehicles

def create_user_account(username, password, name, age, address, phone_number, email, account_type):
    conn_str = 'mysql+pymysql://root:password@localhost/j&tcarrentals'
    engine = create_engine(conn_str)
    Session = sessionmaker(bind=engine)
    session = Session()

    call_proc = """
        CALL CreateAccount(:username, :password, :name, :age, :address, :phone_number, :email, :account_type);
    """

    try:
        session.execute(call_proc, {
            'username': username, 'password': password, 'name': name, 'age': age,
            'address': address, 'phone_number': phone_number, 'email': email, 'account_type': account_type
        })
        session.commit()
        result = {'status': 'success', 'message': 'Account created successfully'}
    except SQLAlchemyError as e:
        session.rollback()
        result = {'status': 'error', 'message': str(e)}
    finally:
        session.close()

    return result

@app.route('/create-account', methods=['GET', 'POST'])
def create_account():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        name = request.form['name']
        age = request.form['age']
        address = request.form['address']
        phone_number = request.form['phone_number']
        email = request.form['email']
        account_type = request.form['account_type']

        result = create_user_account(username,password, name, int(age), address, phone_number, email, account_type)

        if result['status'] == 'success':
            return redirect(url_for('account_created'))
        else:
            return f"Error: {result['message']}"

    form_html = '''
    <h2>Create Account</h2>
    <form method="post">
        Username: <input type="text" name="username"><br>
        Password: <input type="password" name="password"><br>
        Name: <input type="text" name="name"><br>
        Age: <input type="number" name="age"><br>
        Address: <input type="text" name="address"><br>
        Phone Number: <input type="text" name="phone_number"><br>
        Email: <input type="email" name="email"><br>
        Account Type: <input type="radio" id="regular" name="account_type" value="regular" checked>
                      <label for="regular">Regular</label>
                      <input type="radio" id="premium" name="account_type" value="premium">
                      <label for="premium">Premium</label><br>
        <input type="submit" value="Create Account">
    </form>
    '''


    return render_template_string(form_html)

def validate_user_login(username, password):
    conn_str = 'mysql+pymysql://root:password@localhost/j&tcarrentals'
    engine = create_engine(conn_str)
    with engine.connect() as db_con:
        db_con.execute(text("CALL ValidateUserLogin(:username, :password, @isValid);"),
                       {'username': username, 'password': password})

        result = db_con.execute(text("SELECT @isValid;"))
        isValid = result.scalar()
        
    return bool(isValid)

def validate_user_login_and_get_account_type(username, password):
    conn_str = 'mysql+pymysql://root:password@localhost/j&tcarrentals'
    engine = create_engine(conn_str)
    with engine.connect() as db_con:
        db_con.execute(text("CALL ValidateUserLogin(:username, :password, @isValid);"),
                       {'username': username, 'password': password})
        
        result = db_con.execute(text("SELECT @isValid;"))
        is_valid = result.scalar()

        if is_valid:
            account_type_result = db_con.execute(text("SELECT accountType FROM Users WHERE username = :username"),
                                                 {'username': username})
            account_type = account_type_result.scalar()
        else:
            account_type = None

    return bool(is_valid), account_type


def get_user_info(username):
    conn_str = 'mysql+pymysql://root:password@localhost/j&tcarrentals'
    engine = create_engine(conn_str)
    with engine.connect() as connection:
        query = text("SELECT `name`, age, address, phoneNumber, email, accountType FROM Users WHERE username = :username")
        result = connection.execute(query, {'username': username}).fetchone()
    return dict(result) if result else None

@app.route('/dashboard')
def dashboard():
    username = username = session['username']
    user_info = get_user_info(username)
    if user_info is not None:
        return render_template('dashboard.html', user_info=user_info)
    else:
        return "User information could not be found.", 404


@app.route('/account-created')
def account_created():
    return render_template('account_created.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        isValid, account_type = validate_user_login_and_get_account_type(username, password)  # Adjusted function
        if isValid:
            session['username'] = username
            session['account_type'] = account_type  # Store the account type in the session
            return redirect(url_for('dashboard'))
        else:
            return render_template('login.html', error="Invalid username or password.")
    else:
        return render_template('login.html')


@app.route('/logout')
def logout():
    session.pop('username', None)
    session.pop('account_type', None)
    return redirect(url_for('login'))

@app.route('/available-vehicles')
def available_vehicles():
    vehicles = list_available_vehicles()
    return render_template('available_vehicles.html', vehicles=vehicles)

@app.route('/app_info')
def app_info():
    return render_template('app_info.html')

@app.route('/view_ER')
def view_ER():
    return render_template('view_ER.html')

@app.route('/analytics')
def analytics():
    plot_func = request.args.get('plot')
    if plot_func == 'tickets':
        plot_img = plot_vehicle_tickets()
    elif plot_func == 'rentals':
        plot_img = plot_rentals_by_make()
    elif plot_func == 'color':
        plot_img = plot_color_popularity()
    elif plot_func == 'revenue':
        plot_img = plot_monthly_revenue()
    elif plot_func == 'heatmap':
        plot_img = plot_heatmap()
    else:
        plot_img = None
    return render_template('analytics.html', plot_img=plot_img)

@app.route('/')
def home():
    is_logged_in = 'username' in session
    return render_template('index.html', is_logged_in=is_logged_in)

if __name__ == '__main__':
    app.run(debug=True)