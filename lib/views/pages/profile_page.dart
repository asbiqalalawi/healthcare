import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcare/const/colors.dart';
import 'package:healthcare/const/styles.dart';
import 'package:healthcare/views/pages/home_page.dart';
import 'package:healthcare/views/widgets/button.dart';
import 'package:healthcare/views/widgets/drawer_widget.dart';
import 'package:healthcare/views/widgets/input.dart';
import 'package:healthcare/views/widgets/notification_banner.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _tabController;

  void _openEndDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white8FA,
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svg/ic_basket.svg'),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svg/ic_notification.svg'),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        elevation: 0,
        iconTheme: const IconThemeData(color: primaryColor),
        leading: IconButton(
          onPressed: _openEndDrawer,
          icon: SvgPicture.asset('assets/svg/ic_drawer.svg'),
        ),
      ),
      endDrawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: greyEBE.withOpacity(0.16),
                            blurRadius: 24,
                            offset: const Offset(0, 16), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                        child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                            color: blue9D5,
                            border: Border.all(color: Colors.white.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: greyEBE.withOpacity(0.16),
                                blurRadius: 24,
                                offset: const Offset(0, 16), // changes position of shadow
                              ),
                            ],
                          ),
                          labelColor: primaryColor,
                          labelStyle: linkStyle,
                          unselectedLabelColor: primaryColor,
                          unselectedLabelStyle: linkStyle.copyWith(fontWeight: FontWeight.w400),
                          isScrollable: true,
                          onTap: (value) => setState(() {}),
                          tabs: const [
                            Tab(text: 'Profile Saya'),
                            Tab(text: 'Pengaturan'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: greyEBE.withOpacity(0.16),
                            blurRadius: 24,
                            offset: const Offset(0, 16), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _profileCard(),
                          const SizedBox(
                            height: 14,
                          ),
                          _profileData(),
                        ],
                      ),
                    ),
                    const Text('Setting'),
                  ][_tabController.index],
                  const SizedBox(
                    height: 77,
                  ),
                ],
              ),
            ),
            const NotificationBanner(),
          ],
        ),
      ),
    );
  }

  Widget _profileCard() {
    return Stack(
      children: [
        Container(
          height: 114 + 48,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                      ),
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
                  width: 10,
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
                                fontSize: 18,
                                color: Colors.white,
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
                          color: greyDBD,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 114),
          padding: const EdgeInsets.symmetric(
            vertical: 11,
            horizontal: 16,
          ),
          decoration: const BoxDecoration(
            color: blueE78,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Text(
            'Lengkapi profile anda untuk memaksimalkan penggunaan aplikasi',
            style: infoStyle.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        // * Cannot import other ornamen
        Positioned(
          bottom: 50,
          right: 20,
          child: SvgPicture.asset('assets/svg/dot_ornamen.svg'),
        ),
      ],
    );
  }

  Widget _profileData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilih data yang ingin ditampilkan',
            style: titleStyle.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                height: 36,
                width: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: blue9D5,
                ),
                child: SvgPicture.asset(
                  'assets/svg/ic_profile.svg',
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data Diri',
                    style: titleStyle.copyWith(
                      color: black333,
                    ),
                  ),
                  Text(
                    'Data diri anda sesuai KTP',
                    style: infoStyle.copyWith(
                      color: greyDBD,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                height: 36,
                width: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: greyDF7,
                ),
                child: SvgPicture.asset(
                  'assets/svg/ic_pin.svg',
                  colorFilter: const ColorFilter.mode(
                    greyA6A,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Input(
            labelText: 'Nama Depan',
            hintText: 'Masukkan nama depan anda',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 30,
          ),
          const Input(
            labelText: 'Nama Belakang',
            hintText: 'Masukkan nama belakang anda',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 30,
          ),
          const Input(
            labelText: 'Email',
            hintText: 'Masukkan email anda',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 30,
          ),
          const Input(
            labelText: 'No Telpon',
            hintText: 'Masukkan no telepon anda',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 30,
          ),
          const Input(
            labelText: 'No. KTP',
            hintText: 'Masukkan no KTP anda',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            leading: SvgPicture.asset('assets/svg/ic_info.svg'),
            subtitle: Text(
              'Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya',
              style: infoStyle.copyWith(
                fontSize: 12,
                color: greyA6A,
              ),
            ),
            contentPadding: const EdgeInsets.all(0),
            horizontalTitleGap: 0,
          ),
          const SizedBox(
            height: 34,
          ),
          Button(
            text: 'Simpan Profile',
            icon: Icons.save_outlined,
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
