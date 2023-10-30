import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TiktokAccount extends StatefulWidget {
  const TiktokAccount({super.key});

  @override
  State<TiktokAccount> createState() => _TiktokAccountState();
}

class _TiktokAccountState extends State<TiktokAccount> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  TextEditingController nameAccount = TextEditingController();
  final myKey = GlobalKey<DropdownSearchState<String>>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    showCustomDateRangePicker(
                      context,
                      dismissible: true,
                      minimumDate:
                          DateTime.now().subtract(const Duration(days: 30)),
                      maximumDate: DateTime.now().add(const Duration(days: 30)),
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
                                onTap: () {},
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
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: DropdownSearch<String>.multiSelection(
                        key: myKey,
                        popupProps: const PopupPropsMultiSelection.bottomSheet(
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
                        items: const ["Brazil", "Italia ", "Tunisia", 'Canada'],
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              hintText: "User name",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)))),
                        ),
                        onChanged: (value) {
                          print(value);
                        },
                      )))
            ],
          )
        ],
      ),
    );
  }
}
