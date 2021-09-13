import 'package:flutter/cupertino.dart';
import 'package:foodblog/object/object.dart';

class Price with ChangeNotifier {
  List<ObjectFood> _product = [];

  double _price = 0.0;
  var c=0;

  void add(ObjectFood food) {
    int index = _product.indexWhere((i) => i.id == food.id);
    print(index);
    if (index != -1)
      updateProduct(food, food.qty + 1);
    else {
      _product.add(food);
      calculateTotal();
      notifyListeners();
    }
  }

  void remove(ObjectFood food) {
    int index = _product.indexWhere((i) => i.id == food.id);
    _product[index].qty = 1;
    _product.removeWhere((item) => item.id == food.id);
    calculateTotal();
    notifyListeners();
  }

  void clearCart() {
    _product.forEach((f) => f.qty = 1);
    _product = [];
    notifyListeners();
  }

  int get count {
    return _product.length;
  }

  double get total {
    return _price;
  }

  List<ObjectFood> get item {
    return _product;
  }

  calculateTotal() {
    _price = 0;
    _product.forEach((f) {
      _price += f.fprice * f.qty;
    });
  }

  void updateProduct(ObjectFood food, qty) {
    int index = _product.indexWhere((i) => i.id == food.id);
    _product[index].qty = qty;
    if (_product[index].qty == 0) remove(food);
    calculateTotal();
    notifyListeners();
  }

}
