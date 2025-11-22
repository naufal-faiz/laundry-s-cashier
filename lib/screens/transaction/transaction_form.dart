import 'package:aplikasi_kasir/models/menu.dart';
import 'package:aplikasi_kasir/models/customer.dart';
import 'package:aplikasi_kasir/models/transaction.dart';
import 'package:aplikasi_kasir/models/transaction_item.dart';
import 'package:aplikasi_kasir/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  Customer? selectedCustomer;
  Menu? selectedMenu;
  final TextEditingController qtyController = TextEditingController();

  List<TransactionItem> cartItems = [];
  double total = 0;

  @override
  Widget build(BuildContext context) {
    final customerBox = Hive.box<Customer>('customers');
    final menuBox = Hive.box<Menu>('items');
    final transactionBox = Hive.box<Transaction>('transactions');

    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Transaksi Baru")),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nama Pelanggan",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // DROPDOWN UNTUK PILIH PELANGGAN
            DropdownButtonFormField<Customer>(
              decoration: const InputDecoration(labelText: "Pilih Pelanggan"),
              initialValue: selectedCustomer,
              items: customerBox.values
                  .map(
                    (customer) => DropdownMenuItem(
                      value: customer,
                      child: Text(customer.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCustomer = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // PEMBELIAN BARANG
            Row(
              children: [
                Expanded(
                  
                  // PILIH JENIS MENU
                  child: DropdownButtonFormField<Menu>(
                    decoration: const InputDecoration(
                      labelText: "Pilih Laundry",
                    ),
                    initialValue: selectedMenu,
                    items: menuBox.values
                        .map(
                          (menu) => DropdownMenuItem(
                            value: menu,
                            child: Text(menu.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedMenu = value;
                      });
                    },
                  ),
                ),

                const SizedBox(width: 10),

                // QUANTITY ATAU JUMLAH DARI SUATU PILIHAN
                SizedBox(
                  width: 80,
                  child: TextFormField(
                    controller: qtyController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: "Qty"),
                  ),
                ),

                const SizedBox(width: 10),
                Text(selectedMenu?.type ?? ""),
              ],
            ),
            const SizedBox(height: 20),

            // TOMBOL UNTUK UPDATE MENU SEKALIGUS TAMBAH DATA DIPILIH
            ElevatedButton(
              onPressed: () {
                if (selectedMenu == null || qtyController.text.isEmpty) return;

                final qty = double.tryParse(qtyController.text) ?? 1;
                final subtotal = selectedMenu!.price * qty;

                setState(() {
                  cartItems.add(
                    TransactionItem(
                      menu: selectedMenu!,
                      qty: qty,
                      totalPrice: subtotal,
                    ),
                  );
                  total += subtotal;
                  qtyController.clear();
                });
              },
              child: const Text("Tambah item"),
            ),

            const SizedBox(height: 20),

            // PREVIEW TOTAL HARGA
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];

                  return ListTile(
                    title: Text("${item.menu.name} (${item.menu.type})"),
                    subtitle: Text(
                      "${item.qty.toStringAsFixed(0)} x Rp. ${item.menu.price.toStringAsFixed(0)}",
                    ),
                    trailing: Text("Rp. ${item.totalPrice.toStringAsFixed(0)}"),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // TOTAL KESELURUHAN HARGA
            Text(
              "Total : Rp. ${total.toStringAsFixed(0)}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            // UPDATE UNTUK SIMPAN SELURUH DATA TRANSAKSI DAN OTOMATIS MENAMBAH TANGGAL DAN STATUS PENDING
            ElevatedButton(
              onPressed: () async {
                if (selectedCustomer == null || cartItems.isEmpty) return;

                final newTransaction = Transaction(
                  customerId: selectedCustomer!.id!,
                  items: cartItems,
                  status: "pending",
                  dateIn: DateTime.now(),
                  totalPrice: total,
                );

                final key = await transactionBox.add(newTransaction);
                newTransaction.id = key;
                await transactionBox.put(key, newTransaction);

                Navigator.pop(context, true);
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
