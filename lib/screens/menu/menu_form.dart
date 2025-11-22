import 'package:aplikasi_kasir/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

enum MenuType { kilogram, pcs }

class MenuForm extends StatefulWidget {
  const MenuForm({super.key});

  @override
  State<MenuForm> createState() => _MenuFormState();
}

class _MenuFormState extends State<MenuForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  MenuType? _type = MenuType.kilogram;
  String get typeString => _type == MenuType.kilogram ? "Kg" : "Pcs";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // INPUT NAMA
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Nama"),
              validator: (value) => value == null || value.isEmpty
                  ? "Nama tidak boleh kosong!"
                  : null,
            ),

            // INPUT HARGA
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: "Masukkan Harga"),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) {
                if (value.startsWith("0")) {
                  _priceController.text = value.substring(1);
                }
              },
            ),

            // RADIO BUTTON UNTUK TIPE LAUNDRY
            Text("Jenis Laundry"),
            RadioGroup<MenuType>(
              groupValue: _type,
              onChanged: (value) {
                setState(() {
                  _type = value;
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

            // BUTTON SAVE DATA BARU
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final menuBox = Hive.box<Menu>('items');

                  final newMenu = Menu(
                    name: _nameController.text,
                    price: double.parse(_priceController.text),
                    type: typeString,
                  );

                  final key = await menuBox.add(newMenu);

                  newMenu.id = key;

                  await menuBox.put(key, newMenu);

                  Navigator.pop(context, true);
                }
              },
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
