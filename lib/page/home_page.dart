import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:fluter_biliard_uas/model/biliard.dart';
import 'package:fluter_biliard_uas/model/user.dart';
import 'package:fluter_biliard_uas/page/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentNav = 0;
  final List _bottomNav = [
    {
      'icon': Icons.home,
      'icon_off': Icons.home_outlined,
      'label': 'Home',
    },
    {
      'icon': Icons.location_on,
      'icon_off': Icons.location_on_outlined,
      'label': 'Lokasi',
    },
    {
      'icon': Icons.favorite,
      'icon_off': Icons.favorite_border,
      'label': 'Favorite',
    },
    {
      'icon': 'asset/profile.png',
      'icon_off': 'asset/profile.png',
      'label': 'Profil',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 30, 16, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Rekomendasi Tempat bermain biliard di Kota Samarinda',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.search, size: 30),
                  ],
                ),
              ),
              biliardTop(),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Ulasan Pelanggan Terbanyak',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              users(),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Legend Di Samarinda',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              biliardNear(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentNav,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue[300],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) => setState(() => _currentNav = value),
        items: _bottomNav.map((e) {
          return BottomNavigationBarItem(
            icon: e['label'] == 'Profil'
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      e['icon_off'],
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(e['icon_off']),
            activeIcon: e['label'] == 'Profil'
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      e['icon'],
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(e['icon']),
            label: e['label'],
          );
        }).toList(),
      ),
    );
  }

  Widget biliardTop() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        itemCount: listBiliardTop.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Biliard biliard = listBiliardTop[index];
          return GestureDetector(
            onTap: () => Get.to(() => DetailPage(biliard: biliard)),
            child: Container(
              width: 300,
              margin: EdgeInsets.fromLTRB(
                index == 0 ? 16 : 8,
                0,
                index == listBiliardTop.length - 1 ? 16 : 8,
                0,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            biliard.image!,
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                          ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: Text(
                              biliard.type!,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(16),
                                topLeft: Radius.circular(16),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              '\Rp ${biliard.price!}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        biliard.title!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: biliard.rating!,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.blue,
                        ),
                        ignoreGestures: true,
                        itemSize: 15,
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        biliard.location!.split(', ').first,
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                      ),
                      const Spacer(),
                      Text(
                        biliard.users!.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      Icon(Icons.person, size: 18, color: Colors.grey[700]),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget users() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: listUser.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          User user = listUser[index];
          return Container(
            width: 150,
            margin: EdgeInsets.fromLTRB(
              index == 0 ? 16 : 8,
              0,
              index == listUser.length - 1 ? 16 : 8,
              0,
            ),
            decoration: BoxDecoration(
              color: Colors.indigo[900],
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      user.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                RatingBar.builder(
                  initialRating: user.rating!,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.blue,
                  ),
                  ignoreGestures: true,
                  itemSize: 13,
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(height: 8),
                Text(
                  user.name!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.offer!.toString() + ' Ulasan',
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white60,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget biliardNear() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: listBiliardNear.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Biliard biliard = listBiliardNear[index];
          return GestureDetector(
            onTap: () => Get.to(() => DetailPage(biliard: biliard)),
            child: Container(
              width: 300,
              margin: EdgeInsets.fromLTRB(
                index == 0 ? 16 : 8,
                0,
                index == listBiliardNear.length - 1 ? 16 : 8,
                0,
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      biliard.image!,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        '\Rp ${biliard.price!}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
