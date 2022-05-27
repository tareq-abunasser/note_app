import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:note_app/features/note/presentation/cubit/note_cubit.dart';
import 'package:note_app/routes/mobile_app_pages.dart';

import '../../domain/entities/note_failure.dart';

class CriticalFailureDisplay extends StatelessWidget {
  final NoteFailure failure;

  const CriticalFailureDisplay({
    Key? key,
    required this.failure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            '😱',
            style: TextStyle(fontSize: 100),
          ),
          Text(
            failure.maybeMap(
              unableToWatchAll: (_) => "you can't watch all notes ",
              orElse: () => 'Unexpected error. \nPlease, contact support.',
            ),
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              print('Sending email!');
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Icon(Icons.mail),
                SizedBox(width: 4),
                Text('I NEED HELP'),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Get.offAndToNamed(MobileRoutes.HOME);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Icon(Icons.refresh_sharp),
                SizedBox(width: 4),
                Text('reupload page'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
