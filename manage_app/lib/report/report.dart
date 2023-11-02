import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:manage_app/core/service/api.dart';
import 'package:manage_app/report/component/tiktok-account.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
            backgroundColor: const Color(0xFFD6E2EA),
            appBar: AppBar(
              backgroundColor: const Color(0xFFD6E2EA),
              title: Center(
                  child: Text(
                'Report',
                style: Theme.of(context).textTheme.headlineMedium,
              )),
              leading: IconButton(
                onPressed: () {
                  timer?.cancel();
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              actions: const [
                Icon(
                  Icons.more_vert,
                  color: Colors.black,
                )
              ],
              bottom: const TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.blueGrey,
                tabs: [
                  Tab(text: 'Tiktok Accounts'),
                  Tab(text: 'Tiktok Videos'),
                  Tab(text: 'BDS'),
                  Tab(
                    text: 'Facebook',
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: [
                TiktokAccount(
                  timer: timer,
                ),
                const Center(
                  child: Text('Tab2'),
                ),
                const Center(
                  child: Text('Tab3'),
                ),
                const Center(
                  child: Text('Tab4'),
                ),
              ],
            )),
      ),
    );
  }
}
