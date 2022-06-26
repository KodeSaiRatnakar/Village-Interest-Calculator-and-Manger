import 'package:flutter/material.dart';

class Lending_page extends StatefulWidget {
  const Lending_page({Key? key}) : super(key: key);

  @override
  State<Lending_page> createState() => _Lending_pageState();
}

class _Lending_pageState extends State<Lending_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF33E2AE), Colors.white])),
      ),
    );
  }
}
