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
            Container(
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
                  color: Color.fromARGB(255, 0, 134, 76),
                  width: 2.0,
                )),
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  hintText: 'email@example.com',
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 158, 158, 158),
                  ),
                  icon: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 0, 134, 76),
                  ),
                  border: InputBorder.none,
                ),
                onSaved: (value) {
                  loginData.email = value!;
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
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
                  color: Color.fromARGB(255, 0, 134, 76),
                  width: 2.0,
                )),
              ),
              child: TextFormField(
                obscureText: true,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 158, 158, 158),
                  ),
                  icon: Icon(
                    Icons.key,
                    color: Color.fromARGB(255, 0, 134, 76),
                  ),
                  border: InputBorder.none,
                ),
                onSaved: (value) {
                  loginData.password = value!;
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
