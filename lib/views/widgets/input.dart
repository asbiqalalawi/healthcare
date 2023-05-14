import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcare/const/colors.dart';
import 'package:healthcare/const/styles.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.isPassword = false,
    this.hidePassword = true,
    this.onTap,
    this.validator,
    this.forgotPassword = false,
    this.keyboardType,
  });

  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final bool hidePassword;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final bool forgotPassword;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              labelText,
              style: labelStyle,
            ),
            forgotPassword
                ? Text(
                    'Lupa Password anda ?',
                    style: subtitleStyle.copyWith(fontSize: 14),
                  )
                : const SizedBox(),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Stack(
          children: [
            Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: greyEBE.withOpacity(0.16),
                    blurRadius: 24,
                    offset: const Offset(0, 16), // changes position of shadow
                  ),
                ],
              ),
            ),
            TextFormField(
              controller: controller,
              obscureText: hidePassword && isPassword ? true : false,
              keyboardType: keyboardType,
              style: labelStyle.copyWith(fontSize: 12),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle,
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: isPassword
                    ? InkWell(
                        onTap: onTap,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: SvgPicture.asset(
                            'assets/svg/ic_eye.svg',
                            width: 14,
                          ),
                        ),
                      )
                    : null,
              ),
              cursorColor: greyEBE,
              validator: validator,
            ),
          ],
        ),
      ],
    );
  }
}
