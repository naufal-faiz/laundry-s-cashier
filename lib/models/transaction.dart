import 'package:aplikasi_kasir/models/transaction_item.dart';
import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 4)
class Transaction {
  @HiveField(0)
  int? id;

  @HiveField(1)
  int customerId;

  @HiveField(2)
  List<TransactionItem> items;

  @HiveField(3)
  String status;

  @HiveField(4)
  DateTime dateIn;

  @HiveField(5)
  double totalPrice;

  Transaction({
    this.id,
    required this.customerId,
    required this.items,
    required this.status,
    required this.dateIn,
    required this.totalPrice,
  });
}
