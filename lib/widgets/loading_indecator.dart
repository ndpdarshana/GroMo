import 'package:flutter/material.dart';

class LoadingIndecator extends StatelessWidget {
  final bool visible;

  const LoadingIndecator({required this.visible, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.black54),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
