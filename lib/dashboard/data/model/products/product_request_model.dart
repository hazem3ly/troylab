import '../../../../core/data/api_manager.dart';

class ProductsRequestModel extends RequestModel {
  ProductsRequestModel({
    this.itemsPerPage,
    this.page,
    RequestProgressListener? progressListener,
  }) : super(progressListener);

  final int? itemsPerPage;
  final int? page;

  @override
  Future<Map<String, dynamic>> toMap() async {
    final map = <String, dynamic>{};
    if (itemsPerPage != null) map['itemsPerPage'] = itemsPerPage;
    if (page != null) map['page'] = page;
    return map;
  }

  @override
  List<Object?> get props => [
        itemsPerPage,
        page,
      ];
}
