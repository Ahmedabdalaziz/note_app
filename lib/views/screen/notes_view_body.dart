import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubit/note_cubit/note_cubit.dart';
import 'package:note_app/views/widgets/button_sheet.dart';
import 'package:note_app/views/widgets/custom_appbar.dart';
import 'package:note_app/views/widgets/listview_cards.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: kSecondColor,
                context: context,
                builder: (context) {
                  return const ButtomSheet();
                });
          },
          child: const Icon(
            Icons.add,
            color: kSecondColor,
          ),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    child: CustomAppbar(
                      title: 'Notes',
                      icon: Icons.search,
                    )),
                Expanded(child: ListviewCards()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
