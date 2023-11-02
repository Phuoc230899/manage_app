import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:manage_app/model/models/account_tiktok.dart';
import 'package:tuple/tuple.dart';

class ApiService {
  static Future<String> loadJsonData() async {
    return await rootBundle
        .loadString('lib/model/data/tiktok-account/top-like.json');
  }

  static Future<List<String>> fetchData() async {
    final jsonString = await loadJsonData();
    final jsonData = json.decode(jsonString);
    List<String> users = [];
    for (var item in jsonData) {
      final user = item['User'];
      users.add(user);
    }

    return users;
  }

  static Future<String> loadChartAccountCate() async {
    return await rootBundle.loadString(
        'lib/model/data/tiktok-account/chart-account-category.json');
  }

  static Future<Tuple2<Map<String, double>, double>> getDataChart() async {
    final jsonString = await loadChartAccountCate();
    final jsonData = json.decode(jsonString);
    Map<String, double> dataMap = {};
    double sum = 0;
    double countE = 0;

    for (var item in jsonData) {
      final category_name = item['Category Name'];
      final count = item['Count'].toDouble();

      if (category_name != null) {
        sum = sum + count;
      }
    }

    for (var item in jsonData) {
      final category_name = item['Category Name'];
      final count = item['Count'].toDouble();

      if (category_name != null && count > sum / 22) {
        dataMap[category_name] = count / sum * 100;
      } else if (category_name != null) {
        countE = countE + count;
      }
    }
    dataMap['Khác'] = countE / sum * 100;
    return Tuple2(dataMap, sum);
  }

  static Future<String> loadJsonDataTopLike() async {
    return await rootBundle
        .loadString('lib/model/data/tiktok-account/top-like.json');
  }

  static Future<List<AccountTiktok>> getDataTopLike() async {
    final jsonString = await loadJsonDataTopLike();
    final jsonData = json.decode(jsonString);
    List<AccountTiktok> topLike = [];
    for (var item in jsonData) {
      AccountTiktok account = AccountTiktok(
        Url: item['URL'],
        Like: item['Like'],
        Follower: item['Follower'],
        Following: item['Following'],
        Updated_At: item['Updated_At'],
        User: item['User'],
        Signature: item['Signature'],
        ID: item['ID'],
        Crawled_At: item['Crawled_At'],
        Category_Name: item['Category_Name'],
      );
      topLike.add(account);
    }

    return topLike;
  }

  static Future<List<AccountTiktok>> getDataTopLikeByName(String name) async {
    final jsonString = await loadJsonDataTopLike();
    final jsonData = json.decode(jsonString);
    List<AccountTiktok> topLike = [];
    for (var item in jsonData) {
      if (item['User'] == name) {
        AccountTiktok account = AccountTiktok(
          Url: item['URL'],
          Like: item['Like'],
          Follower: item['Follower'],
          Following: item['Following'],
          Updated_At: item['Updated_At'],
          User: item['User'],
          Signature: item['Signature'],
          ID: item['ID'],
          Crawled_At: item['Crawled_At'],
          Category_Name: item['Category_Name'],
        );
        topLike.add(account);
      }
    }

    return topLike;
  }

  static Future<String> loadJsonDataTopFollow() async {
    return await rootBundle
        .loadString('lib/model/data/tiktok-account/nhieu-luot-followed.json');
  }

  static Future<List<AccountTiktok>> getDataTopFollow() async {
    final jsonString = await loadJsonDataTopFollow();
    final jsonData = json.decode(jsonString);
    List<AccountTiktok> topFollowed = [];
    for (var item in jsonData) {
      AccountTiktok account = AccountTiktok(
        Url: item['URL'],
        Like: item['Like'],
        Follower: item['Follower'],
        Following: item['Following'],
        Updated_At: item['Updated_At'],
        User: item['User'],
        Signature: item['Signature'],
        ID: item['ID'],
        Crawled_At: item['Crawled_At'],
        Category_Name: item['Category_Name'],
      );
      topFollowed.add(account);
    }

    return topFollowed;
  }

  static Future<List<AccountTiktok>> getDataTopFollowByName(String name) async {
    final jsonString = await loadJsonDataTopFollow();
    final jsonData = json.decode(jsonString);
    List<AccountTiktok> topFollowed = [];
    for (var item in jsonData) {
      if (item['User'] == name) {
        AccountTiktok account = AccountTiktok(
          Url: item['URL'],
          Like: item['Like'],
          Follower: item['Follower'],
          Following: item['Following'],
          Updated_At: item['Updated_At'],
          User: item['User'],
          Signature: item['Signature'],
          ID: item['ID'],
          Crawled_At: item['Crawled_At'],
          Category_Name: item['Category_Name'],
        );
        topFollowed.add(account);
      }
    }
    return topFollowed;
  }
}
