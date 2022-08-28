import 'package:app/models/productModel.dart';
import 'package:app/screens/catagories/catagoriesProduct.dart';
import 'package:flutter/material.dart';

class CatagorytwoWidget extends StatelessWidget {
  const CatagorytwoWidget({
    Key? key,
    required this.product,
    this.isRight = false,
  }) : super(key: key);

  final Product product;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CatagoryProduct.routeName,
            arguments: product.catagories);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(
          horizontal: isRight ? 0 : 8,
          vertical: 8,
        ),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: isRight
                ? AssetImage("assets/images/offres/women.jpg")
                : AssetImage("assets/images/offres/phone.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment:
              isRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product.catagories.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "${product.description.substring(0, 20).toUpperCase()} ",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
