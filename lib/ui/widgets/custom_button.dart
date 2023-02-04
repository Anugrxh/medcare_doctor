import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isIconButton;
  final Function() onTap;
  final String? label;
  final Color buttonColor, labelColor;
  const CustomButton({
    Key? key,
    this.isIconButton = false,
    required this.onTap,
    this.label,
    this.buttonColor = const Color(0xFFFCFCFC),
    this.labelColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: isIconButton
              ? const Icon(
                  Icons.add,
                  color: Color(0xFF1F5656),
                  size: 18,
                )
              : Text(
                  label!,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: labelColor,
                      ),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}