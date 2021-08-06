import 'package:crudmysql/views/viewdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InputData extends StatefulWidget {
  const InputData({Key? key}) : super(key: key);

  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  TextEditingController controllerCode = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();

  void addData() {
    var url = "http://192.168.100.109/backendflutter/adddata.php";

    http.post(Uri.parse(url), body: {
      "item_code": controllerCode.text,
      "item_name": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                    hintText: "Item Code",
                    labelText: "Item Code",
                  ),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                    hintText: "Item Name",
                    labelText: "Item Name",
                  ),
                ),
                new TextField(
                  controller: controllerPrice,
                  decoration: new InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                  ),
                ),
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                    hintText: "Stock",
                    labelText: "Stock",
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                ),
                new ElevatedButton(
                  child: new Text(
                    "ADD DATA",
                  ),
                  onPressed: () {
                    addData();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ViewData(),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
