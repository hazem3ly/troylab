import 'package:equatable/equatable.dart';

class PaginationMeta extends Equatable {
  const PaginationMeta({
    required this.page,
    required this.count,
  });

  factory PaginationMeta.fromMap(Map<String, dynamic> map) {
    return PaginationMeta(
      page: int.parse((map['page'] ?? 0).toString()),
      count: int.parse((map['count'] ?? 0).toString()),
    );
  }

  final int page;
  final int count;

  Map<String, dynamic> toMap() => {
        'page': page,
        'count': count,
      };

  int? nextPage(int currentCount) {
    if (count > currentCount) {
      return page + 1;
    } else if (count <= currentCount) {
      return null;
    } else {
      return 1;
    }
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        page,
        count,
      ];
}
