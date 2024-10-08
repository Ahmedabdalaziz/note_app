part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class NoteLoading extends NoteState {}

final class NoteSuccess extends NoteState {
  List<NoteModel> notes;

  NoteSuccess(this.notes);
}

final class NoteFailure extends NoteState {
  final String errMessage;

  NoteFailure(this.errMessage);
}
