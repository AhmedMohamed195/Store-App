// ignore_for_file: prefer_const_constructors

import 'package:store_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:store_app/screens/product-datail.dart';

class CustomCard extends StatelessWidget {
  final ProductModel product;
  const CustomCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () async {
        FocusScope.of(context).unfocus();
        await Future.delayed(Duration(milliseconds: 300));
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product)));
      },
      child: Stack(
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
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.title!.substring(0, 15),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${product.description!.substring(0, 12)}...",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenWidth * 0.05),
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
            right: screenWidth * 0.05,
            top: -screenHeight * 0.08,
            child: Image.network(
              product.image!,
              height: screenWidth * 0.25,
              width: screenWidth * 0.25,
            ),
          ),
        ],
      ),
    );
  }
}
