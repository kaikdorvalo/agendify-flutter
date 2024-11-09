import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  final Function() click;
  String label;

  SubmitButton({
    super.key,
    required this.click,
    required this.label,
  });

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.click();
      },
      child: Container(
          padding: const EdgeInsets.only(
            top: 15.0,
            bottom: 15.0,
            left: 15.0,
            right: 15.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: const Color.fromARGB(255, 33, 149, 243),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          )),
    );
  }
}
