import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [

          // PROFIL USER
          UserAccountsDrawerHeader(
            accountName: Text("Shanum Laundry"),
            accountEmail: Text("VGH 5"),
          ),

          // BERANDA
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),

          // MENU
          ListTile(
            leading: Icon(Icons.menu),
            title: Text("Menu"),
            onTap: () {
              Navigator.pushNamed(context, '/menu');
            },
          ),

          // PELANGGAN
          ListTile(
            leading: Icon(Icons.person_2),
            title: Text("Customer"),
            onTap: () {
              Navigator.pushNamed(context, '/customer');
            },
          ),

          // TRANSAKSI
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text("Transaction"),
            onTap: () {
              Navigator.pushNamed(context, '/transaction');
            },
          ),

          // RIWAYAT
          ListTile(
            leading: Icon(Icons.history),
            title: Text("History"),
            onTap: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
        ],
      ),
    );
  }
}
