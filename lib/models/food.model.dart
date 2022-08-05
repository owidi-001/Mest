class Food {
  final String name;
  final String image;
  final String? description;
  final double? approximateCost;

  Food(
      {required this.name,
      required this.image,
      this.description,
      this.approximateCost});
}
