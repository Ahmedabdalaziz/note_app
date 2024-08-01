import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/add_note/add_note_cubit.dart';
import 'package:note_app/views/widgets/add_note.dart';

class ButtomSheet extends StatefulWidget {
  const ButtomSheet({super.key});

  @override
  State<ButtomSheet> createState() => _ButtomSheetState();
}

class _ButtomSheetState extends State<ButtomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocListener<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            const SnackBar(
              content: Text("Failed To Add Note"),
            );
          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },
        child: const SingleChildScrollView(child: AddNote()),
      ),
    );
  }
}
