import 'package:flutter/material.dart';

class Thirdpage extends StatelessWidget {
  var data2;

  Thirdpage({super.key});
  second() {
    data2 = data2;
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(title: Text("3rd Page")),
      body: Text("This is third Page"),
    );
  }
}
