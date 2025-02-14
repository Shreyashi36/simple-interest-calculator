import 'package:flutter/material.dart ';
import 'package:flutter/rendering.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Interest Calculator",
      home: SIForm(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        // colorScheme: ColorScheme.fromSwatch().copyWith(
        // secondary: Colors.indigoAccent,
      ),
    )
  );
}

class SIForm extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm>{

  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  final _minimumPadding = 5.0;
  var _currentItemSelected = '';
  var _formKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();      
  TextEditingController termController = TextEditingController();

  var displayResult = '';
  

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.titleLarge!;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
        backgroundColor: Colors.blueAccent,
      ),  
///Form
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding * 2),
        child: Column(
          children: [
            getImageAsset(),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              style: textStyle,
              controller: principalController,
              validator: (String? value){
                if(value!.isEmpty){
                  return 'Please enter principal amount';
                }
              },
              decoration: InputDecoration(
                labelText: 'Principal',
                hintText: 'Enter Principal e.g. 50000',
                labelStyle: textStyle,
                //style of error, mane colour, bujhe ne
                errorStyle: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 15.0
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
              ),
            ),
          ),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextFormField(
              keyboardType: TextInputType.number,
              controller: roiController,
              validator: (String? value){
                if(value!.isEmpty){
                  return 'Please enter rate of Interest';
                }
              },
              style: textStyle,
              decoration: InputDecoration(
                labelText: 'Rate of Interest',
                hintText: 'Enter Rate of Interest e.g. 10',
                labelStyle: textStyle,
                errorStyle: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 15.0
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
              ),
            ),
           ),  

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(children: 
             [
              Expanded(
                child: TextFormField(
                keyboardType: TextInputType.number,
                controller: termController,
                validator: (String? value){
                if(value!.isEmpty){
                  return 'Please enter rate of Interest';
                  }
                },
                style: textStyle,
                decoration: InputDecoration(
                  labelText: 'Term',
                  hintText: 'Enter Term e.g. 5',
                  labelStyle: textStyle,
                  errorStyle: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 15.0
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )
                ),
              )),
              Container(
                width: _minimumPadding * 5,

              ),
              Expanded( child: DropdownButton<String>(
                items: _currencies.map((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValueSelected){
                  // Your code to execute, when a menu item is selected from dropdown
                  setState(() {
                    this._currentItemSelected = newValueSelected!;  
                  });
                },
                value: _currentItemSelected,
                )
                )
             
             
             
             ],),
           ), 
          //Calculate and Reset Button          
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColorDark,
                  ),
                  // ignore: deprecated_member_use
                  child: Text('Calculate', textScaleFactor: 1.5,),
                  onPressed: (){
                    setState(() {
                      if (_formKey.currentState!.validate()){
                        this.displayResult = _calculateTotalReturns();
                      }
                    });
                  }
                  )),
              
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColorLight,
                  ), 
                  // ignore: deprecated_member_use
                  child: Text('Reset', textScaleFactor: 1.5,),
                  onPressed: (){
                    _reset();
                  }
                  ))
             
             ],),
           ), 
           Padding(padding: EdgeInsets.all(_minimumPadding * 2),
           child: Text(this.displayResult, style: textStyle,)

           )
          ],
        ),
      )
      ),
    );
  }

  Widget getImageAsset(){
    AssetImage assetImage = AssetImage('assets/images/money.png');
    Image image = Image(image: assetImage, width: 125.0, height: 125.0,);
    return Container(child: image, margin: EdgeInsets.all(_minimumPadding * 10),);
  }
  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result = 'After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

void _reset(){
  principalController.text = '';
  roiController.text = '';
  termController.text = '';
  displayResult = '';
  _currentItemSelected = _currencies[0];
  
}



}
