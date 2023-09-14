import 'dart:convert';

import 'package:http/http.dart';
import 'package:shop_app/data/models/product_resp.dart';

import '../../constants.dart';

class ProductApi {
  Future<List<ProductResp>> getAll() async {
    print("LOG_ProductApi_getAll(): call api ");
    final response = await get(
      Uri.parse(ApiBaseUrl + ApiGetAllProducts),
    ).timeout(const Duration(seconds: ApiTimeout));

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var productObjsJson = jsonDecode(response.body) as List;
      List<ProductResp> productList = productObjsJson
          .map((productJson) => ProductResp.fromJson(productJson))
          .toList();

      print("LOG_ProductApi_getAll(): resp = " + productList.length.toString());

      return productList;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      print("LOG_ProductApi_getAll(): response code = " +
          response.statusCode.toString());
      throw Exception('Failed to get products.');
    }
  }
}
