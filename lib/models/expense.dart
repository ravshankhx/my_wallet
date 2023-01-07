import 'package:flutter/material.dart';

class Expense {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final IconData icon;

  Expense({
    this.icon = Icons.ac_unit,
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
  });
}

class Expenses {
  List<Expense> _items = [
    Expense(
      id: 'e1',
      title: "Tarvuz",
      date: DateTime.now(),
      amount: 20000,
    ),
    Expense(
      id: 'e2',
      title: "Qovun",
      date: DateTime.now(),
      amount: 20000,
    ),
    Expense(
      id: 'e3',
      title: "Olma",
      date: DateTime.now(),
      amount: 20000,
    ),
    Expense(
      id: 'e4',
      title: "NewYork Bilet",
      date: DateTime.now(),
      amount: 20000,
    ),
  ];

  List<Expense> get items {
    return _items;
  }

  void addNewExpense(
    String title,
    double amount,
    DateTime date,
  ) {
    _items.add(
      Expense(
          id: "e${_items.length + 1}",
          title: title,
          date: date,
          amount: amount),
    );
  }
}
