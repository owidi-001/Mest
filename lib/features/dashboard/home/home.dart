import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/features/dashboard/home/models/book_model.dart';
import 'package:mest/features/dashboard/home/provider/home_provider.dart';
import 'package:mest/features/dashboard/home/utils/shimmer_utils.dart';
import 'package:mest/features/dashboard/home/widgets/book_card_home.dart';
import 'package:mest/features/dashboard/home/widgets/book_card_home_skeleton.dart';
import 'package:mest/features/dashboard/home/widgets/category_btn.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/shared/common/utils/utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // TODO! to be dynamically generated : Food topics
  List<String> categories = [
    "All",
    "Business",
    "Food",
    "Travel",
    "Science",
    "Health",
    "sports",
    "technology"
  ];

  String title = "Browse all";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var selectedcategory = ref.watch(homeCategoryProvider);

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(left: PADDING),
          sliver: SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      title.substring(0, 1).toUpperCase() + title.substring(1),
                      style: AppFont.title.copyWith(color: AppTheme.dark),
                    ),
                    const SizedBox(
                      width: PADDING,
                    ),
                    Text(
                      "Recommended",
                      style: AppFont.normal.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    )
                  ],
                ),
                // Category horizontal scroll
                Container(
                  margin: const EdgeInsets.symmetric(vertical: PADDING),
                  height: 30.0,
                  child: ListView.builder(
                    itemBuilder: (context, index) => CategoryButton(
                      onTapCallBack: () {
                        setState(() {
                          ref
                              .read(homeCategoryProvider.notifier)
                              .setCategory(index);

                          title = categories[index];
                        });
                      },
                      text: categories[index].substring(0, 1).toUpperCase() +
                          categories[index].substring(1),
                      selected: selectedcategory == index,
                    ),
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.all(8.0),
          sliver: SliverToBoxAdapter(
            child: ShimmerWidget(child: BookCardSkeleton()),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: PADDING),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => BookCard(
                      book: Book.dummy.first,
                    ),
                childCount: Book.dummy.length * 2),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: PADDING * 5,
          ),
        )
      ],
    );
  }
}
