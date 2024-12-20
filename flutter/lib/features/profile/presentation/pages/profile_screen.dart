import 'package:agendify/core/components/app_bar_component.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: 'Perfil'),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1D1D29),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xFFD9D9D9),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.black38,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Agenda Odontológica",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  "example@gmail.com",
                  style: TextStyle(
                    color: Color(0xFF7A7A7A),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
