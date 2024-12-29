import os

class Config:
    SQLALCHEMY_DATABASE_URI = 'postgresql://postgres:102003@localhost:5432/OnlineStore'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = os.environ.get("SECRET_KEY", "your_secret_key_here") 