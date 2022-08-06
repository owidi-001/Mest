import 'package:flutter/material.dart';
import 'package:mest/widgets/input_fields.dart';

class NewFood extends StatefulWidget {
  const NewFood({Key? key}) : super(key: key);

  @override
  State<NewFood> createState() => _NewFoodState();
}

class _NewFoodState extends State<NewFood> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Text("Guide text"),
            Form(
                child: Center(
              child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          makeInput(label: "Name",),
                          makeInput(label: "Description",obsureText: true),
                          makeInput(label: "Cost",obsureText: true),
                        ],
                      ),
                    )
              ),
            )
          ],
        ),
      ),
    ));
  }
}
