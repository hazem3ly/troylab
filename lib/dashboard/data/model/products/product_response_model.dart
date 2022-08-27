import 'package:equatable/equatable.dart';
import 'package:troylab/dashboard/data/model/product/product_model.dart';

import '../../../../core/data/api_manager.dart';
import '../pagination_meta/pagination_meta.dart';

class ProductsResponseModel extends Equatable implements ResponseModel {
  const ProductsResponseModel({
    required this.products,
    required this.paginationMeta,
  });

  factory ProductsResponseModel.fromMap(Map<String, dynamic> map) {
    return ProductsResponseModel(
      products: List<ProductModel>.from(
          map['docs']?.map((x) => ProductModel.fromMap(x))),
      paginationMeta: PaginationMeta.fromMap(map),
    );
  }

  final List<ProductModel> products;
  final PaginationMeta paginationMeta;

  Map<String, dynamic> toMap() => {
        'docs': products.map((x) => x.toMap()).toList(),
        'page': paginationMeta.toMap()['page'],
        'count': paginationMeta.toMap()['count'],
      };

  ProductsResponseModel copyWith({
    List<ProductModel>? products,
    PaginationMeta? paginationMeta,
  }) {
    return ProductsResponseModel(
      products: products ?? this.products,
      paginationMeta: paginationMeta ?? this.paginationMeta,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        products,
        paginationMeta,
      ];
}
