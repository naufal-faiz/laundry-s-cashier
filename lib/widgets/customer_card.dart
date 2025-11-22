import 'package:aplikasi_kasir/models/customer.dart';
import 'package:aplikasi_kasir/screens/customer/customer_detail.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerCard extends StatelessWidget {
  final Customer customer;
  final int index;

  Future<void> openWhatsapp(String phoneNumber, {String message = ""}) async {
    // NUMBER FORMATTER (TANPA SPASI DAN PLUS (+)
    final cleaned = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    final whatsappUrl = Uri.parse(
      "https://wa.me/$cleaned?text=${Uri.encodeFull(message)}",
    );

    if (!await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication)) {
      throw Exception("Tidak dapat membuka whatsapp");
    }
  }

  const CustomerCard({super.key, required this.customer, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomerDetail(index: index)),
        );
      },

      // },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NAMA PELANGGAN
                  Text(
                    customer.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // ALAMAT PELANGGAN
                  Text(customer.address, style: const TextStyle(fontSize: 10)),
                ],
              ),

              // TOMBOL ARAHKAN KE WHATSAPP
              IconButton(
                onPressed: () {
                  openWhatsapp(customer.phone);
                },
                icon: Icon(Icons.phone),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
