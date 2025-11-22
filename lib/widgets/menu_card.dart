import 'package:aplikasi_kasir/models/menu.dart';
import 'package:aplikasi_kasir/screens/menu/menu_detail.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;
  final int index;

  const MenuCard({super.key, required this.menu, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuDetail(index: index)),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // NAMA MENU
                  Text(
                    menu.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // HARGA MENU
                  Text(
                    "Harga: Rp ${menu.price.toStringAsFixed(0)}",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              Row(
                children: [
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.delete, color: Colors.red),
                  // ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.edit, color: Colors.white),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
