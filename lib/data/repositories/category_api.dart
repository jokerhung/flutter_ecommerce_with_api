import 'dart:convert';

import 'package:http/http.dart';
import 'package:shop_app/data/models/product_resp.dart';

import '../../constants.dart';

class CategoryApi {
  Future<List<String>> getAll() async {
    print("LOG_CategoryApi_getAll(): call api ");
    final response = await get(
      Uri.parse(ApiBaseUrl + ApiGetAllCategories),
    ).timeout(const Duration(seconds: ApiTimeout));

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var categoriesObjsJson = jsonDecode(response.body) as List;
      List<String> categoriesList = categoriesObjsJson
          .map((item) => item as String)
          .toList();

      print("LOG_CategoryApi_getAll(): resp = " + categoriesList.length.toString());

      return categoriesList;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print("LOG_CategoryApi_getAll(): response code = " + response.statusCode.toString());
      throw Exception('Failed to get categories.');
    }
  }
}
