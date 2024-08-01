import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text("Edite",style: TextStyle(fontSize: 30),),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: kSecondColor.withOpacity(0.05),
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
        body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: CustomTextField(
                                color: kSecondColor,
                                labelText: 'title',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: CustomTextField(
                                color: kSecondColor,
                                labelText: 'Edite Your Notes',
                                maxLines: 9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            )));
  }
}
