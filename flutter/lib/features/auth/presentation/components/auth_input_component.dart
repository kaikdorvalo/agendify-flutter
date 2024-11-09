import 'package:flutter/material.dart';

class AuthInputComponent extends StatefulWidget {
  final Function(String) changeValue;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final IconData icon;

  const AuthInputComponent({
    super.key,
    required this.changeValue,
    required this.hintText,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
  });

  @override
  _AuthComponentInputState createState() => _AuthComponentInputState();
}

class _AuthComponentInputState extends State<AuthInputComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        left: 20.0,
        right: 20.0,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 30, 28, 66),
        borderRadius: BorderRadius.circular(20.0),
        border: const Border(
            bottom: BorderSide(
          color: Color.fromARGB(255, 33, 149, 243),
          width: 2.0,
        )),
      ),
      child: TextFormField(
        obscureText: widget.obscureText,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 158, 158, 158),
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 158, 158, 158),
          ),
          icon: Icon(
            widget.icon,
            color: Color.fromARGB(255, 33, 149, 243),
          ),
          border: InputBorder.none,
        ),
        onSaved: (value) {
          setState(() {
            widget.changeValue(value!);
          });
        },
      ),
    );
  }
}
