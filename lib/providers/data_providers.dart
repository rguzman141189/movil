import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class DataProvider {
  List<dynamic> datos = [];

  DataProvider() {
    // datosJson();
  }

  Future<List<dynamic>> datosJson() async {
    final response = await rootBundle.loadString('data/data.json');
    Map dataMap = json.decode(response);
    datos = dataMap['datas'];

    return datos;
  }
}

final dataProvider = DataProvider();
