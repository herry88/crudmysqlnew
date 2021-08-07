import 'package:crudmysql/views/viewdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InputData extends StatefulWidget {
  const InputData({Key? key}) : super(key: key);

  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  //deklarasikan form
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerStock = TextEditingController();

  //function add data
  void addData() {
    var url = "http://192.168.100.109/backendflutter/adddata.php";

    http.post(Uri.parse(url), body: {
      //deklarasi form
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
        title: Text('Input Data Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: controllerCode,
                  decoration: InputDecoration(
                    hintText: 'Item Code',
                    labelText: 'Item Code',
                  ),
                ),
                TextField(
                  controller: controllerName,
                  decoration: InputDecoration(
                    hintText: 'Item Name',
                    labelText: 'Item Name',
                  ),
                ),
                TextField(
                  controller: controllerPrice,
                  decoration: InputDecoration(
                    hintText: 'Price',
                    labelText: 'Price',
                  ),
                ),
                TextField(
                  controller: controllerStock,
                  decoration: InputDecoration(
                    hintText: 'Stock',
                    labelText: 'Stock',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    addData();
                    //redired
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ViewData(),
                      ),
                    );
                  },
                  child: Text(
                    'Save Data',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
