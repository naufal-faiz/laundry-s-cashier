import 'package:aplikasi_kasir/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class CustomerEditForm extends StatefulWidget {
  final int index;
  const CustomerEditForm({super.key, required this.index});

  @override
  State<CustomerEditForm> createState() => _CustomerEditFormState();
}

class _CustomerEditFormState extends State<CustomerEditForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();

    final box = Hive.box<Customer>('customers');
    final customer = box.getAt(widget.index)!;

    // AMBIL DN ISI DATA DARI CONTROLLER YANG SUDAH ADA
    nameController = TextEditingController(text: customer.name);
    phoneController = TextEditingController(text: customer.phone);
    addressController = TextEditingController(text: customer.address);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  // FUNGSI UNTUK UPDATE DATA PELANGGAN
  void updateCustomer() {
    if (_formKey.currentState!.validate()) {
      final box = Hive.box<Customer>('customers');

      final updatedCustomer = Customer(
        id: box.getAt(widget.index)!.id,
        name: nameController.text,
        phone: phoneController.text,
        address: addressController.text,
      );

      box.putAt(widget.index, updatedCustomer);

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // INPUT NAMA
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nama"),
              validator: (value) => value == null || value.isEmpty
                  ? "Nama tidak boleh kosong"
                  : null,
            ),

            // INPUT NOMOR HP
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(labelText: "Input Nomor"),
              validator: (value) =>
                  value!.isEmpty ? "Nomor tidak boleh kosong" : null,
              onChanged: (value) {
                if (value.startsWith("0")) {
                  phoneController.text = value.substring(1);
                  phoneController.selection = TextSelection.fromPosition(
                    TextPosition(offset: phoneController.text.length),
                  );
                }
              },
            ),

            // INPUT ALAMAT
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(labelText: "Input Alamat"),
              validator: (value) =>
                  value == null || value.isEmpty ? "Alamat harus diisi" : null,
            ),

            SizedBox(height: 20),

            // TOMBOL SAVE
            ElevatedButton(
              onPressed: () {
                updateCustomer();
              },
              child: const Text("Simpan Perubahan"),
            ),
          ],
        ),
      ),
    );
  }
}
