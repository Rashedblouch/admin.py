from app import db, User, app
from werkzeug.security import generate_password_hash

with app.app_context():
    # SET ADMIN CREDENTIALS
    admin_user = "baloch786" 
    admin_pass = "admin123"
    
    hashed_pw = generate_password_hash(admin_pass, method='pbkdf2:sha256')
    
    new_admin = User(username=admin_user, password=hashed_pw, role='admin')
    db.session.add(new_admin)
    db.session.commit()
    
    print("--- ADMIN ACCOUNT CREATED SUCCESSFULLY ---")
    print(f"ID: {admin_user}")
    print("ROLE: ADMIN")
