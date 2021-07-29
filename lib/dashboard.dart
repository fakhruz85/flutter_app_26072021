import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Dashboard'),
         centerTitle: true,
       ),
       body: ListView(
         shrinkWrap: true,
         padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
         children: <Widget>[
           ProductBox(
             name: 'Dart',
             description: 'Dart is programming language',
             price: 300,
             image: 'pngwing.com.png',
           ),
           ProductBox(
             name: 'Dart',
             description: 'Dart is programming language',
             price: 300,
             image: 'pngwing.com.png',
           ),
           ProductBox(
             name: 'Dart',
             description: 'Dart is programming language',
             price: 300,
             image: 'pngwing.com.png',
           )
         ],
       ),
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox(
    {Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image})
     : super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/images/'+ image),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      this.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(this.description),
                    Text('Price : '+ this.price.toString())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}