import 'package:hive/hive.dart';
import '../models/customer.dart';

class Seeder {
  static Future<void> seedCustomers() async {
    var customerBox = Hive.box<Customer>('customers');

    if (customerBox.isEmpty) {
      customerBox.put(
        "1",
        Customer(id: 1, name: "John Doe", phone: "0812345678", address: "Jalan Mawar"),
      );

      customerBox.put(
        "2",
        Customer(id: 2, name: "Jane Smith", phone: "0812223344", address: "Jalan Melati"),
      );

      customerBox.put(
        "3",
        Customer(id: 3, name: "Alice Johnson", phone: "0817778899", address: "Jalan Kenanga"),
      );
    }
  }
}
