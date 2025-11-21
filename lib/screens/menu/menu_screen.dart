import 'package:aplikasi_kasir/models/menu.dart';
import 'package:aplikasi_kasir/screens/menu/menu_form.dart';
import 'package:aplikasi_kasir/widgets/menu_card.dart';
import 'package:aplikasi_kasir/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<Menu>('items');
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Menu")),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, _, __) {
          if (box.isEmpty) {
            return Center(child: Text("Kosong"));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final menu = box.getAt(index);
              return MenuCard(menu: menu!, index: index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
