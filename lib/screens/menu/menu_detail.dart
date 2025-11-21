import 'package:aplikasi_kasir/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MenuDetail extends StatefulWidget {
  final int index;
  const MenuDetail({super.key, required this.index});

  @override
  State<MenuDetail> createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  late Menu menu;

  @override
  void initState() {
    super.initState();
    final box = Hive.box<Menu>('items');
    menu = box.getAt(widget.index)!;
  }

  void reloadMenu() {
    setState(() {
      final box = Hive.box<Menu>('items');
      menu = box.getAt(widget.index)!;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(menu.name), Text("Rp. ${menu.price.toStringAsFixed(0)}"), Text(menu.type)],
      ),
    );
  }
}
