import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({this.customAppBarTitle});
  final customAppBarTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: customAppBarTitle,
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 1,
      foregroundColor: Colors.black,
    );
  }
}
