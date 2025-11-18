class Customer {
  String id;
  String name;
  String address;

  Customer({required this.id, required this.name, required this.address});
}

final List<Customer> customerList = [
  Customer(id: '1', name: 'John Doe', address: '123 Main St'),
  Customer(id: '2', name: 'Jane Smith', address: '456 Elm St'),
  Customer(id: '3', name: 'Alice Johnson', address: '789 Oak St'),
  Customer(id: '4', name: 'Bob Brown', address: '101 Pine St'),
  Customer(id: '5', name: 'Charlie Davis', address: '202 Maple St'),
];
