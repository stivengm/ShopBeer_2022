import 'package:shopbeer/data/models/on_boarding_data_base_model.dart';
import 'package:shopbeer/data/models/products_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DataBaseApp {

  static final DataBaseApp instance = DataBaseApp._init();

  static Database? _database;

  DataBaseApp._init();

  Future<Database> get db async {

    if (_database != null) return _database!;

    _database = await _initDB('test3.db');

    return _database!;

  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE favorites (
        id $idType,
        name $textType,
        img $textType,
        description $textType,
        typeProductId $integerType,
        price $textType,
        cantidad $integerType
      )
    ''');
    await db.execute('''
      CREATE TABLE cart(
        id $idType,
        name $textType,
        img $textType,
        description $textType,
        typeProductId $integerType,
        price $textType,
        cantidad $integerType
      )
    ''');
    await db.execute('''
      CREATE TABLE onBoarding(
        id $idType,
        show $textType,
        description $textType
      )
    ''');
  }

  // Favoritos
  Future<List<ProductsModel>> readAllFavorites() async {
    final db = await instance.db;

    final result = await db.query('favorites');
    return result.map((json) => ProductsModel.fromJson(json)).toList();
  }

  Future<ProductsModel> createFavorite(ProductsModel product) async {
    final db = await instance.db;
    final prod = product.copyWith(cantidad: 0);

    final id = await db.insert('favorites', prod.toJson());
    return product.copyWith(id: id);
  }

  Future<int> deleteFavorites(int id) async {
    final db = await instance.db;

    return await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id]
    );
  }


  // OnBoarding
  Future<List<OnBoardingDataBaseModel>> readOnBoarding() async {
    final db = await instance.db;

    final result = await db.query('onBoarding');
    return result.map((json) => OnBoardingDataBaseModel.fromJson(json)).toList();
  }

  Future<OnBoardingDataBaseModel> onBoardingViewer(OnBoardingDataBaseModel onBoarding) async {
    final db = await instance.db;

    final id = await db.insert('onBoarding', onBoarding.toJson());
    return onBoarding.copyWith(id: id);
  }



  // Carrito de compras
  Future<List<ProductsModel>> readAllCartProduct() async {
    final db = await instance.db;

    final result = await db.query('cart');
    return result.map((json) => ProductsModel.fromJson(json)).toList();
  }

  Future<int> createCartItem(ProductsModel product) async {
    final db = await instance.db;
    final response = await validExistItem(db, product.id!);
    // ignore: unrelated_type_equality_checks
    if (response == false) {
      final id = await db.insert('cart', product.toJson());
      product.copyWith(id: id);
      return id;
    } else {
      return 0;
    }
  }

  Future<bool> validExistItem(Database db, int id) async {
    final resp = await db.query('cart', where: 'id = ?', whereArgs: [id]);
    return resp.isNotEmpty ? true : false;
  }

  Future<int> deleteItemCart(int id) async {
    final db = await instance.db;

    return await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id]
    );
  }

  Future close() async {
    final db = await instance.db;
    db.close();
  }

}