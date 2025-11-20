// import 'package:aplikasi_kasir/models/menu.dart';
// import 'package:aplikasi_kasir/models/customer.dart';
// import 'package:aplikasi_kasir/widgets/sidebar.dart';
// import 'package:flutter/material.dart';

// class TransactionScreen extends StatefulWidget {
//   const TransactionScreen({super.key});

//   @override
//   State<TransactionScreen> createState() => _TransactionScreenState();
// }

// class _TransactionScreenState extends State<TransactionScreen> {
//   String? customer;
//   String? menu;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Sidebar(),
//       appBar: AppBar(title: Text("Transaksi")),
//       body: Padding(
//         padding: const EdgeInsets.all(14),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Nama Pelanggan",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             DropdownButton<String>(
//               items: customerList.map((Customer customer) {
//                 return DropdownMenuItem<String>(
//                   value: customer.id,
//                   child: Text(customer.name),
//                 );
//               }).toList(),
//               value: customer,
//               hint: const Text("Nama"),
//               onChanged: (String? value) {
//                 setState(() {
//                   customer = value;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             const Text(
//               "Jenis Laundry",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             DropdownButton<String>(
//               items: menuList.map((Menu menu) {
//                 return DropdownMenuItem<String>(
//                   value: menu.id,
//                   child: Text(menu.name),
//                 );
//               }).toList(),
//               value: menu,
//               hint: const Text("Laundry"),
//               onChanged: (String? value) {
//                 setState(() {
//                   menu = value;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
