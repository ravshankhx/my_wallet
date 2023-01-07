import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 5,
      decoration: BoxDecoration(
        color: Color.fromRGBO(212, 219, 239, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(
            5,
          ),
        ),
      ),
      child: FractionallySizedBox(
        heightFactor: 2,
        widthFactor: 0.5,
        child: Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.red, Colors.red.shade200, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.red,
                blurRadius: 10,
                spreadRadius: -3,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
