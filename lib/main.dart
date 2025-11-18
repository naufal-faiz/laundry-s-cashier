import 'package:aplikasi_kasir/screens/homepage.dart';
import 'package:aplikasi_kasir/screens/menu.dart';
import 'package:aplikasi_kasir/screens/customer.dart';
import 'package:aplikasi_kasir/screens/transaction.dart';
import 'package:flutter/material.dart';

var primaryClr = const Color.fromRGBO(60, 70, 123, 100);
var secondaryClr = const Color.fromRGBO(80, 88, 156, 100);
var thirdClr = const Color.fromRGBO(99, 108, 203, 100);
var fourthClr = const Color.fromRGBO(110, 140, 251, 100);

void main() => runApp(CashierApp());

class CashierApp extends StatelessWidget {
  const CashierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cashier App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
          backgroundColor: secondaryClr,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: fourthClr,
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/customer': (context) => CustomerPage(),
        '/menu': (context) => MenuPage(),
        '/transaction': (context) => Transaction(),
      },
    );
  }
}
