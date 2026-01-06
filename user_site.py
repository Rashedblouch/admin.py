from flask import Flask, render_template_string, request, redirect, session
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash
from datetime import datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///baloch_matrix.db' # اسی فائل سے کنیکٹ
db = SQLAlchemy(app)

# وہی ٹیبلز یہاں بھی استعمال ہوں گی
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50), unique=True, nullable=False)
    password = db.Column(db.String(100), nullable=False)
    role = db.Column(db.String(10), default='user')

class ActivityLog(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50))
    action = db.Column(db.String(200))
    timestamp = db.Column(db.String(50))

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        user = request.form['username']
        # نیا یوزر بنانا
        new_user = User(username=user, password=generate_password_hash(request.form['password']))
        db.session.add(new_user)
        # ایڈمن کے لیے ریکارڈ بنانا
        new_log = ActivityLog(username=user, action="New User Registered", timestamp=datetime.now().strftime("%H:%M:%S"))
        db.session.add(new_log)
        db.session.commit()
        return "<h2>Account Created! Your data is now in Admin Panel.</h2>"
    return '''<form method="POST"> <input name="username" placeholder="Name"> <input name="password" type="password"> <button>JOIN BALOCH-G</button> </form>'''

if __name__ == '__main__':
    app.run(debug=True, port=8080)
