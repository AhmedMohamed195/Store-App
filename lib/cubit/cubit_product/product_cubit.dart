// ignore_for_file: prefer_const_constructors
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/get_all_products_services.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
 
  GetAllProductsServices getAllProductsServices = GetAllProductsServices();
  List<ProductModel> searchproduct = [];
 
  Future<void> getProducts() async {
    emit(ProductLoading());
    final result = await getAllProductsServices.getAllProducts();

    result.fold(
      (failure) {
        return emit(ProductFailure(message: "Error"));
      },
      (success) {
        searchproduct = success;
        return emit(ProductSuccess(allproduct: success));
      },
    );
  }
  
  Future <void>searchforproduct(String text)async{
 emit(ProductLoading());
final List<ProductModel> filtered = searchproduct.where((product) {
      return product.title!.toLowerCase().contains(text.toLowerCase());
    }).toList();
         emit(ProductSuccess(allproduct: filtered));
  }
}
