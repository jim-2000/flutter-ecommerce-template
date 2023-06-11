import 'package:app/models/app/orderModel.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:get/get.dart';

bool orderFormValidate(ShippingModel shipping) {
  if (shipping.phoneNo.isEmpty) {
    showSimpleNotification(
      msg: 'Form Validation',
      title: 'Phone number is required',
      color: AppColors.AppPrimary,
    );
    return false;
  }
  if (shipping.country.isEmpty) {
    showSimpleNotification(
      msg: 'Form Validation',
      title: 'Country is required',
      color: AppColors.AppPrimary,
    );
    return false;
  }
  if (shipping.city.isEmpty) {
    showSimpleNotification(
      msg: 'Form Validation',
      title: 'City is required',
      color: AppColors.AppPrimary,
    );
    return false;
  }
  if (shipping.state.isEmpty) {
    showSimpleNotification(
      title: 'State is required',
      msg: 'Form Validation',
      color: AppColors.AppPrimary,
    );
    return false;
  }
  if (shipping.address.isEmpty) {
    showSimpleNotification(
      msg: 'Form Validation',
      title: 'Address is required',
      color: AppColors.AppPrimary,
    );
    return false;
  }
  return true;
}
