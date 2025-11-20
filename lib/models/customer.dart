import 'package:hive/hive.dart';
part 'customer.g.dart';

@HiveType(typeId: 1)
class Customer {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String address;
  
  @HiveField(3)
  String phone;

  Customer({
    this.id,
    required this.name,
    required this.phone,
    required this.address,
  });
}