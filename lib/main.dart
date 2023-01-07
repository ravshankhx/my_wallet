import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';
import 'package:my_wallet/widgets/add_expense.dart';
import 'package:my_wallet/widgets/header.dart';
import 'package:my_wallet/widgets/body.dart';

import 'models/expense.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: MyWallet(),
    );
  }
}

class MyWallet extends StatefulWidget {
  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  DateTime selectedDate = DateTime.now();
  Expenses expenseData = Expenses();

  void showCalendar(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        if (value != null) {
          selectedDate = value;
        }
      });
    });
  }

  void previousMonth() {
    if (selectedDate.year == 2021 && selectedDate.month == 1) {
      return;
    }
    setState(() {
      selectedDate =
          DateTime(selectedDate.year, selectedDate.month - 1, selectedDate.day);
    });
  }

  void nextMonth() {
    if (selectedDate.year == DateTime.now().year &&
        selectedDate.month == DateTime.now().month) {
      return;
    }
    setState(() {
      selectedDate =
          DateTime(selectedDate.year, selectedDate.month + 1, selectedDate.day);
    });
  }

  void showExpenseWindow(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
        context: context,
        builder: (ctx) {
          return AddExpense(addNewExpense);
        });
  }


  void addNewExpense(String title, double amount , DateTime date){
    setState(() {
      expenseData.addNewExpense(title, amount, date);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Wallet"),
      ),
      body: Column(
        children: [
          Header(showCalendar, selectedDate, previousMonth, nextMonth),
          Body(expenseData.items),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showExpenseWindow(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
