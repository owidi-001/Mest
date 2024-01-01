import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mest/features/dashboard/home/models/book_model.dart';
import 'package:mest/features/dashboard/home/utils/shimmer_utils.dart';
import 'package:mest/features/dashboard/settings/components/library/widgets/library_book_card.dart';
import 'package:mest/features/dashboard/settings/components/library/widgets/library_book_card_skeleton.dart';
import 'package:mest/shared/data/models/book/user_book.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/shared/common/utils/utils.dart';

class Library extends ConsumerStatefulWidget {
  const Library({super.key});

  @override
  ConsumerState<Library> createState() => _LibraryState();
}

class _LibraryState extends ConsumerState<Library> {
  @override
  Widget build(BuildContext context) {
    var provider = List.generate(
      Book.dummy.length,
      (index) => UserBook(book: Book.dummy[index], pagesRead: 1),
    );

    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: Text("My Library", style: AppFont.title),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("You have ${provider.length} items in Library",
                    style: AppFont.normal
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.5),
                    borderRadius: BorderRadius.circular(PADDING / 2)),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search your books",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.8)),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(PADDING),
                    isDense: true,
                    suffixIcon: IconButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppTheme.dark)),
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: AppTheme.light,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(
                color: Colors.black38,
                thickness: 2,
              ),
            ),
            // spacer
            const SliverPadding(padding: EdgeInsets.all(8.0)),
            const SliverToBoxAdapter(
              child: ShimmerWidget(child: LibraryBookCardSkeleton()),
            ),
            // List view
            provider.isEmpty
                ? //check if customer has any items in cart
                SliverToBoxAdapter(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: const BoxDecoration(
                        color: Colors.white54,
                      ),
                      child: const Center(
                        child: Text("Damn, this library is empty!",
                            style: AppFont.title),
                      ),
                    ),
                  )
                : //Show library items list
                SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(((
                        context,
                        index,
                      ) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Column(
                            children: [
                              LibraryBookCard(
                                userBook: provider[index],
                              ),
                              index != provider.length - 1
                                  ? const Divider(
                                      color: AppTheme.dark,
                                    )
                                  : Container()
                            ],
                          ),
                        );
                      }), childCount: provider.length),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
