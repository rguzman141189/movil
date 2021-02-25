import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class DataProvider {
  List<dynamic> datos = [];

  DataProvider() {
    datosJson();
  }
  datosJson() {
    rootBundle.loadString('data/data.json').then((data) {
      // print(data);

      Map dataMap = json.decode(data);
      print(dataMap['nameApp']);
      datos = dataMap['datas'];
    });
  }
}

final dataProvider = DataProvider();
