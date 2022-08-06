class FoodCategory {
  final String name;
  FoodCategory({required this.name});
}

class Food {
  final String name;
  final String image;
  final String description;
  final FoodCategory category;
  final double? approximateCost;

  Food(
      {required this.name,
      required this.image,
      required this.description,
      required this.category,
      this.approximateCost});
}
