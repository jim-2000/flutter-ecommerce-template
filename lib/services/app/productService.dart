import 'dart:convert';
import 'dart:developer';

import 'package:app/api/call.dart';
import 'package:app/api/url.dart';
import 'package:app/models/app/productModel.dart';
import 'package:app/provider/productProvider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app/utils/appColors.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductService {
  // get all products from server
  void getAllProducts(BuildContext context) async {
    final prodcutProvider =
        Provider.of<ProductProvider>(context, listen: false);

    try {
      prodcutProvider.startLoader();
      http.Response res = await reqGetAPIMethod(Url.getAllProducts);
      final json = jsonDecode(res.body);
      final data = json['data'];
      if (res.statusCode == 200) {
        final productss = List.from(data)
            .map<Product>((prod) => Product.fromJson(prod))
            .toList();
        prodcutProvider.getallProduct(productss);
        prodcutProvider.stopLoader();
      }
      prodcutProvider.stopLoader();
    } catch (e) {
      log(e.toString());
      showSimpleNotification(
        msg: "",
        title: "Something went wrong",
        color: AppColors.AppPrimary,
      );
      prodcutProvider.stopLoader();
    }
  }

  // get Singel product
  void getSingelProduct(BuildContext context, String pId) async {
    final prodcutProvider =
        Provider.of<ProductProvider>(context, listen: false);

    try {
      prodcutProvider.startLoader();
      final res = await reqGetAPIMethod(Url.getSingelProduct + pId);

      final dCode = jsonDecode(res.body);
      Product product = Product.fromJson(dCode);
      // prodcutProvider.getProductById(product);
      prodcutProvider.stopLoader();
    } catch (e) {
      prodcutProvider.stopLoader();

      log(e.toString());
      showSimpleNotification(
        msg: "",
        title: "Something went wrong",
        color: AppColors.AppPrimary,
      );
    }
  }

  // get product By Catagori
  void getProductByCatagori(BuildContext context, String cId) {}
}
