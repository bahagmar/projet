import 'package:flutter/material.dart';
import 'package:flutterapp12/sidebar/sidebar_layout.dart';


class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white
      ),
      home: SideBarLayout(),

    )
    );
  }
}