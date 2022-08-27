import '../../../core/data/api_manager.dart';
import '../model/products/product_request_model.dart';

class ProductsRequest with Request, GetRequest {
  const ProductsRequest(this.requestModel);

  @override
  final ProductsRequestModel requestModel;

  @override
  String get path => 'products';
}
