import 'package:flutter/cupertino.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      padding: const EdgeInsets.all(20),
      child: child,
    );
  }
}
