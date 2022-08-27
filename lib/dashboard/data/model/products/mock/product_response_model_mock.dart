import 'package:troylab/dashboard/data/model/product/mock/product_model_mock.dart';

import '../../pagination_meta/mock/pagination_meta_mock.dart';
import '../product_response_model.dart';

class ProductsResponseModelMock {
  static final mock = random;

  static ProductsResponseModel get random => ProductsResponseModel(
        products: ProductModelMock.randomList(),
        paginationMeta: PaginationMetaMock.mock,
      );
}
