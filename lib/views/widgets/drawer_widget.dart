import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcare/const/colors.dart';
import 'package:healthcare/const/styles.dart';
import 'package:healthcare/views/pages/login_page.dart';
import 'package:healthcare/views/pages/profile_page.dart';
import 'package:healthcare/views/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  void _logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear().then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              top: 112,
              right: 100,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xff7c94b6),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: white1FB,
                          width: 2,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Asbiq',
                                  style: profileStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const TextSpan(text: ' Al Alawi', style: profileStyle),
                              ],
                            ),
                          ),
                          Text(
                            'Membership BBLK',
                            style: labelStyle.copyWith(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text(
                    'Profile Saya',
                    style: profileItemStyle,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: grey282,
                  ),
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                ),
                ListTile(
                  title: const Text(
                    'Pengaturan',
                    style: profileItemStyle,
                  ),
                  onTap: () {},
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: grey282,
                  ),
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                Button(
                  text: 'Logout',
                  dense: true,
                  color: red004,
                  onTap: () => _logout(context),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ikuti kami di',
                  style: profileStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                SvgPicture.asset('assets/svg/ic_facebook.svg'),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset('assets/svg/ic_instagram.svg'),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset('assets/svg/ic_twitter.svg'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 86),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'FAQ',
                    style: infoStyle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Terms and Conditions',
                    style: infoStyle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: -45,
            child: SvgPicture.asset('assets/svg/ic_close.svg'),
          ),
        ],
      ),
    );
  }
}
