import '../../../../../core/faker/app_faker.dart';
import '../product_model.dart';

class ProductModelMock {
  static final mock = random();

  static ProductModel random() {
    return ProductModel(
      id: AppFaker.randomId,
      name: AppFaker.name,
      calories: AppFaker.randomId,
      image: AppFaker.randomImage,
      price: AppFaker.randomDouble,
      stock: AppFaker.randomId,
    );
  }

  static List<ProductModel> randomList() => List.generate(
        AppFaker.randomInt(20, min: 14),
        (index) => random(),
      );
}
