import 'package:flutter/material.dart';

class CustomHorizontalSizedBox extends StatelessWidget {
  const CustomHorizontalSizedBox({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) => SizedBox(width: width);
}
