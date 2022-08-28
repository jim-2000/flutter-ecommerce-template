import 'package:app/models/productModel.dart';
import 'package:app/models/products.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _product = Products.products;
  List<Product> product() => _product;
  // get all product
  List<Product> getallProduct() {
    return _product;
  }

  // get product by id
  Product getProductById(String pId) {
    return _product.firstWhere((element) => element.id == pId);
  }

  // get product by category
  List<Product> getProductByCategory(String pCategory) {
    return _product
        .where((element) => element.catagories == pCategory)
        .toList();
  }

  // get product by search
  List<Product> getProductBySearch(String pSearch) {
    List<Product> _searchProduct = _product
        .where((element) =>
            element.title.toLowerCase().contains(pSearch.toLowerCase()))
        .toList();
    notifyListeners();
    return _searchProduct;
  }

  // get product by  brand
  List<Product> getProductByBrand(String pBrand) {
    return _product
        .where((element) => element.productBrandName == pBrand)
        .toList();
  }
}
