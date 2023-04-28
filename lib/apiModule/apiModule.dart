import 'dart:io';

import 'package:http/http.dart';
import 'package:learning_getx/models/product_model.dart';

class ApiService {
  static var client = HttpClient();

  static Future<List<ProductModel>> fetchProduct() async {
    try {
      Response response = await get(Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'));

      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productFromJson(jsonString);
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
