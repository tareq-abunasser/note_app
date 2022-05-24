import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/note/presentation/cubit/note_cubit.dart';
import 'package:note_app/features/note/presentation/widgets/no_notes.dart';

import 'critical_failure_display_widget.dart';
import 'error_note_card.dart';
import 'note_widget.dart';

class NotesOverviewBody extends StatelessWidget {
  const NotesOverviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loadSuccess: (state) {
            return state.notes.isEmpty
                ? const NoNotes()
                : ListView.builder(
                    itemBuilder: (context, index) {
                      final note = state.notes[index];
                      if (note.failureOption.isSome()) {
                        return ErrorNoteCard(note: note);
                      } else {
                        return NoteWidget(note: note);
                      }
                    },
                    itemCount: state.notes.length,
                  );
          },
          loadFailure: (state) {
            return CriticalFailureDisplay(
              failure: state.noteFailure,
            );
          },
        );
      },
    );
  }
}
