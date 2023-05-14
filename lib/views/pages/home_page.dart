import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcare/const/colors.dart';
import 'package:healthcare/const/styles.dart';
import 'package:healthcare/cubit/filter_cubit.dart';
import 'package:healthcare/views/widgets/button.dart';
import 'package:healthcare/views/widgets/drawer_widget.dart';
import 'package:healthcare/views/widgets/filter_item_card.dart';
import 'package:healthcare/views/widgets/notification_banner.dart';
import 'package:healthcare/views/widgets/product_card.dart';
import 'package:healthcare/views/widgets/service_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _tabController;

  late ScrollController scrollController;

  bool _isLoading = false;

  void _openEndDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void _loadMore() async {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    scrollController = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filterData = ['All Product', 'Layanan Kesehatan', 'Alat Kesehatan'];

    return Scaffold(
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
      drawerScrimColor: primaryColor.withOpacity(0.8),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: const DrawerWidget(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            _moreInfo(),
            const SizedBox(
              height: 46,
            ),
            _specialService(),
            const SizedBox(
              height: 53,
            ),
            _inspectionTracks(),
            const SizedBox(
              height: 40,
            ),
            _filterSearch(),
            const SizedBox(
              height: 40,
            ),
            _productList(filterData),
            _serviceList(),
            if (_isLoading == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CupertinoActivityIndicator(
                    color: greyEBE,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Tampilkan Lebih Banyak',
                    style: infoStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            const SizedBox(
              height: 40,
            ),
            const NotificationBanner(),
          ],
        ),
      ),
    );
  }

  Widget _serviceList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pilih Tipe Layanan Kesehatan Anda',
                style: titleStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                height: 48,
                width: 238,
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
                      Tab(text: 'Satuan'),
                      Tab(text: 'Paket Pemeriksaan'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              ServiceCard(imageUrl: 'assets/png/img_service.png'),
              ServiceCard(imageUrl: 'assets/png/img_service2.png'),
            ],
          ),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              ServiceCard(imageUrl: 'assets/png/img_service.png'),
            ],
          ),
        ][_tabController.index],
      ],
    );
  }

  Widget _productList(List<String> filterData) {
    return Column(
      children: [
        SizedBox(
          height: 72,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            itemCount: filterData.length,
            itemBuilder: (context, index) => BlocBuilder<FilterCubit, int>(
              builder: (context, state) {
                return FilterItemCard(
                  text: filterData[index],
                  isActive: state == index ? true : false,
                  onTap: () => context.read<FilterCubit>().updateIndex(index),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
              itemCount: filterData.length,
              itemBuilder: (context, index) => const ProductCard()),
        ),
      ],
    );
  }

  Widget _filterSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: greyEBE.withOpacity(0.16),
                  blurRadius: 30,
                  offset: const Offset(0, 16), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                'assets/svg/ic_filter.svg',
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: greyEBE.withOpacity(0.16),
                        blurRadius: 30,
                        offset: const Offset(0, 16), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  style: labelStyle.copyWith(fontSize: 12),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: hintStyle.copyWith(
                      fontSize: 16,
                      color: greyEBE,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Image.asset(
                          'assets/png/ic_search.png',
                          width: 14,
                        ),
                      ),
                    ),
                  ),
                  cursorColor: greyEBE,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _inspectionTracks() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(124, 8, 36, 8),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Track Pemeriksaan',
                  style: titleStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Tes Covid 19, Cegah Corona Sedini Mungkin',
                  style: subtitleStyle.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Track',
                        style: titleStyle.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: primaryColor,
                        size: 18,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: -10,
            left: 15,
            child: SvgPicture.asset('assets/svg/magnifying_glass_illustration.svg'),
          ),
        ],
      ),
    );
  }

  Widget _specialService() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(15, 28, 160, 8),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Layanan Khusus',
                  style: titleStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Tes Covid 19, Cegah Corona Sedini Mungkin',
                  style: subtitleStyle.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Daftar Tes',
                        style: titleStyle.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: primaryColor,
                        size: 18,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: -30,
            right: 15,
            child: SvgPicture.asset('assets/svg/vaccine_illustration.svg'),
          ),
        ],
      ),
    );
  }

  Widget _moreInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(15, 15, 140, 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [
                  Colors.white,
                  blue9F9,
                ],
                begin: Alignment.center,
                end: Alignment.topRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: blue34F.withOpacity(0.24),
                  blurRadius: 24,
                  offset: const Offset(0, 16), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Solusi,',
                        style: welcomeStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: ' Kesehatan Anda',
                        style: welcomeStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Update informasi seputar kesehatan semua bisa disini !',
                  style: subtitleStyle.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Button(
                  text: 'Selengkapnya',
                  height: 32,
                  noIcon: true,
                  width: 110,
                  fontSize: 12,
                ),
              ],
            ),
          ),
          Positioned(
            top: -30,
            right: 0,
            child: SvgPicture.asset('assets/svg/calender_illustration.svg'),
          ),
          Positioned(
            right: 40,
            bottom: 20,
            child: SvgPicture.asset('assets/svg/ornamen.svg'),
          ),
        ],
      ),
    );
  }
}
