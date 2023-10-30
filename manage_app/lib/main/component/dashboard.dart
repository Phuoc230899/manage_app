import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

List item_account = [
  {
    'name': 'Top tài khoản có nhiều lượt theo dõi nhất',
    'image': 'assets/images/top-followed.png',
    'isBookmarks': true
  },
  {
    'name': 'Top tài khoản có nhiều lượt like nhất',
    'image': 'assets/images/top-like.png',
    'isBookmarks': false
  }
];

List item_videos = [
  {
    'name': 'Videos Tiktok theo thể loại',
    'image': 'assets/images/tiktok-videos.png',
    'isBookmarks': true
  },
  {
    'name': 'Videos Tiktok trending',
    'image': 'assets/images/video-trending.png',
    'isBookmarks': false
  },
  {
    'name': 'Top 1000 videos tiktok có lượt thả tim nhiều nhất',
    'image': 'assets/images/top-videos-like.png',
    'isBookmarks': false
  },
  {
    'name': 'Top 1000 videos tiktok có lượt xem nhiều nhất',
    'image': 'assets/images/top-videos-view.png',
    'isBookmarks': true
  },
];

class _DashBoardPageState extends State<DashBoardPage>
    with TickerProviderStateMixin {
  Map<int, AnimationController> _accountCotroller = {};
  Map<int, AnimationController> _videoCotroller = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < item_account.length; i++) {
      _accountCotroller[i] =
          AnimationController(vsync: this, duration: Duration(seconds: 1));
    }
    for (int i = 0; i < item_videos.length; i++) {
      _videoCotroller[i] =
          AnimationController(vsync: this, duration: Duration(seconds: 1));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    for (var controller in _accountCotroller.values) {
      controller.dispose();
    }

    for (var vidcontroller in _videoCotroller.values) {
      vidcontroller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFD6E2EA),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            leading: const SizedBox(),
            backgroundColor: const Color(0xFFD6E2EA),
            pinned: false,
            floating: true,
            flexibleSpace: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                children: [
                  Text(
                    'Dashboard',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Spacer(),
                  Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.grey.withOpacity(0.3)),
                    child: const Icon(Icons.add_chart),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.grey.withOpacity(0.3)),
                    child: const Icon(Icons.search),
                  )
                ],
              ),
            ),
          ),

          // Tiktok Accounts Management
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              width: size.width,
              height: 50.h,
              color: Colors.white,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Tiktok Accounts Management',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 20.h),
                  )),
            );
          }, childCount: 1)),
          SliverToBoxAdapter(
            child: SizedBox(height: 10.0.h),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return CarouselSlider(
                options: CarouselOptions(
                    height: 200.h,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.9),
                items: item_account.map((item) {
                  var controller = _accountCotroller[item_account.indexWhere(
                      (element) => element['name'] == item['name'])];
                  return Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: SizedBox(
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Stack(children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  child: Image.asset(
                                    item['image'],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                    right: 10.w,
                                    top: 10.h,
                                    child: GestureDetector(
                                      onTap: () {
                                        if (item['isBookmarks']) {
                                          controller!.reverse();
                                          item['isBookmarks'] = false;
                                        } else {
                                          controller!.forward();
                                          item['isBookmarks'] = true;
                                        }
                                      },
                                      child: Lottie.asset(
                                          'assets/lotties/bookmark.json',
                                          controller: controller,
                                          onLoaded: (p0) {
                                        if (item['isBookmarks']) {
                                          controller!.forward();
                                        } else {
                                          controller!.reverse();
                                        }
                                      },
                                          key: UniqueKey(),
                                          width: 50.w,
                                          height: 50.h),
                                    ))
                              ])),
                          Expanded(
                            flex: 1,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 10.h, left: 10.w, right: 10.w),
                                child: Text(
                                  item['name'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.h),
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList());
          }, childCount: 1)),

          // Tiktok Videos Management
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              width: size.width,
              height: 50.h,
              color: Colors.white,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Tiktok Videos Management',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 20.h),
                  )),
            );
          }, childCount: 1)),
          SliverToBoxAdapter(
            child: SizedBox(height: 10.0.h), // Tạo một khoảng cách 20.0 pixel
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return CarouselSlider(
                options: CarouselOptions(
                    height: 200.h,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.9),
                items: item_videos.map((item) {
                  var videoController = _videoCotroller[item_videos.indexWhere(
                      (element) => element['name'] == item['name'])];
                  return Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: SizedBox(
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Stack(children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  child: Image.asset(
                                    item['image'],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                    right: 10.w,
                                    top: 10.h,
                                    child: GestureDetector(
                                      onTap: () {
                                        if (item['isBookmarks']) {
                                          videoController!.reverse();
                                          item['isBookmarks'] = false;
                                        } else {
                                          videoController!.forward();
                                          item['isBookmarks'] = true;
                                        }
                                      },
                                      child: Lottie.asset(
                                          'assets/lotties/bookmark.json',
                                          controller: videoController,
                                          onLoaded: (p0) {
                                        if (item['isBookmarks']) {
                                          videoController!.forward();
                                        } else {
                                          videoController!.reverse();
                                        }
                                      },
                                          key: UniqueKey(),
                                          width: 50.w,
                                          height: 50.h),
                                    ))
                              ])),
                          Expanded(
                            flex: 1,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 10.h, left: 10.w, right: 10.w),
                                child: Text(
                                  item['name'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.h),
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList());
          }, childCount: 1)),

          // Bất Động Sản Management
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              width: size.width,
              height: 50.h,
              color: Colors.white,
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Bất Động Sản Management',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 20.h),
                  )),
            );
          }, childCount: 1)),
          SliverToBoxAdapter(
            child: SizedBox(height: 10.0.h), // Tạo một khoảng cách 20.0 pixel
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return CarouselSlider(
                options: CarouselOptions(
                    height: 200.h,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.9),
                items: item_videos.map((item) {
                  var videoController = _videoCotroller[item_videos.indexWhere(
                      (element) => element['name'] == item['name'])];
                  return Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: SizedBox(
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Stack(children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  child: Image.asset(
                                    item['image'],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                    right: 10.w,
                                    top: 10.h,
                                    child: GestureDetector(
                                      onTap: () {
                                        if (item['isBookmarks']) {
                                          videoController!.reverse();
                                          item['isBookmarks'] = false;
                                        } else {
                                          videoController!.forward();
                                          item['isBookmarks'] = true;
                                        }
                                      },
                                      child: Lottie.asset(
                                          'assets/lotties/bookmark.json',
                                          controller: videoController,
                                          onLoaded: (p0) {
                                        if (item['isBookmarks']) {
                                          videoController!.forward();
                                        } else {
                                          videoController!.reverse();
                                        }
                                      },
                                          key: UniqueKey(),
                                          width: 50.w,
                                          height: 50.h),
                                    ))
                              ])),
                          Expanded(
                            flex: 1,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 10.h, left: 10.w, right: 10.w),
                                child: Text(
                                  item['name'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.h),
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList());
          }, childCount: 1)),
        ]),
      ),
    );
  }
}
