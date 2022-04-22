import 'package:shopbeer/data/models/products_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DataBaseApp {

  static final DataBaseApp instance = DataBaseApp._init();

  static Database? _database;

  DataBaseApp._init();

  Future<Database> get db async {

    if (_database != null) return _database!;

    _database = await _initDB('shop_beer_app.db');

    return _database!;

  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // TODO: Se tiene que crear una tabla para favoritos, guardar información de la persona y la sesión logueada (CREO).
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
        price $textType
      )
    ''');
  }

  Future<List<ProductsModel>> readAllFavorites() async {
    final db = await instance.db;

    final result = await db.query('favorites');
    return result.map((json) => ProductsModel.fromJson(json)).toList();
  }

  Future<int> update(int id) async {
    final db = await instance.db;

    return await db.delete(
      'favorites',
      where: 'id = ?',
      whereArgs: [id]
    );
  }

  Future<ProductsModel> createFavorite(ProductsModel product) async {
    final db = await instance.db;

    final id = await db.insert('favorites', product.toJson());
    return product.copyWith(id: id);
  }

  Future close() async {
    final db = await instance.db;
    db.close();
  }

}