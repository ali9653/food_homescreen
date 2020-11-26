import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Container(child: Center(child: Text("CATEGORIES",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),)),),

    );
  }
}
