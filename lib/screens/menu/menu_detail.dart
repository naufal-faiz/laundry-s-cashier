import 'package:aplikasi_kasir/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

enum MenuType { kilogram, pcs }

class MenuDetail extends StatefulWidget {
  final int index;
  const MenuDetail({super.key, required this.index});

  @override
  State<MenuDetail> createState() => _MenuDetailState();
}

class _MenuDetailState extends State<MenuDetail> {
  final _formKey = GlobalKey<FormState>();

  late Menu menu;
  late TextEditingController nameController;
  late TextEditingController priceController;
  late MenuType selectedType;

  @override
  void initState() {
    super.initState();
    loadMenu();
  }

  // AMBIL DATA DARI STORAGE
  void loadMenu() {
    final box = Hive.box<Menu>('items');
    menu = box.getAt(widget.index)!;

    nameController = TextEditingController(text: menu.name);
    priceController = TextEditingController(
      text: menu.price.toStringAsFixed(0),
    );

    selectedType = menu.type == "Kg" ? MenuType.kilogram : MenuType.pcs;
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  // FUNCTION UPDATE DATA JIKA INGIN MELAKUKAN PEMBARUAN
  void updateMenu() async {
    if (_formKey.currentState!.validate()) {
      final box = Hive.box<Menu>('items');

      menu.name = nameController.text;
      menu.price = double.parse(priceController.text);
      menu.type = (selectedType == MenuType.kilogram) ? "Kg" : "Pcs";

      await box.putAt(widget.index, menu);

      setState(() {
        loadMenu();
      });

      // PESAN SNACKBAR (MUNCUL DARI BAWAH)
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Berubah!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              updateMenu();
            },
            child: Text("Simpan"),
          ),
        ],
      ),

      // HALAMAN FORM
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Nama Menu
            Text("Nama Menu"),
            TextFormField(
              controller: nameController,
              validator: (v) => v!.isEmpty ? "Nama tidak boleh kosong" : null,
            ),

            // HARGA MENU
            SizedBox(height: 16),
            Text("Harga"),
            TextFormField(
              controller: priceController,
              keyboardType: TextInputType.number,
              validator: (v) => v!.isEmpty ? "Harga wajib diisi" : null,
            ),

            // JENIS
            SizedBox(height: 16),
            const Text("Jenis Laundry"),
            RadioGroup<MenuType>(
              groupValue: selectedType,
              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                });
              },
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: const ListTile(
                      title: Text("Kg"),
                      leading: Radio<MenuType>(value: MenuType.kilogram),
                    ),
                  ),
                  Expanded(
                    child: const ListTile(
                      title: Text("Pcs"),
                      leading: Radio<MenuType>(value: MenuType.pcs),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // PEMBATAS
            Divider(),

            // PREVEW
            Text("Preview:", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Nama: ${menu.name}"),
            Text("Harga: Rp ${menu.price.toStringAsFixed(0)}"),
            Text("Tipe: ${menu.type}"),
          ],
        ),
      ),
    );
  }
}
