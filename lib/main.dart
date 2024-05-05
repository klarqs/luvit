import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 15,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 14,
          ),
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageController;
  int currentIndex = 0, currentPage = 0;

  initailizePageController() {
    pageController = PageController(
      keepPage: false,
      initialPage: currentPage,
      viewportFraction: 0.88,
    );
  }

  void updateCurrentIndex(int index) {
    if (index != 2) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  void onItemTap(int index) {
    updateCurrentIndex(index);
  }

  @override
  void initState() {
    initailizePageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  List<User> users = [
    User(
      name: '벌꿀오소리',
      city: "서울",
      distance: "2km 거리에 있음",
      age: 27,
      images: ["assets/images/100.png"],
    ),
    User(
      name: '잭과분홍콩나물',
      city: "서울",
      distance: "2km 거리에 있음",
      age: 25,
      images: ["assets/images/103.png"],
    ),
    User(
      name: '스며들다',
      city: "서울",
      distance: "2km 거리에 있음",
      age: 22,
      images: ["assets/images/104.png"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xff0E0D0D),
        leading: const SizedBox(),
        leadingWidth: 0,
        centerTitle: false,
        title: Row(
          children: [
            SvgPicture.asset("assets/images/location.svg"),
            Expanded(
              child: Text(
                "목이길어슬픈기린님의 새로운 스팟",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          ],
        ),
        actions: [
          numbersChip(text: '323,233'),
          Padding(
            padding: const EdgeInsets.only(right: 4.0, left: 2.0),
            child: SvgPicture.asset("assets/images/notification.svg"),
          ),
        ],
      ),
      body: PageView.builder(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
            bottom: 32.0,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Image.asset(users[index].images[0]),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 6.0,
                  right: 6.0,
                  bottom: 17.5,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xff212121),
                    ),
                    borderRadius: BorderRadius.circular(20.5),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withOpacity(.95),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 40.0,
                  left: 30.0,
                  right: 30.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                numbersChip(
                                    text: '29,930',
                                    icon: 'assets/images/star_black.svg'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  users[index].name,
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                Text(
                                  " ${users[index].age.toString()}",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${users[index].city.toString()} · ",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  users[index].distance.toString(),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SvgPicture.asset("assets/images/like.svg")
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SvgPicture.asset('assets/images/down.svg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14), topRight: Radius.circular(14)),
              border: Border(
                top: BorderSide(
                  color: Color(0xff212121),
                  width: 1.0,
                ),
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: onItemTap,
              elevation: 16,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: SvgPicture.asset(
                      "assets/images/home.svg",
                      height: 24,
                      color: currentIndex == 0
                          ? const Color(0xffFF016B)
                          : const Color(0xff3A3A3A),
                    ),
                  ),
                  label: '홈',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: SvgPicture.asset(
                      "assets/images/locate.svg",
                      height: 24,
                      color: currentIndex == 1
                          ? const Color(0xffFF016B)
                          : const Color(0xff3A3A3A),
                    ),
                  ),
                  label: '스팟',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: SvgPicture.asset(
                      "assets/images/h.svg",
                      height: 24,
                      color: currentIndex == 2
                          ? const Color(0xffFF016B)
                          : const Color(0xff3A3A3A),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: SvgPicture.asset(
                      "assets/images/chat.svg",
                      height: 24,
                      color: currentIndex == 3
                          ? const Color(0xffFF016B)
                          : const Color(0xff3A3A3A),
                    ),
                  ),
                  label: '채팅',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: SvgPicture.asset(
                      "assets/images/profile.svg",
                      height: 24,
                      color: currentIndex == 4
                          ? const Color(0xffFF016B)
                          : const Color(0xff3A3A3A),
                    ),
                  ),
                  label: '마이',
                ),
              ],
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xffFF016B),
                fontSize: 12,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              selectedItemColor: const Color(0xffFF016B),
            ),
          ),
          Positioned(
              right: 0,
              left: 0,
              child: SvgPicture.asset(
                  "/Users/k.paul/Desktop/luvit/assets/images/ic_GNB_like.svg"))
        ],
      ),
    );
  }

  numbersChip({
    String icon = 'assets/images/star_color.svg',
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
          color: const Color(0xff000000),
          border: Border.all(
            width: 1,
            color: const Color(0xff212121),
          ),
          borderRadius: BorderRadius.circular(100)),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          Text(" $text"),
        ],
      ),
    );
  }
}

class User {
  final String name, city, distance;
  final int age;
  final List<String> images;

  User({
    required this.name,
    required this.city,
    required this.distance,
    required this.age,
    required this.images,
  });
}
