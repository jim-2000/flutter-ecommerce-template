import 'package:app/models/app/productModel.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Product> _product = [];
  List<Product> product() => _product;
  // get all product
  Future<void> getallProduct(List<Product> productList) async {
    _product = productList;
    notifyListeners();
  }

// get latest product
  List<Product> getLatestProduct() {
    return _product.sublist(0, 3);
  }

  // get product by id
  Product getProductById(String pId) {
    return _product.firstWhere((element) => element.id == pId);
  }

  // // get product by category
  List<Product> getProductByCategory(String pCategory) {
    return _product
        .where((element) => element.catagoryName == pCategory)
        .toList();
  }

  // // get product by search
  // List<Product> getProductBySearch(String pSearch) {
  //   List<Product> _searchProduct = _product
  //       .where((element) =>
  //           element.title.toLowerCase().contains(pSearch.toLowerCase()))
  //       .toList();
  //   notifyListeners();
  //   return _searchProduct;
  // }

  // // get product by  brand
  // List<Product> getProductByBrand(String pBrand) {
  //   return _product
  //       .where((element) => element.productBrandName == pBrand)
  //       .toList();
  // }

  void startLoader() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoader() {
    isLoading = false;
    notifyListeners();
  }
}
