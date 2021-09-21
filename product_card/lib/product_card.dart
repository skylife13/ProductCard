import 'dart:ui';

import 'package:flutter/material.dart';

const Color firstColor = Color(0xffF44336);
const Color secondColor = Color(0xff4CAF50);

class ProductCard extends StatelessWidget {
  final String imageURL;
  final String name;
  final String price;
  final int quantity;
  final String? notification;
  final VoidCallback onAddCartTap;
  final VoidCallback onIncTap;
  final VoidCallback onDecTap;

  ProductCard(
      {this.imageURL = "",
      this.name = "",
      this.price = "",
      this.quantity = 0,
      this.notification = "",
      required this.onAddCartTap,
      required this.onDecTap,
      required this.onIncTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //notif
        AnimatedContainer(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(left: 10, right: 10),
          width: 130,
          height: 250,
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    offset: Offset(1, 1),
                    color: Colors.black.withOpacity(0.3))
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              color: secondColor),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text((notification ?? " ")),
          ),
        ),
        Container(
          width: 150,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(1, 1))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(imageURL), fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(name),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Text(price),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  //tombol +,-
                  Container(
                    width: 140,
                    height: 30,
                    decoration:
                        BoxDecoration(border: Border.all(color: firstColor)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: onIncTap,
                            child: Container(
                              width: 30,
                              height: 30,
                              color: firstColor,
                              child: Icon(
                                Icons.add,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(quantity.toString()),
                          GestureDetector(
                            onTap: onDecTap,
                            child: Container(
                              width: 30,
                              height: 30,
                              color: firstColor,
                              child: Icon(
                                Icons.remove,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ]),
                  ),
                  SizedBox(
                      width: 140,
                      child: RaisedButton(
                        onPressed: onAddCartTap,
                        color: firstColor,
                        child: Icon(Icons.add_shopping_cart,
                            size: 18, color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16))),
                      ))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
