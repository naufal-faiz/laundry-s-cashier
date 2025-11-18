import 'package:aplikasi_kasir/models/customer.dart';
import 'package:aplikasi_kasir/models/menu.dart';

class History {
  String id;
  // Customer customerId;
  // Menu menuId;
  String customerId;
  String menuId;

  History({required this.id, required this.customerId, required this.menuId});
}

List<History> historyList = [History(id: "1", customerId: "1", menuId: "1")];
