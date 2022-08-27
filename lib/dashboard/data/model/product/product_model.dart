import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  const ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.calories,
    required this.stock,
    required this.price,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      calories: map['calories']?.toInt() ?? 0,
      stock: map['stock']?.toInt() ?? 0,
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  final int id;
  final String name;
  final String image;
  final int calories;
  final int stock;
  final double price;

  ProductModel copyWith({
    int? id,
    String? name,
    String? image,
    int? calories,
    int? stock,
    double? price,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      calories: calories ?? this.calories,
      stock: stock ?? this.stock,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'calories': calories,
      'stock': stock,
      'price': price,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      image,
      calories,
      stock,
      price,
    ];
  }
}
