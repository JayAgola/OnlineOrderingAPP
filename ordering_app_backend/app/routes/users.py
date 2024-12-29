from flask import Blueprint, jsonify
from flask_restful import Api, Resource, reqparse
from werkzeug.security import generate_password_hash, check_password_hash
from ..models import db, User

users_bp = Blueprint('users', __name__)
api = Api(users_bp)

user_parser = reqparse.RequestParser()
user_parser.add_argument('name', type=str, required=True)
user_parser.add_argument('email', type=str, required=True)
user_parser.add_argument('password', type=str, required=True)

login_parser = reqparse.RequestParser()
login_parser.add_argument('email', type=str, required=True)
login_parser.add_argument('password', type=str, required=True)

class UserResource(Resource):
    def post(self):
        args = user_parser.parse_args()
        if User.query.filter_by(email=args['email']).first():
            return {"message": "Email already registered"}, 400
        hashed_password = generate_password_hash(args['password'])
        user = User(name=args['name'], email=args['email'], password=hashed_password)
        db.session.add(user)
        db.session.commit()
        return {"message": "User created successfully", "user_id": user.id}, 201

    def delete(self, user_id):
        user = User.query.get(user_id)
        if user:
            db.session.delete(user)
            db.session.commit()
            return {"message": "User deleted successfully"}, 200
        return {"message": "User not found"}, 404

class LoginResource(Resource):
    def post(self):
        args = login_parser.parse_args()
        user = User.query.filter_by(email=args['email']).first()
        if not user or not check_password_hash(user.password, args['password']):
            return {"message": "Invalid email or password"}, 401
        return {"message": "Login successful", "user_id": user.id ,"name" : user.name, "email" :user.email,"password":user.password}, 200

api.add_resource(UserResource, '/users', '/users/<int:user_id>')
api.add_resource(LoginResource, '/login')
