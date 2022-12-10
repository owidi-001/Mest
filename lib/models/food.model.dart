class FoodCategory {
  final String name;
  final String icon;

  FoodCategory({required this.name, required this.icon});
}

class Food {
  final int id;
  final String name;
  final String image;
  final String description;
  final String created;

  Food(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.created});

  factory Food.fromMap(Map<String, dynamic> item) {
    // TODO! make sure it aligns

    String name =
        item["name"].toString().length > item["image"].toString().length
            ? item["image"]
            : item["name"];
    String image =
        item["name"].toString().length > item["image"].toString().length
            ? item["name"]
            : item["image"];

    return Food(
        id: item["id"],
        name: name,
        image: image,
        description: item["description"],
        created: item["created"]);
  }

  factory Food.empty() {
    return Food(
        id: -1,
        name: "Boneless Chiken",
        image: "assets/images/1.png",
        description:
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
        created: "created");
  }
}
