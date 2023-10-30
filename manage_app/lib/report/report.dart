import 'package:flutter/material.dart';
import 'package:manage_app/report/component/tiktok-account.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
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
              leading: const Icon(
                Icons.arrow_back,
                color: Colors.black,
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
            body: const TabBarView(
              children: [
                TiktokAccount(),
                Center(
                  child: Text('Tab2'),
                ),
                Center(
                  child: Text('Tab3'),
                ),
                Center(
                  child: Text('Tab4'),
                ),
              ],
            )),
      ),
    );
  }
}
