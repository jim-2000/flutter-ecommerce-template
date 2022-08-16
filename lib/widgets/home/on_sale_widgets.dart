import 'package:app/utils/appColors.dart';
import 'package:app/utils/apputils.dart';
import 'package:app/widgets/home/onsale_product_widget.dart';
import 'package:app/widgets/catagory/priceWidget.dart';
import 'package:flutter/material.dart';

class OnSaleWidget extends StatelessWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final theme = Utils(context).getTheme;
    return Material(
      // color: theme ? AppColors.AppPrimary : AppColors.AppBg,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        child: const OnsaleProduct(),
      ),
    );
  }
}
