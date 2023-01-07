import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;

  ExpenseList(this.expenses);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: MediaQuery.of(context).size.width,
        height: 550,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 10, right: 5),
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
              ),
              title: Text(
                expenses[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                DateFormat("dd MMMM, y").format(expenses[index].date),
                style: TextStyle(fontSize: 15),
              ),
              trailing: Text("${expenses[index].amount} so'm"),
            );
          },
          itemCount: expenses.length,
        ),
      ),
    );
  }
}
