import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcare/const/colors.dart';
import 'package:healthcare/const/styles.dart';

class NotificationBanner extends StatelessWidget {
  const NotificationBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 107,
          width: double.infinity,
          color: primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ingin mendapat update\ndari kami ?',
                style: welcomeStyle.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Dapatkan\nnotifikasi',
                    style: infoStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
        // * Cannot import other ornamen
        Positioned(
          top: 20,
          right: 80,
          child: SvgPicture.asset('assets/svg/dot_ornamen.svg'),
        ),
      ],
    );
  }
}
