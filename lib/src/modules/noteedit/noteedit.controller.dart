import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteedit.state.dart';

class NoteEditController with ChangeNotifier {
  NoteEditState state;

  NoteEditController({required this.state});
}
