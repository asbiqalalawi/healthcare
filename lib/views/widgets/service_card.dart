import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcare/const/colors.dart';
import 'package:healthcare/const/styles.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: greyEBE.withOpacity(0.16),
            blurRadius: 24,
            offset: const Offset(0, 16), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 21, top: 10, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PCR Swab Test (Drive Thru)\nHasil 1 Hari Kerja',
                  style: linkStyle,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Rp. 10.000',
                      style: priceStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ic_hospitality.svg',
                      width: 14,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Lenmarc Surabaya',
                      style: infoStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: greyA6A,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ic_pin.svg',
                      width: 14,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Dukuh Pakis, Surabaya',
                      style: infoStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imageUrl,
              height: 160,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
