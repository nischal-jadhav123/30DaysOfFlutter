import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int val = 20;
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: val == 10
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Container(
                child: Text("Hello World"),
              ),
            ),
      drawer: Drawer(),
    );
  }
}
