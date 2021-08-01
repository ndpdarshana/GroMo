import 'package:flutter/material.dart';

class LoadingIndecator extends StatelessWidget {
  final bool visible;

  const LoadingIndecator({required this.visible});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.black54),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
