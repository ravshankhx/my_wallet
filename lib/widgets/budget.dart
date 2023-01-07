import 'package:flutter/material.dart';
import 'package:my_wallet/widgets/progress_bar.dart';

class Budget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 650,
      decoration: BoxDecoration(
        color: Color.fromRGBO(239, 240, 250, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Oylik byudjet",
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      size: 16,
                    ),
                    label: Text(
                      "1.000.000 so'm",
                    ),
                  ),
                ],
              ),
              Text(
                "4.9%",
              ),
            ],
          ),
          ProgressBar(),

        ],
      ),
    );
  }
}
