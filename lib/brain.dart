import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Brain {
  static double interest_calculator(
      DateTime date, double amount, double interest_rate) {
    double interest_amount = 0.0;

    int day = DateTime.now().day - date.day;
    int month = DateTime.now().month - date.month;
    int year = DateTime.now().year - date.year;

    double amount_per_month = (amount / 100) * interest_rate;

    interest_amount = ((day / 30) * amount_per_month) +
        (month * amount_per_month) +
        (12 * year * amount_per_month);

    return interest_amount;
  }

  static double total_amount(List data) {
    double sum = 0.0;

    for (int i = 0; i < data.length; i++) {
      sum += data[i].total_amount;
    }
    return sum;
  }

  static double total_interest_amount(List data) {
    double sum = 0.0;

    for (int i = 0; i < data.length; i++) {
      sum += data[i].interest_amount;
    }
    return sum;
  }

  static double total_barrowed_amount(List data) {
    double sum = 0.0;

    for (int i = 0; i < data.length; i++) {
      sum += data[i].amount;
    }
    return sum;
  }
}

class BarrowedData {
  int id = 0;

  String name = "";
  String phoneNumber = "";
  double interest_rate = 0.0;
  double amount = 0.00;

  DateTime date = DateTime.now();

  double amount_paid_back = 0.0;

  double interest_amount = 0.0;
  double total_amount = 0.0;

  BarrowedData(
      this.id,
      this.name,
      this.interest_rate,
      this.amount,
      this.date,
      this.interest_amount,
      this.total_amount,
      this.amount_paid_back,
      this.phoneNumber);

  Map<String, dynamic> to_json(BarrowedData data) {
    return {
      "name": data.name,
      "date": data.date.toString(),
      "interest_rate": data.interest_rate,
      "amount": data.amount,
      "phoneNumber": data.phoneNumber
    };
  }
}

class Database_Barrower {
  static Future<Database> get_data_base() async {
    return openDatabase(
      join(await getDatabasesPath(), "database.db"),
      onCreate: (db, version) async => await db.execute(
          '''CREATE TABLE Barrowers(id INTEGER PRIMARY KEY AUTOINCREMENT ,name TEXT,date TEXT,interest_rate TEXT,amount TEXT,phoneNumber TEXT)'''),
      version: 1,
    );
  }

  static Future write_data(BarrowedData data) async {
    final db = await get_data_base();

    final String name = data.name;
    final double amount = data.amount;
    final double interest_rate = data.interest_rate;
    final DateTime date = data.date;
    final String phoneNumber = data.phoneNumber;

    return db.rawInsert(
        '''INSERT INTO Barrowers('name','date','interest_rate','amount','phoneNumber') VALUES ('${name}','${date.toString()}', '${interest_rate}', '${amount}, '${phoneNumber}')''');

    /*db.insert(
      "Barrowers",
      {
        "id": 1,
        "name": data.name,
        "date": data.date.toString(),
        "interest_rate": data.interest_rate,
        "amount": data.amount
      },
    );*/
  }

  static Future get_data() async {
    final db = await get_data_base();
    List<Map<String, dynamic>> data_list = await db.query("Barrowers");
    final List<BarrowedData> list = [];
    for (int i = 0; i < data_list.length; i++) {
      list.add(BarrowedData(
          data_list[i]["id"],
          data_list[i]['name'],
          double.parse(data_list[i]['interest_rate']),
          double.parse(data_list[i]['amount']),
          DateTime.parse(data_list[i]['date']),
          Brain.interest_calculator(
              DateTime.parse(data_list[i]['date']),
              double.parse(data_list[i]['amount']),
              double.parse(data_list[i]['interest_rate'])),
          (Brain.interest_calculator(
                  DateTime.parse(data_list[i]['date']),
                  double.parse(data_list[i]['amount']),
                  double.parse(data_list[i]['interest_rate'])) +
              double.parse(data_list[i]['amount'])),
          0,
          data_list[i]['phoneNumber']));
    }

    return list;
  }

  static void delete_database_item(int id) async {
    Database db = await get_data_base();
    String table = "Barrowers";
    db.rawDelete("DELETE FROM $table WHERE id = ?", [id]);
  }
}
