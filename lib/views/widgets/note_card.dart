import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/views/screen/edit_screen.dart';

class NoteCard extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final DateTime? dateTime;

  const NoteCard(
      {super.key,
      this.color = kSecondColor,
      this.title = 'Flutter tips',
      this.subtitle =
          "I'm trying to make a subtitle of listTile and type anything",
      this.dateTime});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context){
          return const EditScreen() ;
        } ));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(15),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                style: const TextStyle(color: kPrimaryColor, fontSize: 25),
                title,
              ),
              subtitle: Text(
                  style: TextStyle(
                      color: kPrimaryColor.withOpacity(0.5), fontSize: 16),
                  subtitle),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: kPrimaryColor,
                  size: 30,
                ),
              ),
            ),
            const Text('dateTime')
          ],
        ),
      ),
    );
  }
}
