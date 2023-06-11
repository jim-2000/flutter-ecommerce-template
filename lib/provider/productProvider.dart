import 'package:app/models/app/productModel.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Product> _product = [];
  List<Product> _catproduct = [];
  List<Product> product() => _product;
  List<Product> catagoriproduct() => _catproduct;
  // get all product
  Future<void> getallProduct(List<Product> productList) async {
    _product = productList;
    notifyListeners();
  }

  // get all product
  Future<void> getProductBycatagori(List<Product> productList) async {
    _catproduct = productList;
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

  // // get product by  brand
  List<Product> catProduct(String cid) {
    return _product.where((element) => element.catagoryName == cid).toList();
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
