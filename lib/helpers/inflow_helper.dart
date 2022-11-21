import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String inflowTable = "inflowTable";
final String idColumn = "idColumn";
final String precoColumn = "precoColumn";
final String parcelaColumn = "parcelaColumn";
final String dataRecebimentoColumn = "dataRecebimentoColumn";
final String origemColumn = "origemColumn";


class InflowHelper {
  static final InflowHelper _instance = InflowHelper.internal();

  factory InflowHelper() => _instance;

  InflowHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "inflows1.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE $inflowTable($idColumn INTEGER PRIMARY KEY, $precoColumn TEXT, $parcelaColumn TEXT,"
                  "$dataRecebimentoColumn TEXT, $origemColumn TEXT)");
        });
  }

  Future<Inflow> saveInflow(Inflow inflow) async {
    Database? dbInflow = await db;
    inflow.id = await dbInflow!.insert(inflowTable, inflow.toMap());
    return inflow;
  }

  Future<Inflow?> getInflow(int id) async {
    Database? dbInflow = await db;
    List<Map> maps = await dbInflow!.query(inflowTable,
        columns: [
          idColumn,
          precoColumn,
          parcelaColumn,
          dataRecebimentoColumn,
          origemColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Inflow.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteInflow(int id) async {
    Database? dbInflow = await db;
    return await dbInflow!
        .delete(inflowTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateInflow(Inflow inflow) async {
    Database? dbInflow = await db;
    return await dbInflow!.update(inflowTable, inflow.toMap(),
        where: "$idColumn = ?", whereArgs: [inflow.id]);
  }

  Future<List> getAllInflows() async {
    Database? dbInflow = await db;
    List listMap = await dbInflow!.rawQuery("SELECT * FROM $inflowTable");
    List<Inflow> listInflow = [];
    for (Map m in listMap) {
      listInflow.add(Inflow.fromMap(m));
    }
    return listInflow;
  }

  Future<int?> getNumber() async {
    Database? dbInflow = await db;
    return Sqflite.firstIntValue(
        await dbInflow!.rawQuery("SELECT COUNT(*) FROM $inflowTable"));
  }

  Future close() async {
    Database? dbInflow = await db;
    dbInflow!.close();
  }
}

class Inflow {
  int? id;
  String? preco;
  String? parcela;
  String? dataRecebimento;
  String? origem;

  Inflow();

  Inflow.fromMap(Map map) {
    id = map[idColumn];
    preco = map[precoColumn];
    parcela = map[parcelaColumn];
    dataRecebimento = map[dataRecebimentoColumn];
    origem = map[origemColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      precoColumn: preco,
      parcelaColumn: parcela,
      dataRecebimentoColumn: dataRecebimento,
      origemColumn: origem,

    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Recebimento(id: $id, preço: $preco, parcela: $parcela, "
        "dataRecebimento: $dataRecebimento, origem: $origem)";
  }
}