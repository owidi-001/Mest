import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/database/helper.dart';
import 'package:mest/models/food.model.dart';
import 'package:mest/provider/food_provider.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/utils.dart';
import 'package:mest/widgets/category_tile.dart';
import 'package:mest/widgets/food_card.dart';
import 'package:mest/widgets/nav_drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var provider = ref.watch(foodProvider);

    List<Food> menu = List.generate(10, (index) => Food.empty());

    // List of category types
    List<FoodCategory> categories = List.generate(
        3,
        (index) => FoodCategory(
            name: "Snacks", icon: const Icon(Icons.food_bank_rounded)));

    List<Color> colors = [AppTheme.red, AppTheme.gold, AppTheme.blue];

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: PADDING, vertical: PADDING),
            height: MediaQuery.of(context).size.width * 0.4,
            decoration: const BoxDecoration(
              color: AppTheme.gold,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(PADDING * 4),
                bottomRight: Radius.circular(PADDING * 4),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: PADDING * 1.2,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppTheme.red,
                        radius: PADDING * 3,
                        child: Padding(
                          padding: const EdgeInsets.all(PADDING / 4),
                          child: Image.asset(
                            "assets/images/avatar.png",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: PADDING,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "John Doe",
                            style: AppFont.title,
                          ),
                          SizedBox(
                            height: PADDING / 2,
                          ),
                          Text(
                            "Architect",
                            style: AppFont.normal,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: (() {
                                  // To open up to profile edit
                                }),
                                child: const CircleAvatar(
                                  backgroundColor: AppTheme.red,
                                  child: Icon(
                                    Icons.edit,
                                    color: AppTheme.light,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: PADDING, vertical: PADDING),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Menu Category",
                  style: AppFont.subtitle,
                ),
                CircleAvatar(
                  backgroundColor: AppTheme.green,
                  child: IconButton(
                    icon: const Icon(
                      Icons.calendar_month_rounded,
                      color: AppTheme.light,
                    ),
                    onPressed: (() {}),
                  ),
                )
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(PADDING),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 3,
              (context, index) {
                return CategoryTile(
                  group: categories[index],
                  color: colors[index],
                );
              },
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: PADDING),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Picks",
                  style: AppFont.subtitle,
                ),
                TextButton(
                    onPressed: (() {}),
                    child: const Text(
                      "See All",
                      style: AppFont.subtitle,
                    ))
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
              horizontal: PADDING, vertical: PADDING),
          sliver: SliverGrid(
            delegate:
                SliverChildBuilderDelegate(childCount: 10, (context, index) {
              return FoodCard(food: menu[index]);
            }),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: PADDING / 2,
                crossAxisSpacing: PADDING / 2,
                mainAxisExtent: 250),
          ),
        )
      ],
    );
  }
}
