import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodblog/ui/desc_product.dart';
import 'package:foodblog/object/object.dart';


class ListFood extends StatelessWidget {
  //inisialisasi variabel
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Makanan Goceng'),
        leading: Icon(Icons.food_bank_outlined, color: Colors.red),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.red,
            onPressed: () {
                print('icon cart');
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.settings, color: Colors.red),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container( //Harus container biar bisa ketemu child lagi
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: foodList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final ObjectFood food = foodList[index];
                    return Stack(// Membuat lapisan
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 10, 20),
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(food.fphoto),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(// memposisikan sebuah kotak
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Text(
                'Recommended',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: foodList.length,
                itemBuilder: (context, index) {
                  final ObjectFood food = foodList[index];
                  return InkWell( //buat ngedirect ke page
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context){
                      return ProductDesc(
                      food:food,
                      );
                      }));
                    },
                    child: ClipRRect( borderRadius: BorderRadius.circular(20), //ngasi clip gambar wadahmya gambar
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child:  Image.network(food.imageUrls)),
                            Expanded(child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    food.fname, style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(food.fprice.toString())
                                ],
                              ),
                            )),
                          ],
                        ),
                      )
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
