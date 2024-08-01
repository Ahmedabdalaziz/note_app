import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubit/add_note/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      debugPrint('Saved!');

      NoteModel addNote = NoteModel(
        title: titleController.text,
        subTitle: subTitleController.text,
        dateTime: DateTime.now().toString(),
        color: Colors.blue.value,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(addNote);
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomTextField(
                  controller: titleController,
                  color: kPrimaryColor,
                  labelText: 'Title',
                  validator: validateTitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  controller: subTitleController,
                  color: kPrimaryColor,
                  labelText: 'Add Your Notes',
                  maxLines: 7,
                  validator: validateNotes,
                ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) {
                  if (state is AddNoteLoading) {
                    return Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
                        color: kPrimaryColor,
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: const Center(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: kSecondColor,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: onSubmit,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadiusDirectional.all(Radius.circular(15)),
                          color: kPrimaryColor,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: const Center(
                          child: Text(
                            "Add",
                            style: TextStyle(fontSize: 20, color: kSecondColor),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

String? validateNotes(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your notes';
  }
  return null;
}

String? validateTitle(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a title';
  }
  return null;
}
