class FoodCategory {
  final String name;
  final String icon;

  FoodCategory({required this.name,required this.icon});
}

class Food {
  final String name;
  final String image;
  final String description;
  final FoodCategory category;
  // ignore: non_constant_identifier_names
  final double? cost_estimate;

  Food(
      {required this.name,
      required this.image,
      required this.description,
      required this.category,
      // ignore: non_constant_identifier_names
      this.cost_estimate});
}
