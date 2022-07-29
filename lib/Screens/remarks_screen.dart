import "package:flutter/material.dart";

class ListTest extends StatefulWidget {
  @override
  _ListTestState createState() => _ListTestState();
}

class _ListTestState extends State<ListTest> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late int _id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("List"),
      ),
      body: ListView(
          children: List.generate(10, (int index) {
        return ListTile(
          title: Text("item#$index"),
          onTap: () {
            setState(() {
              _id = index; //if you want to assign the index somewhere to check
            });
            _scaffoldKey.currentState!.showSnackBar(
                SnackBar(content: Text("You clicked item number $_id")));
          },
        );
      })),
    );
  }
}
