import 'package:crudmysql/views/viewdata.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  List? list;
  int index;
  DetailPage({this.list, required this.index});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //function delete
  void deleteData() {
    var url = "http://192.168.100.109/backendflutter/deletedata.php";
    http.post(
      Uri.parse(url),
      body: {
        'id': widget.list![widget.index]['id'],
      },
    );
  }

  //function showDialog
  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
        'Are you Sure want to delete ${widget.list![widget.index]['item_name']} ?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            deleteData();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ViewData(),
              ),
            );
          },
          child: Text(
            'Ok Delete!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.teal,
          ),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.list![widget.index]["item_name"]}",
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(
          20.0,
        ),
        child: Card(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                  ),
                ),
                Text(
                  widget.list![widget.index]['item_name'],
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Item Code : ${widget.list![widget.index]['item_code']}",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  "Price : ${widget.list![widget.index]['price']}",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  "Stock : ${widget.list![widget.index]['stock']}",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Edit',
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        confirm();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: Icon(
                        Icons.delete,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
