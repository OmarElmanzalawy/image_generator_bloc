import 'package:flutter/material.dart';

class IconActionButton extends StatelessWidget {
  const IconActionButton({
    super.key,
    this.backgroundColor,
    this.borderRadius,
    this.onpressed,
    required this.title,
    required this.icon,
    this.foregroundColor,
    this.iconColor,
  });

  final Color? backgroundColor;
  final double? borderRadius;
  final VoidCallback? onpressed;
  final String title;
  final IconData icon;
  final Color? foregroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor ?? Colors.deepPurple,
        ),
        foregroundColor: WidgetStatePropertyAll(foregroundColor),
        iconColor: WidgetStatePropertyAll(iconColor),
      ),
      onPressed:
          onpressed ??
          () {
            // await ApiRepo.generateImage(_promptController.text);
          },
      icon: Icon(icon),
      label: Text(title),
    );
  }
}
