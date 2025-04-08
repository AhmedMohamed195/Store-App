// ignore_for_file: prefer_const_constructors

import 'package:store_app/models/products_model.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final ProductModel product;
  const CustomCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 30,
                spreadRadius: 20,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                  product.title!.substring(0, 8),

                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.description!.substring(0, 8),
                          
                          style:
                              const TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: -65,
          child: Image.network(
           product.image!,
           
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}
