import 'package:attendance_management_system/presentation/resources/res.dart';
import 'package:flutter/material.dart';

class defaultButton extends StatelessWidget {
  const defaultButton(
      {Key? key, required this.onPress, required this.title, required})
      : super(key: key);

  final VoidCallback onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 5),
        height: 60.0,
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            title,
            style: styles.regularText,
          ),
        ]),
      ),
    );
  }
}