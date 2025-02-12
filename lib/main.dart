import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "Stateful App Example",
      home: FavCity(),
      debugShowCheckedModeBanner: false,
    )
  );
}
class FavCity extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _FavCityState();
  }
}

class _FavCityState extends State<FavCity>{
  String nameCity = "";
  var _currencies = ['Rupees', 'Dollars', 'Pounds', 'Others'];
  var _currentItemSelected = 'Rupees';
  @override
  Widget build(BuildContext context) {
    debugPrint("FavCity widget is created");
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful App Example")
      ),
      body: Container(
        child: Column(children: [
          TextField(
            onChanged: (String userInput){
              setState(() {
                nameCity = userInput;
                debugPrint("setState is called, widget is re-rendered");
              });
            nameCity = userInput;
            }, 
          ),
          DropdownButton(
            items: _currencies.map((String dropDownStringItem){
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(), 
            onChanged: (String? newValueSelected){
              //code to execute, when a menu item is selected
              setState(() {
                this._currentItemSelected = newValueSelected!;
              });
            },
            value: _currentItemSelected,
          ),

         

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "Your best city is $nameCity",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ]),
      )
    );
  }
  //build method
}