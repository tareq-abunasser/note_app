import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/features/note/domain/repositories/i_note_repository.dart';
import 'package:note_app/features/note/presentation/cubit/note_cubit.dart';
import 'package:note_app/features/note/presentation/widgets/custom_action_button.dart';
import 'package:note_app/features/note/presentation/widgets/no_notes.dart';
import 'package:note_app/features/note/presentation/widgets/notes_overview_widget.dart';
import '../../../../../../routes/mobile_app_pages.dart';
import '../../../../injection.dart';

class HomePage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            lazy: false,
            create: (context) => NoteCubit(
                  getIt<INoteRepository>(),
                )..watchAllNotes()),
      ],
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          title: Text(
            "My Notes",
            style: GoogleFonts.openSans(fontWeight: FontWeight.w400),
          ),
          centerTitle: true,
        ),
        body: const NotesOverviewBody(),
        floatingActionButton: const CustomFloatingActionButton(),
      ),
    );
  }
}
