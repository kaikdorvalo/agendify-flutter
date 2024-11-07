import 'package:agendify/features/auth/presentation/components/auth_input_component.dart';
import 'package:agendify/features/auth/presentation/components/auth_submit_button_component.dart';
import 'package:agendify/features/main/presentation/pages/main_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  _LoginData loginData = _LoginData();

  void _submit() {
    _formKey.currentState?.save();

    if (authSignIn()) {
      goToHomeScreen();
    }
  }

  void goToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }

  void setEmail(String email) {
    setState(() {
      loginData.email = email;
    });
  }

  void setPassword(String password) {
    setState(() {
      loginData.password = password;
    });
  }

  bool authSignIn() {
    return (loginData.email == 'example@gmail.com' &&
        loginData.password == '123');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 3, 0, 41),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 50.0,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Agendify',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Entrar na sua conta',
                  style: TextStyle(
                    color: Color.fromARGB(255, 98, 97, 130),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            AuthInputComponent(
              changeValue: setEmail,
              hintText: 'example@gmail.com',
              labelText: 'Email',
              icon: Icons.email,
            ),
            const SizedBox(
              height: 20.0,
            ),
            AuthInputComponent(
              obscureText: true,
              changeValue: setPassword,
              hintText: '',
              labelText: 'Senha',
              icon: Icons.key,
            ),
            const SizedBox(
              height: 40.0,
            ),
            AuthSubmitButtonComponent(submit: _submit)
          ],
        ),
      ),
    ));
  }
}
