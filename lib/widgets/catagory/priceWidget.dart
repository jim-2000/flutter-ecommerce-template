import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    return Expanded(
      child: Row(
        children: [
          Text(
            "15.6\$ ",
            style: TextStyle(
              fontSize: 22,
              color: theme ? AppColors.AppBg : AppColors.AppBlack,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "19.6\$ ",
            style: TextStyle(
              fontSize: 22,
              color: theme ? AppColors.AppBlack : AppColors.AppBlack,
              decoration: TextDecoration.lineThrough,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
