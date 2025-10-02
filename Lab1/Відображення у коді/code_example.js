class Customer {
  constructor(customer_id, name, email, phone = null) {
    this.customer_id = customer_id;
    this.name = name;
    this.email = email;
    this.phone = phone;

    this.addresses = [];
    this.orders = [];
  }
}

class Address {
  constructor(address_id, customer_id, street, city, postal_code) {
    this.address_id = address_id;
    this.customer_id = customer_id;
    this.street = street;
    this.city = city;
    this.postal_code = postal_code;
  }
}

class Order {
  constructor(order_id, customer_id, order_date, total_amount) {
    this.order_id = order_id;
    this.customer_id = customer_id;
    this.order_date = order_date;
    this.total_amount = total_amount;

    this.items = [];
    this.payment = null;
  }
}

class OrderItem {
  constructor(order_item_id, order_id, product_id, quantity, unit_price) {
    this.order_item_id = order_item_id;
    this.order_id = order_id;
    this.product_id = product_id;
    this.quantity = quantity;
    this.unit_price = unit_price;
  }
}

class Product {
  constructor(product_id, category_id, name, description, price) {
    this.product_id = product_id;
    this.category_id = category_id;
    this.name = name;
    this.description = description;
    this.price = price;
  }
}

class Category {
  constructor(category_id, name) {
    this.category_id = category_id;
    this.name = name;
  }
}

class Payment {
  constructor(payment_id, order_id, amount, method, status) {
    this.payment_id = payment_id;
    this.order_id = order_id;
    this.amount = amount;
    this.method = method;
    this.status = status;
  }
}
