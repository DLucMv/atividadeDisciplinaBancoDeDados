import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String paymentTable = "paymentTable";
final String idColumn = "idColumn";
final String precoColumn = "precoColumn";
final String parcelaColumn = "parcelaColumn";
final String dataPagamentoColumn = "dataPagamentoColumn";
final String credorColumn = "credorColumn";


class PaymentHelper {
  static final PaymentHelper _instance = PaymentHelper.internal();

  factory PaymentHelper() => _instance;

  PaymentHelper.internal();

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
    final path = join(databasesPath, "payments.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE $paymentTable($idColumn INTEGER PRIMARY KEY, $precoColumn TEXT, $parcelaColumn TEXT,"
                  "$dataPagamentoColumn TEXT, $credorColumn TEXT)");
        });
  }

  Future<Payment> savePayment(Payment payment) async {
    Database? dbPayment = await db;
    payment.id = await dbPayment!.insert(paymentTable, payment.toMap());
    return payment;
  }

  Future<Payment?> getPayment(int id) async {
    Database? dbPayment = await db;
    List<Map> maps = await dbPayment!.query(paymentTable,
        columns: [
          idColumn,
          precoColumn,
          parcelaColumn,
          dataPagamentoColumn,
          credorColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Payment.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deletePayment(int id) async {
    Database? dbPayment = await db;
    return await dbPayment!
        .delete(paymentTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updatePayment(Payment payment) async {
    Database? dbPayment = await db;
    return await dbPayment!.update(paymentTable, payment.toMap(),
        where: "$idColumn = ?", whereArgs: [payment.id]);
  }

  Future<List> getAllPayments() async {
    Database? dbPayment = await db;
    List listMap = await dbPayment!.rawQuery("SELECT * FROM $paymentTable");
    List<Payment> listPayment = [];
    for (Map m in listMap) {
      listPayment.add(Payment.fromMap(m));
    }
    return listPayment;
  }

  Future<int?> getNumber() async {
    Database? dbPayment = await db;
    return Sqflite.firstIntValue(
        await dbPayment!.rawQuery("SELECT COUNT(*) FROM $paymentTable"));
  }

  Future close() async {
    Database? dbPayment = await db;
    dbPayment!.close();
  }
}

class Payment {
  int? id;
  String? preco;
  String? parcela;
  String? dataPagamento;
  String? credor;

  Payment();

  Payment.fromMap(Map map) {
    id = map[idColumn];
    preco = map[precoColumn];
    parcela = map[parcelaColumn];
    dataPagamento = map[dataPagamentoColumn];
    credor = map[credorColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      precoColumn: preco,
      parcelaColumn: parcela,
      dataPagamentoColumn: dataPagamento,
      credorColumn: credor,

    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Pagamento(id: $id, preço: $preco, parcela: $parcela, "
        "dataPagamento: $dataPagamento, origem: $credor)";
  }
}