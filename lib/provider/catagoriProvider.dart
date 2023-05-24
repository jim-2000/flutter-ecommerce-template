import 'package:app/models/app/catagoriModel.dart';
import 'package:flutter/cupertino.dart';

class CatagoriProvider extends ChangeNotifier {
  bool isLoading = false;

  List<Catagori> _catagories = [];
  List<Catagori> product() => _catagories;
  // get all product
  List<Catagori> get allCatagories => _catagories;
  //
  Future<void> getallCatagories(List<Catagori> catagoriList) async {
    _catagories = catagoriList;
    notifyListeners();
  }

  void startLoader() {
    if (!isLoading) {
      isLoading = true;
      notifyListeners();
    }
  }

  void stopLoader() {
    if (isLoading) {
      isLoading = false;
      notifyListeners();
    }
  }
}
