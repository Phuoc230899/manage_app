import 'dart:async';

import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_app/core/service/api.dart';
import 'package:manage_app/model/models/account_tiktok.dart';
import 'package:manage_app/report/component/account_tiktok_table.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tuple/tuple.dart';

class TiktokAccount extends StatefulWidget {
  const TiktokAccount({super.key, this.timer});

  final Timer? timer;
  @override
  State<TiktokAccount> createState() => _TiktokAccountState();
}

class _TiktokAccountState extends State<TiktokAccount> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<String> items = [];
  String selectedItem = '';

  Map<String, double> dataMap = {};

  List<String> users = [];
  List<AccountTiktok> topLike = [];
  List<AccountTiktok> topFollowed = [];

  double sum = 0;

  late Tuple2<Map<String, double>, double> result;

  TextEditingController nameAccount = TextEditingController();
  final myKey = GlobalKey<DropdownSearchState<String>>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        widget.timer?.cancel();
      }
    });
    getUsers();
  }

  void getUsers() async {
    try {
      setState(() {
        EasyLoading.show(status: 'loading...');
      });
      await Future.delayed(const Duration(seconds: 2));
      users = await ApiService.fetchData();
      result = await ApiService.getDataChart();
      topLike = await ApiService.getDataTopLike();
      topFollowed = await ApiService.getDataTopFollow();
      dataMap = result.item1;
      sum = result.item2;
      setState(() {
        EasyLoading.showSuccess('Successfully !');
      });
    } catch (e) {
      setState(() {
        EasyLoading.showError('Error !');
        print(e);
      });
    }
  }

  void getUsers2(String name) async {
    try {
      setState(() {
        EasyLoading.show(status: 'loading...');
      });
      await Future.delayed(const Duration(seconds: 2));
      topLike = await ApiService.getDataTopLikeByName(name);
      topFollowed = await ApiService.getDataTopFollowByName(name);
      dataMap = result.item1;
      sum = result.item2;
      setState(() {
        EasyLoading.showSuccess('Successfully !');
      });
    } catch (e) {
      setState(() {
        EasyLoading.showError('Error !');
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      showCustomDateRangePicker(
                        context,
                        dismissible: true,
                        minimumDate:
                            DateTime.now().subtract(const Duration(days: 30)),
                        maximumDate:
                            DateTime.now().add(const Duration(days: 30)),
                        endDate: endDate,
                        startDate: startDate,
                        backgroundColor: Colors.white,
                        primaryColor: Colors.blueGrey,
                        onApplyClick: (start, end) {
                          setState(() {
                            endDate = end;
                            startDate = start;
                          });
                        },
                        onCancelClick: () {
                          setState(() {
                            endDate = DateTime.now();
                            startDate = DateTime.now();
                          });
                        },
                      );
                    },
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(children: [
                        Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: Image.asset('assets/images/dateform.png')),
                        SizedBox(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Select Date',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 12.h,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  onTap: () {
                                    showCustomDateRangePicker(
                                      context,
                                      dismissible: true,
                                      minimumDate: DateTime.now()
                                          .subtract(const Duration(days: 30)),
                                      maximumDate: DateTime.now()
                                          .add(const Duration(days: 30)),
                                      endDate: endDate,
                                      startDate: startDate,
                                      backgroundColor: Colors.white,
                                      primaryColor: Colors.blueGrey,
                                      onApplyClick: (start, end) {
                                        setState(() {
                                          endDate = end;
                                          startDate = start;
                                        });
                                      },
                                      onCancelClick: () {
                                        setState(() {
                                          endDate = DateTime.now();
                                          startDate = DateTime.now();
                                        });
                                      },
                                    );
                                  },
                                  child: Text(
                                    '${startDate.day.toString()} - ${endDate.day.toString()} ${endDate.year.toString()}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                    child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: DropdownSearch<String>(
                          key: myKey,
                          popupProps:
                              const PopupPropsMultiSelection.bottomSheet(
                            showSearchBox: true,
                            showSelectedItems: false,
                            searchFieldProps: TextFieldProps(
                                cursorColor: Colors.blueGrey,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))))),
                          ),
                          items: users,
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              hintText: "User name",
                              // enabledBorder: OutlineInputBorder(
                              //     borderSide: BorderSide(color: Colors.grey),
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(8))),
                              // border: OutlineInputBorder(
                              //     borderSide: BorderSide(color: Colors.grey),
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(8)))
                            ),
                          ),
                          onChanged: (value) {
                            getUsers2(value.toString());
                            
                          },
                          selectedItem: selectedItem,
                        )))
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          dataMap.isNotEmpty
              ? PieChart(
                  dataMap: dataMap,
                  chartRadius: 200.h,
                  colorList: const [
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                    Colors.orange,
                    Colors.purple,
                    Colors.yellow,
                    Colors.pink,
                    Colors.teal,
                    Colors.cyan,
                    Colors.indigo,
                    Colors.brown,
                  ],
                  legendOptions: const LegendOptions(
                      showLegends: true,
                      showLegendsInRow: false,
                      legendPosition: LegendPosition.right),
                )
              : const SizedBox(),
          topLike.isNotEmpty
              ? AccountTable(
                  name:
                      "TOP 1000 TÀI KHOẢN TIKTOK CÓ LƯỢNG LIKE NHIỀU NHẤT HIỆN NAY",
                  myData: topLike,
                  count: topLike.length,
                )
              : const SizedBox(),
          SizedBox(
            height: 20.h,
          ),
          topFollowed.isNotEmpty
              ? AccountTable(
                  name: "TOP 1000 TÀI KHOẢN TIKTOK CÓ FOLLOW LỚN NHẤT HIỆN NAY",
                  myData: topFollowed,
                  count: topFollowed.length,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
