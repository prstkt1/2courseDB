class Customer {
  constructor(customer_id, name, email, phone = null) {
    this.customer_id = customer_id;
    this.name = name;
    this.email = email;
    this.phone = phone;

    this.addresses = [];
    this.orders = [];
  }

  addAddress(address) {
    this.addresses.push(address);
  }

  addOrder(order) {
    this.orders.push(order);
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

  addItem(item) {
    this.items.push(item);
  }

  setPayment(payment) {
    this.payment = payment;
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

  getTotal() {
    return this.quantity * this.unit_price;
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

const electronics = new Category(1, "Electronics");
const phone = new Product(
  1,
  electronics.category_id,
  "Smartphone",
  "Latest model",
  1000
);
const laptop = new Product(
  2,
  electronics.category_id,
  "Laptop",
  "Lightweight",
  1500
);

const customer = new Customer(
  1,
  "Test User",
  "testuser@example.com",
  "+380123456789"
);

const address = new Address(
  1,
  customer.customer_id,
  "Testaddress",
  "Kyiv",
  "11001"
);
customer.addAddress(address);

const order = new Order(1, customer.customer_id, new Date(), 0);
customer.addOrder(order);

const item1 = new OrderItem(
  1,
  order.order_id,
  phone.product_id,
  2,
  phone.price
);
const item2 = new OrderItem(
  2,
  order.order_id,
  laptop.product_id,
  1,
  laptop.price
);

order.addItem(item1);
order.addItem(item2);

order.total_amount = order.items.reduce(
  (sum, item) => sum + item.getTotal(),
  0
);

const payment = new Payment(
  1,
  order.order_id,
  order.total_amount,
  "card",
  "completed"
);
order.setPayment(payment);

console.log("Customer:", customer.name);
console.log("Order №", order.order_id, "for the amount", order.total_amount);
console.log("Payment:", order.payment.method, "-", order.payment.status);
