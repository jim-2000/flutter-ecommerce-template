import 'package:app/provider/dark_theme_provider.dart';
import 'package:app/provider/productProvider.dart';
import 'package:app/services/app/productService.dart';
import 'package:app/utils/appColors.dart';
import 'package:app/widgets/home/feedWidget.dart';
import 'package:app/widgets/home/FeedProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading_indicator/loading_indicator.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final productService = ProductService();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      // productService.getAllProducts(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context);
    final double hi = MediaQuery.of(context).size.height;
    final double we = MediaQuery.of(context).size.width;
    final theme = Provider.of<ThemeProvider>(context);
    return Consumer<ProductProvider>(
      builder: (context, prod, _) {
        return prod.isLoading
            ? Scaffold(
                body: Center(
                  child: SizedBox(
                    height: 65,
                    child: LoadingIndicator(
                        indicatorType: Indicator.ballSpinFadeLoader,
                        strokeWidth: 4,
                        colors: [AppColors.AppPrimary]),
                  ),
                ),
              )
            : Scaffold(
                body: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (ctx, i) {
                    return SizedBox(
                      height: hi * 0.28,
                      child: FeedProduct(
                        products: products.product()[i],
                      ),
                    );
                  },
                  itemCount: products.product().length,
                ),
              );
      },
    );
  }
}
