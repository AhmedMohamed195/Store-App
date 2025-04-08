// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/cubit/product_cubit.dart';
import 'package:store_app/screens/drawer/drawer-page.dart';
import 'package:store_app/widget/CustomTextFormFieldThree.dart';
import 'package:store_app/widget/custom-card.dart';
import 'package:store_app/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:store_app/widget/custom-text-appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<ProductModel> allProducts = [];
  List<ProductModel> filteredProducts = [];

  @override
  void initState() {
    super.initState();
  }

  // Filter the products based on the search input
  void _filterProducts(String query) {
    context.read<ProductCubit>().searchforproduct(query);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: CustomTextAppBarHome()),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormFieldThree(
                hinttext: " Search products...",
                mycontroller: searchController,
                onchanged: (query) {
                  context.read<ProductCubit>().searchforproduct(query);
                },
              ),
              SizedBox(
                height: 70,
              ),
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductSuccess) {
                    if (state.allproduct.isEmpty) {
                      return Center(child: Text("No products found"));
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.allproduct.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 100,
                      ),
                      itemBuilder: (context, index) {
                        return CustomCard(
                          product: state.allproduct[index],
                        );
                      },
                    );
                  } else if (state is ProductFailure) {
                    return Text(state.message);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}






















//////خاصه اثناء الضغط على الصوره
//  onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => ItemDetiles(
//                           data: items[i],
//                         ),
//                       ));
//                     },
 
