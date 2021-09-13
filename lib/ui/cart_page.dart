

import 'package:flutter/material.dart';
import 'package:foodblog/cartCalculate/calculate_price.dart';
import 'package:foodblog/object/object.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  late final ObjectFood food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout Item',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            height: 600,
            child: Consumer<Price>(
              builder: (context, co, child) {
                return ListView.builder(
                  itemCount: co.item.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: <Widget>[
                        Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child:
                                      Image.network("${co.item[i].imageUrls}")),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "${co.item[i].fname}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          IconButton(
                                            onPressed: () {
                                              co.updateProduct(co.item[i],
                                                  co.item[i].qty + 1);
                                            },
                                            icon: Icon(Icons.add),
                                          ),
                                          Text("${co.item[i].qty}".toString()),
                                          IconButton(
                                            onPressed: () {
                                              co.updateProduct(co.item[i],
                                                  co.item[i].qty - 1);
                                            },
                                            icon: Icon(Icons.remove),
                                          ),
                                          //Text(("${co.calculateTotal().toString()}")),
                                          //Text("${co.item[i].qty}*${co.item[i].fprice}".toString())

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Table(

            children: [
              TableRow(children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Consumer<Price>(builder: (context, count, child) {
                        return Text("${count.total}".toString(),style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),);
                      }),
                    ),
                  ],
                ),
                Column(
                  children: [
                    RaisedButton(
                      onPressed: () {
                        print('BUY');
                      },
                      child: Text('BUY NOW'),
                      color: Colors.redAccent,
                    )
                  ],
                )
              ]),
            ],
          ),
        ],
      )),
    );
  }
}
