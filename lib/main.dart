// import 'package:aplikasi_kasir/database/seeder.dart';
import 'package:aplikasi_kasir/models/customer.dart';
import 'package:aplikasi_kasir/models/menu.dart';
import 'package:aplikasi_kasir/models/transaction.dart';
import 'package:aplikasi_kasir/models/transaction_item.dart';
// import 'package:aplikasi_kasir/screens/history_screen.dart';
import 'package:aplikasi_kasir/screens/home_screen.dart';
import 'package:aplikasi_kasir/screens/menu/menu_screen.dart';
import 'package:aplikasi_kasir/screens/customer/customer_screen.dart';
import 'package:aplikasi_kasir/screens/transaction/transaction_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

  // REGISTER ADAPTER
  Hive.registerAdapter(CustomerAdapter());
  Hive.registerAdapter(MenuAdapter());
  Hive.registerAdapter(TransactionItemAdapter());
  Hive.registerAdapter(TransactionAdapter());

  // OPENBOX
  await Hive.openBox<Customer>('customers');
  await Hive.openBox<Menu>('items');
  await Hive.openBox<Transaction>('transactions');

  // await Seeder.seedCustomers();
  runApp(CashierApp());
}

class CashierApp extends StatelessWidget {
  const CashierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cashier App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: 'Poppins',
        // scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/customer': (context) => CustomerScreen(),
        '/menu': (context) => MenuScreen(),
        '/transaction': (context) => TransactionScreen(),
        // '/history': (context) => HistoryScreen(),
      },
    );
  }
}
