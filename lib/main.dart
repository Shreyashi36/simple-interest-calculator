import 'package:flutter/material.dart';
// import 'package:flutter_application_1/app_screens/home.dart';

void main() {
  runApp(MaterialApp(
    title: "Exploring UI Widgets",
    home: Scaffold(
      appBar: 
      AppBar(
        title: Text("Long List"),
        backgroundColor: Color.fromARGB(255, 65, 126, 239),
      ),
      body: getListView(),
      drawerEnableOpenDragGesture: false,
    )
    )
  );
}

Widget getListView(){
  var listView = ListView(
    children: [
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text("Landscape"),
        subtitle: Text("Beautiful View!"),
        trailing: Icon(Icons.wb_sunny),
        onTap: () => {
          debugPrint("Landscape tapped")
        },
      ),
      ListTile(
        leading: Icon(Icons.laptop_chromebook),
        title: Text("Windows"),
      ),
      ListTile(
        leading: Icon(Icons.phone),
        title: Text("Phone"),
      ),
    ],
  );
  return listView;
}