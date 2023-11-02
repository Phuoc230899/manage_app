import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountTable extends StatefulWidget {
  AccountTable(
      {super.key,
      required this.myData,
      required this.count,
      required this.name});

  var myData;
  final count;
  String name;

  @override
  State<AccountTable> createState() => _AccountTableState();
}

class _AccountTableState extends State<AccountTable> {
  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      source: RowSource(count: widget.count, myData: widget.myData),
      header: Text(widget.name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.h,
              color: Colors.blueGrey)),
      rowsPerPage: widget.count > 5 ? 5 : widget.count,
      columns: [
        DataColumn(
          label: Text(
            "User",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.h),
          ),
        ),
        DataColumn(
          label: Text(
            "Url",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.h),
          ),
        ),
        DataColumn(
          label: Text(
            "Thể loại",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.h),
          ),
        ),
        DataColumn(
          label: Text(
            "Lượt thích",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.h),
          ),
        ),
        DataColumn(
          label: Text(
            "Đang theo dõi",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.h),
          ),
        ),
        DataColumn(
          label: Text(
            "Lượt theo dõi",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.h),
          ),
        ),
        DataColumn(
          label: Text(
            "Signature",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.h),
          ),
        ),
        DataColumn(
          label: Text(
            "Ngày cập nhật",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.h),
          ),
        ),
        DataColumn(
          label: Text(
            "Ngày cào",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.h),
          ),
        ),
        DataColumn(
          label: Text(
            "ID",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.h),
          ),
        ),
      ],
    );
  }
}

class RowSource extends DataTableSource {
  var myData;
  final count;
  RowSource({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData![index]);
    } else
      return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(var data) {
  return DataRow(
    cells: [
      DataCell(Text(data.User ?? "Null")),
      DataCell(GestureDetector(
          onTap: () {},
          child: Text(
            data.Url ?? "Null",
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ))),
      DataCell(Text(data.Category_Name ?? "Null")),
      DataCell(Text(data.Follower.toString())),
      DataCell(Text(data.Following.toString())),
      DataCell(Text(data.Like.toString())),
      DataCell(Text(data.Signature ?? "Null")),
      DataCell(Text(data.Updated_At ?? "Null")),
      DataCell(Text(data.Crawled_At ?? "Null")),
      DataCell(Text(data.ID ?? "Null")),
    ],
  );
}
