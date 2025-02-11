import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            color: const Color.fromARGB(255, 138, 175, 242),
            child: Column(
              children: [
                //row 1
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Air India",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 35.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 233, 22, 22)),
                  )),
                  Expanded(
                      child: Text(
                    "From kolkata to bangalore via Hyderabad",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        color: const Color.fromARGB(255, 181, 5, 245)),
                  ))
                ],
              ),
              //row 2
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Vistara Airlines",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 35.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  )),
                  Expanded(
                      child: Text(
                    "From Goa to Chennai via blr",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ))
                ],
              ),
              //row 3
              FlightImageAsset()
            ]
          )
        )
      );
  }
}

class FlightImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    AssetImage assetImage = AssetImage('assets/images/plane.jpg');
    Image image = Image(image: assetImage);
    return Container(child: image);
  }
}
// class FlightImage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Image.asset('assets/images/plane.jpg', width: 250.0, height: 250.0),
//     );
//   }
// }
