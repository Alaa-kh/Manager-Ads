import 'package:flutter/material.dart';

class CustomVerticalSizedBox extends StatelessWidget {
  const CustomVerticalSizedBox({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}
