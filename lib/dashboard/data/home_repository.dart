import 'package:dartz/dartz.dart';
import 'package:troylab/dashboard/data/model/products/product_request_model.dart';
import 'package:troylab/dashboard/data/request/products_request.dart';

import '../../core/data/api_manager.dart';
import '../../core/flavors.dart';
import 'model/products/mock/product_response_model_mock.dart';
import 'model/products/product_response_model.dart';

class HomeRepository {
  HomeRepository(this._apIsManager);

  final APIsManager _apIsManager;

  Future<Either<Failure, ProductsResponseModel>> home(
      ProductsRequestModel requestModel) async {
    if (mockApp || true) { // for testing 
       return Future.delayed(const Duration(milliseconds: 500)).then(
        (value) => Right(ProductsResponseModelMock.random),
      );
    } else {
      final response = await _apIsManager.send(
        request: ProductsRequest(requestModel),
        responseFromMap: (map) => ProductsResponseModel.fromMap(map),
      );
      return response;
    }
  }
}
