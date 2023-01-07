import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {

  final Function addNewExpense;
  AddExpense(this.addNewExpense);
  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  DateTime? selectedDate;



  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void showNewExpenseCalendar(BuildContext context) {
    showDatePicker(
            helpText: "Xarajat kunini tanlang",
            cancelText: "BEKOR QILISH",
            confirmText: "TANLASH",
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        if (value != null) {
          selectedDate = value;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: "Xarajat nomi"),
          ),
          TextField(
            controller: amountController,
            decoration: InputDecoration(labelText: "Xarajat miqdori"),
            keyboardType: TextInputType.number,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              selectedDate == null
                  ? Text("Xarajat kuni tanlanmadi!")
                  : Text(
                      "Xarajat kuni:  ${DateFormat("dd MMMM, y").format(selectedDate!)}",
                    ),
              TextButton(
                onPressed: () {
                  showNewExpenseCalendar(context);
                },
                child: Text("KUNNI TANLASH"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              selectedDate == null
                  ? Text("Icon tanlanmadi")
                  : Text(
                      "Xarajat kuni:  ${DateFormat("dd MMMM, y").format(selectedDate!)}",
                    ),
              TextButton(
                onPressed: () {
                  showNewExpenseCalendar(context);
                },
                child: Text("ICONNI TANLASH"),
              ),
            ],
          ), //iconka
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("BEKOR QILISH")),
              ElevatedButton(
                  onPressed: () {
                    print(titleController.text);
                    print(amountController.text);
                    if (titleController.text.isEmpty ||
                        amountController.text.isEmpty ||
                        selectedDate == null) {
                      return;
                    }
                    var title =titleController.text;
                    var amount =double.parse(amountController.text);
                    if(amount<=0){
                      return;
                    }
                    widget.addNewExpense(title,amount,selectedDate);
                    Navigator.of(context).pop();

                  },
                  child: Text("KIRITISH"))
            ],
          )
        ],
      ),
    );
  }
}
