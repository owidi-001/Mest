import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mest/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isReadmore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/home_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: AppTheme.whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppTheme.gradient,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton.icon(
                              onPressed: () => {},
                              icon: const Icon(
                                Icons.coffee_maker_outlined,
                                color: AppTheme.primary,
                                size: 16,
                              ),
                              label: const Text(
                                "Tea",
                                style: TextStyle(
                                    color: AppTheme.secondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Text(
                              "|",
                              style: TextStyle(
                                  color: AppTheme.secondary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextButton.icon(
                              onPressed: () => {},
                              icon: const Icon(
                                Icons.fastfood,
                                color: AppTheme.primary,
                                size: 16,
                              ),
                              label: const Text(
                                "Snack",
                                style: TextStyle(
                                    color: AppTheme.secondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Text(
                              "|",
                              style: TextStyle(
                                  color: AppTheme.secondary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextButton.icon(
                              onPressed: () => {},
                              icon: const Icon(
                                Icons.food_bank_outlined,
                                color: AppTheme.primary,
                                size: 16,
                              ),
                              label: const Text(
                                "Main",
                                style: TextStyle(
                                    color: AppTheme.secondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Boneless Chicken",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,color: AppTheme.primary),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildDescription(
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            // toggle the bool variable true or false
                            isReadmore = !isReadmore;
                          });
                        },
                        child: Text(
                          (isReadmore ? 'Read Less' : 'Read More'),
                          style: const TextStyle(color: AppTheme.primary),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.5,
                        child: ElevatedButton(
                            onPressed: () {
                              // Navigator.pushReplacementNamed(
                              //     context, AppRoute.login);
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                              shape: const StadiumBorder(),
                              backgroundColor: AppTheme.secondary,
                            ),
                            child: const Text("Eat this")),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => {},
        backgroundColor: AppTheme.primary,
        foregroundColor: AppTheme.whiteColor,
        child: const Icon(CupertinoIcons.shuffle_thick),
      ),
    );
  }

  Widget buildDescription(String text) {
    // if read more is false then show only 3 lines from text
    // else show full text
    final lines = isReadmore ? null : 8;
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppTheme.secondary,
      ),
      maxLines: lines,
      // overflow properties is used to show 3 dot in text widget
      // so that user can understand there are few more line to read.
      overflow: isReadmore ? TextOverflow.visible : TextOverflow.fade,
    );
  }
}
