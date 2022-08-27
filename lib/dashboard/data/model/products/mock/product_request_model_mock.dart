import '../product_request_model.dart';

class ProductsRequestModelMock {
  static const itemsPerPageMock = 1;
  static const pageMock = 1;

  static final mock = ProductsRequestModel(
    itemsPerPage: itemsPerPageMock,
    page: pageMock,
  );
}
