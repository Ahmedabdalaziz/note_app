import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  addNote(NoteModel note) {
    var noteBox = Hive.box<NoteModel>(kNoteBox);
    List<NoteModel> notes = noteBox.values.toList();
    emit(NoteSuccess(notes));
  }
}
