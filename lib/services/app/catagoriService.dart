import 'dart:convert';
import 'dart:developer';

import 'package:app/api/call.dart';
import 'package:app/api/url.dart';
import 'package:app/models/app/catagoriModel.dart';
import 'package:app/provider/catagoriProvider.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CatagoriServices {
  void getAllCategories(BuildContext context) async {
    final catagoriProvideR =
        Provider.of<CatagoriProvider>(context, listen: false);
    try {
      catagoriProvideR.startLoader();
      http.Response res = await reqGetAPIMethod(Url.getAllCatagori);
      if (res.statusCode == 200) {
        final json = jsonDecode(res.body);
        final catagories = List.from(json)
            .map<Catagori>((catagori) => Catagori.fromJson(catagori))
            .toList();
        catagoriProvideR.getallCatagories(catagories);
        catagoriProvideR.stopLoader();
      }
    } catch (e) {
      showSimpleNotification(
        msg: "",
        title: "Something went wrong",
        color: AppColors.AppPrimary,
      );
      catagoriProvideR.stopLoader();
    }
  }
}
