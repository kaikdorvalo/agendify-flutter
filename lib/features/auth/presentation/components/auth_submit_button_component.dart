import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthSubmitButtonComponent extends StatelessWidget {
  final Function() submit;

  AuthSubmitButtonComponent({
    super.key,
    required this.submit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        submit();
      },
      child: InkWell(
        onTap: () {
          submit();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 129, 202, 250),
                Color.fromARGB(255, 20, 101, 187),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          height: 59.0,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: Text(
              'Entrar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
