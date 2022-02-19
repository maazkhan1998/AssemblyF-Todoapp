import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final void Function() onPress;
  const CustomButton(
      {Key? key,
      required this.onPress,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          child: child,
          onPressed: onPress,
        ));
  }
}
