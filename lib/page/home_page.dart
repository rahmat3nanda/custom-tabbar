import 'package:custom_tabbar/widget/tabbar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        bottom: TabbarWidget(
          activeColor: Colors.red,
          bgColor: Colors.green,
          onSelected: (i){
            print(i);
          },
          children: [
            Text("Nama"),
            Text("NIM"),
            Text("Kelas"),
          ],
        ),
      ),
    );
  }
}
