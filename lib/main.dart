import 'package:flutter/material.dart';
// import 'package:flutter_application_1/app_screens/home.dart';

void main() {
  runApp(MaterialApp(
    title: "Exploring UI Widgets",
    home: Scaffold(
      appBar: AppBar(title: Text("Long List"),),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint("FAB Clicked");
        },
        child: Icon(Icons.add),
        tooltip: "Add One More Item",
        ),
      )
    )
  );
}
void showSnackbar(BuildContext context, String item){
  var snackBar = SnackBar(
    content: Text("You just tapped $item"),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: (){
        debugPrint("Performing dummy UNDO operation");
      },
    ),
    
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}



List<String> getListElements() {
  var items = List<String>.generate(100, (counter) => "Item $counter");
  return items;
}

Widget getListView(){
  var items = getListElements();
  var listView = ListView.builder(
    itemCount: items.length,
    itemBuilder:(context, indexx){
      return ListTile(
        title: Text(items[indexx]),
        onTap: () {
          showSnackbar(context, items[indexx]);
        }
      );
    }
  );
  return listView;
}