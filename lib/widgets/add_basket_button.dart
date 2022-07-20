import 'package:flutter/material.dart';
import '../app_constants/app_strings.dart';

class AddBasketButton extends StatelessWidget {
  const AddBasketButton({
    Key? key, required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      child: Text(sepeteEkleText)
    );
  }
}