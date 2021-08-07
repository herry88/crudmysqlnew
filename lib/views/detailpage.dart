import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  List? list;
  int index;
  DetailPage({this.list, required this.index});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.list![widget.index]["item_name"]}",
        ),
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
                      onPressed: () {},
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
