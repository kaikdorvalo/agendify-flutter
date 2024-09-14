import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  final Function() click;

  SubmitButton({
    Key? key,
    required this.click,
  }) : super(key: key);

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
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Agendar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          )),
    );
  }
}
