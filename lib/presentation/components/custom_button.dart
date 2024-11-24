import 'package:flutter/material.dart';
import 'package:task_n1/presentation/theme/theme.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String text;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: Style.regular12(),
      ),
    );
  }
}