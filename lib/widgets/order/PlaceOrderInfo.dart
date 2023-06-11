import 'package:app/utils/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

Widget placeOrderInfo(BuildContext context) {
  final double hi = MediaQuery.of(context).size.height;
  final double we = MediaQuery.of(context).size.width;
  return Container(
    height: hi - 100,
    width: we,
    color: AppColors.AppGrey,
    child: Text("Person Info"),
  );
}
