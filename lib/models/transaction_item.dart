import 'package:aplikasi_kasir/models/menu.dart';
import 'package:hive/hive.dart';

part 'transaction_item.g.dart';

@HiveType(typeId: 3)
class TransactionItem {
  @HiveField(0)
  Menu menu;

  @HiveField(1)
  double qty;

  @HiveField(2)
  double totalPrice;

  TransactionItem({
    required this.menu,
    required this.qty,
    required this.totalPrice,
  });
}
