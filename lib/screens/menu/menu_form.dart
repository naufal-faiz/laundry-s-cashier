// import 'package:aplikasi_kasir/models/menu.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive/hive.dart';

// class MenuForm extends StatefulWidget {
//   const MenuForm({super.key});

//   @override
//   State<MenuForm> createState() => _MenuFormState();
// }

// class _MenuFormState extends State<MenuForm> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _priceController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: "Nama"),
//               validator: (value) => value == null || value.isEmpty
//                   ? "Nama tidak boleh kosong!"
//                   : null,
//             ),
//             TextFormField(
//               controller: _priceController,
//               decoration: const InputDecoration(labelText: "Masukkan Harga"),
//               keyboardType: TextInputType.number,
//               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//             ),

//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 if (_formKey.currentState!.validate()) {
//                   final menuBox = Hive.box<Menu>('items');

//                   final newMenu = Menu(name: _priceController.text, price: _priceController.value);
//                 }
//               },
//               child: Text("Simpan"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
