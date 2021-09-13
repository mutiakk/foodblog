import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodblog/cartCalculate/calculate_price.dart';
import 'package:foodblog/object/object.dart';
import 'package:foodblog/ui/cart_page.dart';
import 'package:provider/provider.dart';

class ProductDesc extends StatelessWidget {
  const ProductDesc({Key? key, required this.food}) : super(key: key);

  final ObjectFood food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.fname),
        backgroundColor: Colors.grey,
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckOutPage()),
                  );
                },
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(children: <Widget>[
            Column(
              children: <Widget>[
                Image.network(food.imageUrls),
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                Table(
                  children: [
                    TableRow(children: [
                      Column(
                        children: [
                          Text(
                            'Berat',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            ':',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            food.fberat,
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ]),
                    TableRow(children: [
                      Column(
                        children: [
                          Text(
                            'Rasa',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            ':',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Pedas',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ]),
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(5)),
            Text(
              'Description',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Padding(padding: EdgeInsets.all(5)),
            /**Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Text(food.describe)),**/
            Padding(
              padding: EdgeInsets.all(0),
              child: Consumer<Price>(builder: (context, count, child) {
                return Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          count.add(food);
                        },
                        icon: Icon(Icons.add_shopping_cart))
                  ],
                );
              }),
            )
          ]),
        ),
      ),
    );
  }
}
