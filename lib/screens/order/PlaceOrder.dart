import 'dart:developer';
import 'package:app/models/app/orderModel.dart';
import 'package:app/provider/OrderProvider.dart';
import 'package:app/provider/auth/UserProvider.dart';
import 'package:app/provider/cartProvider.dart';
import 'package:app/services/payment/paymentService.dart';
import 'package:app/utils/toast_utils.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:app/validation/orderFormValidation.dart';
import 'package:app/services/app/orderService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/models/enums/paymentEnums.dart';
import 'package:app/utils/inputWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:loading_indicator/loading_indicator.dart';

class PlaceOrder extends StatefulWidget {
  static String routeName = '/placeOrder';
  const PlaceOrder({super.key});

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _country =
      TextEditingController(text: 'Bangladesh');
  final TextEditingController _city = TextEditingController();
  final TextEditingController _street = TextEditingController();
  final TextEditingController _address = TextEditingController();
  //
  final orderservice = OrderService();
  final paymentService = PaymentService();

  @override
  Widget build(BuildContext context) {
    final inputs = AppinputWidgets(context);
    double width = MediaQuery.of(context).size.width;
    final orderprov = Provider.of<OrderProvider>(context);
    final userrProv = Provider.of<UserProvider>(context);
    final cartprov = Provider.of<CartProvider>(context);
    Map<String, dynamic> paymentIntent;

    //
    Future displaypayment() async {
      try {
        await Stripe.instance.presentPaymentSheet().then((va) => {});
      } catch (e) {
        log("Fail");
      }
    }

    void payNow() async {
      try {
        await Stripe.instance
            .initPaymentSheet(
                paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: orderprov.client_secret,
              billingDetails: BillingDetails(
                phone: _phoneNumberController.text,
                email: userrProv.user.email,
                name: userrProv.user.username,
                address: Address(
                  city: _city.text,
                  country: _country.text,
                  line1: _address.text,
                  line2: '',
                  postalCode: '42223',
                  state: _street.text,
                ),
              ),
              merchantDisplayName: 'Easy Shop',
              style: ThemeMode.system,
            ))
            .then((value) => {
                  displaypayment(),
                });
      } catch (e) {
        showSimpleNotification(msg: '', title: 'Payment failed');
      }
    }

    return Consumer<OrderProvider>(builder: (context, ord, _) {
      return ord.isLoading
          ? Scaffold(
              body: Center(
                child: SizedBox(
                  height: 25,
                  child: LoadingIndicator(
                      indicatorType: Indicator.ballSpinFadeLoader,
                      strokeWidth: 4,
                      colors: [AppColors.AppPrimary]),
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                title: const Text("Order Details"),
                actions: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.shopping_bag,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      inputs.textinput(
                        text: "Phone Number",
                        onChanged: (call) => {},
                        controller: _phoneNumberController,
                        inputType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputs.textinput(
                        text: "Country",
                        onChanged: (call) => {},
                        controller: _country,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputs.textinput(
                        text: "City",
                        onChanged: (call) => {},
                        controller: _city,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputs.textinput(
                        text: "Street",
                        onChanged: (call) => {},
                        controller: _street,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputs.textinput(
                        text: "Address",
                        onChanged: (call) => {},
                        controller: _address,
                        minline: 5,
                        maxline: 8,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 160,
                          child: Consumer<OrderProvider>(
                            builder: (context, val, _) {
                              return Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceAround,
                                children: [
                                  payType(
                                    width: width / 2 - 40,
                                    name: "Cash on Delivery",
                                    iconvalue:
                                        'assets/images/svg/cashondelivery.svg',
                                    paymentType: PaymentType.cod,
                                    isSelected:
                                        val.selectedPayment == PaymentType.cod
                                            ? true
                                            : false,
                                    context: context,
                                  ),
                                  payType(
                                    width: width / 2 - 40,
                                    name: "Cash on Delivery",
                                    iconvalue: 'assets/images/svg/card.svg',
                                    paymentType: PaymentType.online,
                                    isSelected: val.selectedPayment ==
                                            PaymentType.online
                                        ? true
                                        : false,
                                    context: context,
                                  ),
                                ],
                              );
                            },
                          )),
                      const SizedBox(
                        height: 80,
                      ),
                      inputs.btn(
                        text: "Continue",
                        callback: () async {
                          final shipInfo = ShippingModel(
                            city: _city.text,
                            state: _street.text,
                            country: _country.text,
                            zipcode: '4040',
                            phoneNo: _phoneNumberController.text,
                            address: _address.text,
                          );
                          if (orderFormValidate(shipInfo)) {
                            if (orderprov.selectedPayment.index == 1) {
                              paymentIntent =
                                  await paymentService.createPaymentIntent(
                                cartprov.totalAmount.toInt(),
                                userrProv.user.email,
                              );
                              await Stripe.instance
                                  .initPaymentSheet(
                                    paymentSheetParameters:
                                        SetupPaymentSheetParameters(
                                      paymentIntentClientSecret:
                                          paymentIntent['client_secret'],
                                      merchantDisplayName: 'Easy Shop',
                                      style: ThemeMode.light,
                                    ),
                                  )
                                  .then((value) =>
                                      {log(paymentIntent.toString())})
                                  .catchError((error) => {
                                        log(error.toString()),
                                      });
                              await Stripe.instance
                                  .presentPaymentSheet()
                                  .then((value) => {
                                        Future.delayed(Duration.zero, () async {
                                          // ignore: use_build_context_synchronously
                                          orderservice.newOrder(
                                            context,
                                            ShippingModel(
                                              city: _city.text,
                                              state: _street.text,
                                              country: _country.text,
                                              zipcode: '4040',
                                              phoneNo:
                                                  _phoneNumberController.text,
                                              address: _address.text,
                                            ),
                                            PaymentInfo(
                                              id: paymentIntent['id']
                                                  .toString(),
                                              status: 'Succeeded',
                                            ),
                                            1,
                                          );
                                        }),
                                        paymentIntent = {}
                                      });
                            } else {
                              orderservice.newOrder(
                                context,
                                ShippingModel(
                                  city: _city.text,
                                  state: _street.text,
                                  country: _country.text,
                                  zipcode: '4040',
                                  phoneNo: _phoneNumberController.text,
                                  address: _address.text,
                                ),
                                PaymentInfo(id: '0', status: ''),
                                0,
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}

Widget payType({
  required double width,
  required String name,
  required String iconvalue,
  required PaymentType paymentType,
  required bool isSelected,
  required BuildContext context,
}) {
  final newVal = Provider.of<OrderProvider>(context);
  return GestureDetector(
    onTap: () {
      newVal.updateSelectPayment(paymentType);
      log(newVal.selectedPayment.index.toString());
    },
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: width,
          height: 100,
          decoration: BoxDecoration(
              color: isSelected ? AppColors.AppPrimary : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                width: isSelected ? 2.0 : 1.0,
                color: isSelected ? Colors.grey : Colors.grey,
              )),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                height: 80,
                fit: BoxFit.cover,
                iconvalue,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
