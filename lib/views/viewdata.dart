import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        'http://192.168.42.210/backendphpnative/getdata.php',
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
              return ItemList(list : snapshot.data);
            } else {
              return Center(
                child: Text(
                  'loading...',
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({ Key? key, List? list }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
