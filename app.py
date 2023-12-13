# app.py

import sqlite3
from bottle import Bottle, request, template, run

conn = sqlite3.connect('app_users.db')
cursor = conn.cursor()
cursor.execute('''
    CREATE TABLE IF NOT EXISTS apps (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        user_count INTEGER DEFAULT 0
    )
''')
cursor.execute('''
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        app_id INTEGER,
        username TEXT NOT NULL,
        FOREIGN KEY (app_id) REFERENCES apps (id)
    )
''')
conn.commit()

app = Bottle()

# Home route
@app.route('/')
def index():
    cursor.execute('SELECT * FROM apps')
    apps = cursor.fetchall()
    return template('index', apps=apps)

# Add app route
@app.route('/add_app', method='POST')
def add_app():
    name = request.forms.get('name')
    cursor.execute('INSERT INTO apps (name) VALUES (?)', (name,))
    conn.commit()
    return index()

# App detail route
@app.route('/app/<app_id>')
def app_detail(app_id):
    cursor.execute('SELECT * FROM apps WHERE id = ?', (app_id,))
    app = cursor.fetchone()
    cursor.execute('SELECT * FROM users WHERE app_id = ?', (app_id,))
    users = cursor.fetchall()
    return template('app_detail', app=app, users=users)

# Add user route
@app.route('/add_user/<app_id>', method='POST')
def add_user(app_id):
    username = request.forms.get('username')
    cursor.execute('INSERT INTO users (app_id, username) VALUES (?, ?)', (app_id, username))
    cursor.execute('UPDATE apps SET user_count = user_count + 1 WHERE id = ?', (app_id,))
    conn.commit()
    return app_detail(app_id)

# Edit app route
@app.route('/edit_app/<app_id>')
def edit_app(app_id):
    cursor.execute('SELECT * FROM apps WHERE id = ?', (app_id,))
    app = cursor.fetchone()
    return template('edit_app', app=app)

# Update app route
@app.route('/update_app/<app_id>', method='POST')
def update_app(app_id):
    new_name = request.forms.get('new_name')
    cursor.execute('UPDATE apps SET name = ? WHERE id = ?', (new_name, app_id))
    conn.commit()
    return app_detail(app_id)

# Delete app route
@app.route('/delete_app/<app_id>')
def delete_app(app_id):
    cursor.execute('DELETE FROM apps WHERE id = ?', (app_id,))
    conn.commit()
    return index()

# Edit user route
@app.route('/edit_user/<user_id>')
def edit_user(user_id):
    cursor.execute('SELECT * FROM users WHERE id = ?', (user_id,))
    user = cursor.fetchone()
    return template('edit_user', user=user)

# Update user route
@app.route('/update_user/<user_id>', method='POST')
def update_user(user_id):
    new_username = request.forms.get('new_username')
    cursor.execute('UPDATE users SET username = ? WHERE id = ?', (new_username, user_id))
    conn.commit()
    return app_detail(request.forms.get('app_id'))


# Delete user route
@app.route('/delete_user/<user_id>')
def delete_user(user_id):
    app_id = request.query.get('app_id')
    cursor.execute('DELETE FROM users WHERE id = ?', (user_id,))
    cursor.execute('UPDATE apps SET user_count = user_count - 1 WHERE id = ?', (app_id,))
    conn.commit()
    return app_detail(app_id)


if __name__ == '__main__':
    run(app, host='localhost', port=8085, debug=True)
