import 'package:flutter/material.dart';
import 'package:healthcare/const/colors.dart';
import 'package:healthcare/const/styles.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.onTap,
    required this.text,
    this.color = primaryColor,
    this.dense = false,
    this.height = 48,
    this.width = double.infinity,
    this.noIcon = false,
    this.fontSize,
    this.icon = Icons.arrow_forward,
  });

  final void Function()? onTap;
  final String text;
  final Color color;
  final bool dense;
  final double height;
  final double width;
  final bool noIcon;
  final double? fontSize;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: dense ? 28 : height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(dense ? 23 : 8),
          boxShadow: !dense
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.24),
                    blurRadius: 24,
                    offset: const Offset(0, 16),
                  ),
                ]
              : [],
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                text,
                style: labelStyle.copyWith(
                  color: Colors.white,
                  fontSize: dense ? 12 : fontSize,
                ),
              ),
            ),
            !dense && !noIcon
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
