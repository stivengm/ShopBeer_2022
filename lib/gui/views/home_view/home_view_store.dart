
import 'package:shopbeer/data/models/products_model.dart';

class StoreHomeView {

  List<ProductsModel> productsModel = [];
  List<ProductsModel> productsCerveza = [];
  List<ProductsModel> productsAguardiente = [];
  List<ProductsModel> productsRon = [];

  static final StoreHomeView _singleton = StoreHomeView._();
  factory StoreHomeView() => _singleton;
  StoreHomeView._();
}
