import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/note_cubit/note_cubit.dart';
import 'package:note_app/cubit/note_cubit/note_cubit.dart';
import 'package:note_app/views/widgets/note_card.dart';

class ListviewCards extends StatefulWidget {
  const ListviewCards({super.key});

  @override
  State<ListviewCards> createState() => _ListviewCardsState();
}

class _ListviewCardsState extends State<ListviewCards> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state is NoteSuccess ? state.notes.length : 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: NoteCard(),
            );
          },
        );
      },
    );
  }
}
