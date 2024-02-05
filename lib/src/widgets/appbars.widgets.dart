import 'package:flutter/material.dart';

import 'package:simplenoteapp/src/modules/noteedit/noteeditor.controller.dart';
import 'package:simplenoteapp/src/widgets/buttons.widgets.dart';
import 'package:simplenoteapp/src/models/note.model.dart';

// This function returns an AppBar for the home page.
// The AppBar has a title which is a button for adding a new note.
// It also has a settings button in its actions.
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

// This function returns an AppBar for the note editor page.
// The AppBar has a save button in its actions which saves the note using the provided NoteEditController.
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

// This function returns an AppBar for the note detail page.
// The AppBar has an edit button and a delete button in its actions.
// The edit button navigates to the note editor page for the provided note.
// The delete button shows a dialog asking for confirmation to delete the provided note.
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
