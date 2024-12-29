from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from app.config import Config
from app.models import db
from flask_migrate import Migrate

# db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    migrate = Migrate(app, db)
    # Initialize database
    db.init_app(app)
    # Register routes
    from app.routes import register_routes
    register_routes(app)
    return app
