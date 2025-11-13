import 'package:flutter/material.dart';
// import 'package:untitled/3rd_pg_class.dart';

import '3rd_pg_class.dart';

class GoTo extends StatelessWidget {
  const GoTo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Thirdpage()),
          );
        },
        child: Text("3rd pg"),
      ),
    );
  }
}
