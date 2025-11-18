import 'package:aplikasi_kasir/models/customer.dart';
import 'package:aplikasi_kasir/models/menu.dart';

class History {
  String id;
  Customer customerId;
  Menu menuId;

  History({required this.id, required this.customerId, required this.menuId});
}

List<History> historyList = [
  History(
    id: "1",
    customerId: customerList.firstWhere((customer) => customer.id == "1"),
    menuId: menuList.firstWhere((menu) => menu.id == "2"),
  ),
  History(
    id: "2",
    customerId: customerList.firstWhere((customer) => customer.id == "2"),
    menuId: menuList.firstWhere((menu) => menu.id == "3"),
  ),
];
