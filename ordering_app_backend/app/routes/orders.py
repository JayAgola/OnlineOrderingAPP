from flask import Blueprint, jsonify
from flask_restful import Api, Resource, reqparse
from ..models import db, Order, OrderItem, Product

orders_bp = Blueprint('orders', __name__)
api = Api(orders_bp)

order_parser = reqparse.RequestParser()
order_parser.add_argument('user_id', type=int, required=True)
order_parser.add_argument('items', type=list, location='json', required=True)

class OrderResource(Resource):
    def post(self):
        args = order_parser.parse_args()
        user_id = args['user_id']
        items = args['items']

        if not items or not isinstance(items, list):
            return {"message": "Items must be a list of product_id and quantity pairs"}, 400

        order = Order(user_id=user_id, total_amount=0)
        db.session.add(order)
        db.session.flush()

        total_amount = 0
        for item in items:
            product_id = item.get('product_id')
            quantity = item.get('quantity')
            product = Product.query.get(product_id)
            if not product:
                db.session.rollback()
                return {"message": f"Product with id {product_id} not found"}, 404
            total_amount += product.price * quantity
            order_item = OrderItem(order_id=order.id, product_id=product_id, quantity=quantity, price=product.price)
            db.session.add(order_item)

        order.total_amount = total_amount
        db.session.commit()
        return {"message": "Order created", "order_id": order.id}, 201

api.add_resource(OrderResource, '/orders', '/orders/<int:order_id>')
