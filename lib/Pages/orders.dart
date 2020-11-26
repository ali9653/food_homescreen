import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(child: Center(child: Text("ORDERS",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),)),),
    );
  }
}
