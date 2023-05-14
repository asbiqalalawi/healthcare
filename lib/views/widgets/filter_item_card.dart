import 'package:flutter/material.dart';

import 'package:healthcare/const/colors.dart';
import 'package:healthcare/const/styles.dart';

class FilterItemCard extends StatelessWidget {
  const FilterItemCard({
    Key? key,
    required this.isActive,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final bool isActive;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 40),
        height: 30,
        padding: const EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: isActive ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: isActive ? primaryColor.withOpacity(0.24) : greyEBE.withOpacity(0.24),
              blurRadius: 24,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: labelStyle.copyWith(
              color: isActive ? Colors.white : primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
