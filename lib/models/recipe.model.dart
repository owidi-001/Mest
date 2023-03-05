// class Recipe {
//   String name;
//   List<Ingredient> ingredients;
//   List<Step> steps;
//   MealGroup category;
//   String? image;

//   Recipe(
//       {required this.name,
//       required this.ingredients,
//       required this.steps,
//       required this.category,
//       this.image});

//   static Recipe dummy = Recipe(
//       name: "Salad",
//       ingredients: List.generate(
//           4,
//           (index) =>
//               Ingredient(description: "Bananas", quantity: 2, metric: "pcs")),
//       category: MealGroup(
//         name: "Snack",
//       ),
//       steps: List.generate(
//           5, (index) => Step(description: "Chop 2 pieces of bananas")));
// }

// class Ingredient {
//   String description;
//   double? quantity;
//   String? metric;

//   Ingredient({required this.description, this.quantity, this.metric});
// }

// class Step {
//   String description;
//   Step({required this.description});
// }

// class MealGroup {
//   String name;

//   MealGroup({required this.name});

//   /// Could be breakfast, lunch or supper, snack
// }
