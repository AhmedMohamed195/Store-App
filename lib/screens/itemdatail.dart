// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ItemDetiles extends StatefulWidget {
  final data;
  const ItemDetiles({super.key, this.data});

  @override
  State<ItemDetiles> createState() => _ItemDetilesState();
}

class _ItemDetilesState extends State<ItemDetiles> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shop_outlined,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "E-Commerce ",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Text(
              "App ",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            )
          ],
        )),
      ),
      body: Text(""),
    );
  }
}
