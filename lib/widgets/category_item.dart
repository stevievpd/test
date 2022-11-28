// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/category.dart';
import '../providers/products.dart';
import 'package:http/http.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categoryData = Provider.of<Categories>(context, listen: false);
    var productData = Provider.of<Products>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      color: Color.fromARGB(255, 47, 48, 60),
      child: InkWell(
        splashColor: Colors.blue.shade100,
        onTap: () {
          productData.productItemsByCate(categoryData.id!.toInt());
        },
        child: Padding(
          padding: EdgeInsets.all(13),
          child: Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.network(categoryData.icon.toString()),
                ),
              ),
              SizedBox(width: 20),
              Text(
                categoryData.title.toString(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
