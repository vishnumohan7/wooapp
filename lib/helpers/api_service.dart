import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stackex/models/CategoryModel.dart';

class ApiService {
  String baseUrl = "https://orabelbrass.com/wp-json/wc/v3";

  getProductsData() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            "$baseUrl/products?consumer key=ck_be4a5f44611c9dbf5eb37f3f096a5b1849a98289&consumer secret=cs_6dd895cd93bd48ffbfdadc3e91e28bcaff54cd11"));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    return response;
  }

  createProduct() async {
    var request = http.Request(
        'POST',
        Uri.parse(
            '$baseUrl/products?consumer key=ck_be4a5f44611c9dbf5eb37f3f096a5b1849a98289&consumer secret=cs_6dd895cd93bd48ffbfdadc3e91e28bcaff54cd11'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  getProductbyId(int id) async {
    var request = http.Request(
        'PUT',
        Uri.parse(
            '$baseUrl/products/$id?consumer key=ck_be4a5f44611c9dbf5eb37f3f096a5b1849a98289&consumer secret=cs_6dd895cd93bd48ffbfdadc3e91e28bcaff54cd11'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  deleteProductbyId(int id) async {
    var request = http.Request(
        'DELETE',
        Uri.parse(
            '$baseUrl/products/$id?consumer key=ck_be4a5f44611c9dbf5eb37f3f096a5b1849a98289&consumer secret=cs_6dd895cd93bd48ffbfdadc3e91e28bcaff54cd11'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<List<CategoryModel>> getAllCategories() async {
    List<CategoryModel> categories = [];
    try {
      var request = await http.get(Uri.parse(
          '$baseUrl/products/categories?consumer key=ck_be4a5f44611c9dbf5eb37f3f096a5b1849a98289&consumer secret=cs_6dd895cd93bd48ffbfdadc3e91e28bcaff54cd11'));
      if (request.statusCode == 200) {
        var data = jsonDecode(request.body);
        categories =
            data.map<CategoryModel>((e) => CategoryModel.fromJson(e)).toList();
      }
    } catch (ex) {
    } finally {
      print(categories.length);
    }
    return categories;
  }
}
