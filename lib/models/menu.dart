import 'package:hive/hive.dart';

part 'menu.g.dart';

@HiveType(typeId: 2)
class Menu {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double price;

  @HiveField(3)
  String type;

  Menu({
    this.id,
    required this.name,
    required this.price,
    required this.type,
  });
}