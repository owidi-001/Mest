class FoodCategory {
  final String name;
  final String icon;

  FoodCategory({required this.name, required this.icon});
}

class Food {
  final String name;
  final String image;
  final String description;
  final String created;

  Food(
      {required this.name,
      required this.image,
      required this.description,
      required this.created});
}
