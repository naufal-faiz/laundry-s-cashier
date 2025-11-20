// import 'package:aplikasi_kasir/models/menu.dart';
// import 'package:aplikasi_kasir/screens/menu/menu_form.dart';
// import 'package:aplikasi_kasir/widgets/menu_card.dart';
// import 'package:aplikasi_kasir/widgets/sidebar.dart';
// import 'package:flutter/material.dart';

// class MenuScreen extends StatelessWidget {
//   const MenuScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Sidebar(),
//       appBar: AppBar(title: Text("Menu")),
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           return MenuCard(menu: menuList[index]);
//         },
//         itemCount: menuList.length,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => MenuForm()),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
