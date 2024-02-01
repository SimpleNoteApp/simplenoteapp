import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/models/note.model.dart';
import 'package:simplenoteapp/src/modules/noteedit/noteeditor.controller.dart';
import 'package:simplenoteapp/src/widgets/buttons.widgets.dart';

AppBar homePageAppBar(BuildContext context) {
  return AppBar(
    title: const AddNewNoteButton(),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 10),
        child: SettingsButton(),
      ),
    ],
  );
}

AppBar noteEditorAppBar(BuildContext context, NoteEditController controller) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: SaveNoteButton(controller: controller),
      ),
    ],
  );
}

AppBar noteDetailAppBar(BuildContext context, NoteModel note) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: EditNoteButton(
          note: note,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: DeleteNoteButton(
          note: note,
        ),
      ),
    ],
  );
}
