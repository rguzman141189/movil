import 'package:flutter/material.dart';
import 'package:mv21/providers/data_providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: dataProvider.datosJson(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        print(snapshot.data);
        return ListView(
          children: listItems(snapshot.data),
        );
      },
    );
  }

  List<Widget> listItems(List<dynamic> data) {
    final List<Widget> datosList = [];
    data.forEach((res) {
      final widget = ListTile(
        title: Text(res['nombre']),
        leading: Icon(Icons.account_circle, color: Colors.red),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.red),
        onTap: () {},
      );
      datosList..add(widget)..add(Divider());
    });
    return datosList;
  }
}
