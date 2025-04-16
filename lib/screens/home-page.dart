// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/cubit_product/product_cubit.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomTextAppBarHome(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
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
                height: screenHeight * 0.08,
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
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: screenWidth > 600 ? 3 : 2,
                        childAspectRatio: screenWidth > 600 ? 1.2 : 1,
                        crossAxisSpacing: screenWidth * 0.03,
                        mainAxisSpacing: screenHeight * 0.1,
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
