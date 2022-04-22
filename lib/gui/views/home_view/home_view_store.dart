
import 'package:shopbeer/data/models/products_model.dart';

class StoreHomeView {

  List<ProductsModel> productsModel = [];

  static final StoreHomeView _singleton = StoreHomeView._();
  factory StoreHomeView() => _singleton;
  StoreHomeView._();
}
