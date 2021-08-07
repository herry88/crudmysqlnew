import 'dart:convert';
import 'package:crudmysql/views/detailpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'inputdata.dart';

class ViewData extends StatefulWidget {
  const ViewData({Key? key}) : super(key: key);

  @override
  _ViewDataState createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  //function get api
  Future<List>? getData() async {
    final response = await http.get(
      Uri.parse(
        'http://192.168.100.109/backendflutter/getdata.php',
      ),
    );
    // print(response.body);
    return json.decode(response.body);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD MYSQL'),
      ),
      body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            if (snapshot.hasData) {
              return ItemList(list: snapshot.data);
            } else {
              return Center(
                child: Text(
                  'loading ...',
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //navigation
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => InputData(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List? list;
  const ItemList({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return Container(
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPage(list: list, index: i),
              ),
            ),
            child: Card(
              child: ListTile(
                title: Text(
                  list![i]['item_name'],
                ),
                leading: Icon(
                  Icons.widgets,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
