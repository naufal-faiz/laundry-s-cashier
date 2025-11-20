import 'package:aplikasi_kasir/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({super.key});

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Input Nama"),
              validator: (value) =>
                  value!.isEmpty ? "Nama tidak boleh kosong" : null,
            ),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(labelText: "Input Nomor"),
              validator: (value) =>
                  value!.isEmpty ? "Nomor tidak boleh kosong" : null,
              onChanged: (value) {
                if (value.startsWith("0")) {
                  _phoneController.text = value.substring(1);
                  _phoneController.selection = TextSelection.fromPosition(
                    TextPosition(offset: _phoneController.text.length),
                  );
                }
              },
            ),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: "Input Alamat"),
              validator: (value) =>
                  value!.isEmpty ? "Alamat tidak boleh kosong" : null,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final customerBox = Hive.box<Customer>('customers');

                  final newCustomer = Customer(
                    name: _nameController.text,
                    address: _addressController.text,
                    phone: "62${_phoneController.text}",
                  );

                  final key = await customerBox.add(newCustomer);

                  newCustomer.id = key;

                  await customerBox.put(key, newCustomer);

                  Navigator.pop(context);
                }
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
