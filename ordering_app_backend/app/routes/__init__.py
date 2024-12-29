from flask import Blueprint
from .users import users_bp
from .products import products_bp
from .orders import orders_bp

def register_routes(app):
    app.register_blueprint(users_bp, url_prefix='/api')
    app.register_blueprint(products_bp, url_prefix='/api')
    app.register_blueprint(orders_bp, url_prefix='/api')