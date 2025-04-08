import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/services/failure.dart';

class GetAllProductsServices {
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      List<dynamic> data = await Api().get(
        url: "https://fakestoreapi.com/products",
      );

      // print(data);
      List<ProductModel> prductlist = [];
      for (int i = 0; i < data.length; i++) {
        prductlist.add(ProductModel.fromJson(data[i]));
      }
      print(prductlist);
      return right(prductlist);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
          return left(ServerFailure(e.toString())); 
    }
  }
}
