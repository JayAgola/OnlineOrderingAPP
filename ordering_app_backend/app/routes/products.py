from flask import Blueprint, jsonify
from flask_restful import Api, Resource, reqparse
from ..models import db, Product

products_bp = Blueprint('products', __name__)
api = Api(products_bp)

product_parser = reqparse.RequestParser()
product_parser.add_argument('name', type=str, required=True)
product_parser.add_argument('description', type=str)
product_parser.add_argument('price', type=float, required=True)
product_parser.add_argument('image_url', type=str)

class ProductResource(Resource):
    def get(self, product_id=None):
        if product_id:
            product = Product.query.get(product_id)
            if product:
                return jsonify({"id": product.id, "name": product.name, "description": product.description, "price": product.price, "image_url": product.image_url})
            return {"message": "Product not found"}, 404
        products = Product.query.all()
        return jsonify([{"id": product.id, "name": product.name, "description": product.description, "price": product.price, "image_url": product.image_url} for product in products])

    def post(self):
        args = product_parser.parse_args()
        product = Product(name=args['name'], description=args['description'], price=args['price'], image_url=args['image_url'])
        db.session.add(product)
        db.session.commit()
        return {"message": "Product created", "product_id": product.id}, 201

api.add_resource(ProductResource, '/products', '/products/<int:product_id>')
