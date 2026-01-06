from flask import Flask, render_template_string, request, redirect, session
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

app = Flask(__name__)
app.config['SECRET_KEY'] = 'baloch_ultra_king_786'

# سپا بیس ڈیٹا بیس لنک (درست فارمیٹ کے ساتھ)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres.wvswnimkgbdrgstigrym:WE2%24r5QxA9yViYs@db.wvswnimkgbdrgstigrym.supabase.co:5432/postgres'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# --- ڈیٹا بیس ٹیبلز ---
class AdminConfig(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50), default='Baloch 786')
    password = db.Column(db.String(50), default='admin 123')

class Message(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    sender = db.Column(db.String(50))
    content = db.Column(db.Text)
    time = db.Column(db.DateTime, default=datetime.now)

# --- میٹرکس اسٹائل ڈیزائن ---
STYLE = '''
<style>
    body { background: #000; color: #00fbff; font-family: 'Courier New', monospace; margin: 0; text-align: center; overflow-x: hidden; }
    canvas { position: fixed; top: 0; left: 0; z-index: -1; opacity: 0.8; }
    .header { background: rgba(0, 40, 40, 0.95); padding: 40px; border-bottom: 4px solid #00fbff; box-shadow: 0 0 30px #00fbff; position: sticky; top:0; z-index:100; }
    .header h1 { margin: 0; font-size: 50px; letter-spacing: 8px; color: #fff; text-shadow: 0 0 20px #00fbff; }
    .control-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; padding: 30px; max-width: 1200px; margin: auto; }
    .tool-btn { 
        background: rgba(0, 15, 15, 0.9); border: 3px solid #00fbff; color: #00fbff; 
        padding: 35px; font-size: 20px; font-weight: bold; border-radius: 20px;
        text-decoration: none; transition: 0.3s; box-shadow: inset 0 0 15px #00fbff;
        display: block; animation: neon-glow 2s infinite alternate;
    }
    @keyframes neon-glow { from { box-shadow: 0 0 10px #00fbff; } to { box-shadow: 0 0 35px #00fbff; } }
    .danger { border-color: #ff004c; color: #ff004c; animation: red-glow 1.5s infinite alternate; }
    @keyframes red-glow { from { box-shadow: 0 0 10px #ff004c; } to { box-shadow: 0 0 35px #ff004c; } }
    input { width: 85%; padding: 25px; margin: 15px; background: #000; border: 3px solid #00fbff; color: #fff; font-size: 20px; border-radius: 15px; }
    .msg-box { background: rgba(0,30,30,0.9); border: 2px solid #00fbff; margin: 15px; padding: 20px; text-align: left; border-radius: 15px; }
    .big-back-btn { display: block; width: 90%; margin: 40px auto; padding: 30px; background: #ff004c; color: #fff; font-size: 30px; font-weight: bold; border-radius: 20px; text-decoration: none; border: 4px solid #fff; }
</style>
'''

@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        if request.form['u'] == 'Baloch 786' and request.form['p'] == 'admin 123':
            session['logged'] = True
            return render_template_string(f'{STYLE}<div style="height:100vh; display:flex; align-items:center; justify-content:center; font-size:50px; font-weight:bold; text-shadow: 0 0 30px #00fbff;">WELCOME MR. BALOCH</div><script>setTimeout(()=>{{location.href="/dashboard"}}, 2000)</script>')
        return "<h2>ACCESS DENIED</h2>"
    return render_template_string(f'''{STYLE}
        <div style="margin-top:100px; display:inline-block; border:4px solid #00fbff; padding:60px; background:rgba(0,0,0,0.9); border-radius:25px;">
            <h1>MR. BALOCH</h1>
            <form method="POST">
                <input name="u" placeholder="ADMIN ID" required><br>
                <input name="p" type="password" placeholder="PASSWORD" required><br><br>
                <button type="submit" class="tool-btn" style="width:100%; cursor:pointer;">ACCESS COMMAND CENTER</button>
            </form>
        </div>''')

@app.route('/dashboard')
def dashboard():
    if not session.get('logged'): return redirect('/')
    
    tools = [
        "VIEW ALL USERS", "USER MESSAGES", "CHANGE ADMIN PASS", "LOCK WEBSITE", "RESTORE SITE",
        "DATABASE BACKUP", "TRAFFIC MONITOR", "IP BLOCKER", "FIREWALL CONFIG", "DDoS PROTECT",
        "ENCRYPTION", "KEYLOG DATA", "PORT SCANNER", "PHISHING LOGS", "SQL INJECTOR", "SYSTEM FREEZE",
        "CLEAN TRACES", "PROXY SETTINGS", "BOTNET MGMT", "TERMINAL ACCESS", "FILE MANAGER", "CLEAN JUNK",
        "AUTO RESTART", "EMAIL BLAST", "SMS GATEWAY", "SUPPORT CHAT", "TICKET SYSTEM", "USER LOGINS",
        "CPU MONITOR", "RAM USAGE", "API CONTROL", "UPDATE LOGO", "MAINTENANCE MODE", "GLOBAL ANNOUNCE",
        "GHOST MODE", "LIVE FEED", "ERROR LOGS", "SSL STATUS", "SECURITY SCAN", "REBOOT SERVER",
        "FORCE LOGOUT", "THEME SETTINGS", "EXPORT DATA", "DB OPTIMIZER", "WHITE LIST IP", "MULTI ADMIN",
        "SYSTEM INFO", "UPLOAD TOOL", "EDIT HOME PAGE", "FILE ENCRYPT", "TASK MANAGER", "BOT CONTROL",
        "NETWORK STATS", "LOG WIPER", "HISTORY VIEW", "CMD PROMPT", "UPDATE CORE", "LICENSE MGMT", "TERMINATE ALL"
    ]
    
    grid_html = "".join([f'<a href="/action/{t}" class="tool-btn {"danger" if "LOCK" in t or "TERMINATE" in t else ""}">{i+1}. {t}</a>' for i, t in enumerate(tools)])

    return render_template_string(f'''{STYLE}
        <canvas id="matrix"></canvas>
        <div class="header"><h1>MR. BALOCH</h1></div>
        <div class="control-grid">{grid_html}</div>
        <script>
            const canvas = document.getElementById('matrix'); const ctx = canvas.getContext('2d');
            canvas.width = window.innerWidth; canvas.height = window.innerHeight;
            const letters = "01BALOCH"; const fontSize = 18;
            const columns = canvas.width / fontSize; const drops = Array(Math.floor(columns)).fill(1);
            function draw() {{
                ctx.fillStyle = "rgba(0, 0, 0, 0.1)"; ctx.fillRect(0, 0, canvas.width, canvas.height);
                ctx.fillStyle = "#00fbff"; ctx.font = fontSize + "px monospace";
                for (let i = 0; i < drops.length; i++) {{
                    const text = letters[Math.floor(Math.random() * letters.length)];
                    ctx.fillText(text, i * fontSize, drops[i] * fontSize);
                    if (drops[i] * fontSize > canvas.height && Math.random() > 0.975) drops[i] = 0;
                    drops[i]++;
                }}
            }} setInterval(draw, 33);
        </script>''')

@app.route('/action/<cmd>')
def handle_action(cmd):
    if not session.get('logged'): return redirect('/')
    if cmd == "USER MESSAGES":
        messages = Message.query.order_by(Message.time.desc()).all()
        msg_html = "".join([f'<div class="msg-box"><b>{m.sender}</b>: {m.content}<br><small>{m.time}</small></div>' for m in messages])
        return render_template_string(f'{STYLE}<div class="header"><h1>MESSAGES</h1></div>{msg_html or "<h3>NO MESSAGES</h3>"}<a href="/dashboard" class="big-back-btn">BACK</a>')
    return render_template_string(f'{STYLE}<h1>COMMAND: {cmd}</h1><p>Running Execution...</p><a href="/dashboard" class="big-back-btn">BACK</a>')

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    app.run()
