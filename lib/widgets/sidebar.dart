import 'package:aplikasi_kasir/main.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: thirdClr,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Shanum Laundry"),
            accountEmail: Text("VGH 5"),
            decoration: BoxDecoration(color: secondaryClr),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white),
            title: Text("Home", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.menu, color: Colors.white),
            title: Text("Menu", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/menu');
            },
          ),
          ListTile(
            leading: Icon(Icons.person_2, color: Colors.white),
            title: Text("Customer", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/customer');
            },
          ),
          ListTile(
            leading: Icon(Icons.history, color: Colors.white),
            title: Text("History", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/transaction');
            },
          ),
        ],
      ),
    );
  }
}
