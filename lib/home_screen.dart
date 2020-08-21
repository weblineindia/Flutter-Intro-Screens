import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Home', style: TextStyle(color: Colors.white)),
          brightness: Brightness.dark),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: MediaQuery.of(context).size.height * 0.20,
              width: 350.0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              width: 50,
            ),
            const Text('Welcome',
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w900,
                )),
          ],
        ),
      ),
    );
  }
}
